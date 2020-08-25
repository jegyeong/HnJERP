package ERP.service.emp;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

import ERP.dao.emp.IAttatchDAO;
import ERP.dao.emp.INoticeDAO;
import enums.ServiceResult;
import exception.DataNotFoundException;
import vo.PagingVO;
import vo.emp.AttatchVO;
import vo.emp.NoticeVO;

@Service
public class NoticeServiceImpl implements INoticeService {

	@Inject
	INoticeDAO NoticeDAO;
	@Inject
	IAttatchDAO attatchDAO;
	
	@Inject
	WebApplicationContext context;
	@Value("#{appInfo.attatchPath}")
	String attatchPath;
	File saveFolder;
	
	
	@PostConstruct
	public void init() {
		String realPath = context.getServletContext().getRealPath(attatchPath);
		saveFolder = new File(realPath);
		if(!saveFolder.exists()) saveFolder.mkdirs();
	}
	
	// 파일 삭제??
	private void deleteBinary(String[] delAttSaveNames) {
		if(delAttSaveNames == null || delAttSaveNames.length==0) return;
		try {
			for(String delName  : delAttSaveNames) {
				if(delName != null)
				FileUtils.forceDelete(new File(saveFolder, delName));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	// 첨부 파일 
	public int processAttatches(NoticeVO notice) {
		int[] delNos = notice.getDeleteAttatches();
		int rowcnt = 0;
		String[] delAttSaveNames = null;
		if(delNos!=null  && delNos.length>0) {
			delAttSaveNames = new String[delNos.length];
			for(int i=0; i<delNos.length; i++) {
				delAttSaveNames[i] = attatchDAO.selectAttatch(delNos[i]).getAtt_savename();
			}
			rowcnt = attatchDAO.deleteAttatchs(notice);
		}
		List<AttatchVO> attatchList = notice.getAttatchList();
				if(attatchList != null && !attatchList.isEmpty()) {
					rowcnt += attatchDAO.insertAttatchs(notice);
					
					try {
						for(AttatchVO attatch : attatchList) {
							attatch.getRealFile().transferTo(new File(saveFolder, attatch.getAtt_savename()));
						}
					} catch (IllegalStateException | IOException e){
						throw new RuntimeException(e);
					}
				}
				deleteBinary(delAttSaveNames);
				return rowcnt;
	}
	
	//공지사항 등록 
	@Transactional
	@Override
	public ServiceResult createNotice(NoticeVO vo) {
		int rowcnt = NoticeDAO.insertNotice(vo); // db에 추가 하는거 
		rowcnt += processAttatches(vo);
		
		ServiceResult result = null;
		
		if(rowcnt >0) {
			result = ServiceResult.OK; // 등록
		}else {
			result = ServiceResult.FAIL; //실패
		}
		
		return result;
	}

	// 공지사항 카운트 
	@Override
	public int readNoticeCount(PagingVO<NoticeVO> pagingVO) {
		return NoticeDAO.selectNoticeCount(pagingVO);
	}

	// 공지사항 목록 
	@Override
	public List<NoticeVO> readNoticeList(PagingVO<NoticeVO> pagingVO) {
		return NoticeDAO.selectNoticeList(pagingVO);
	}
	
	// 공지사항 하나 읽어오는거 
	@Override
	public NoticeVO readNotice(int notice_no) {
		NoticeVO notice = NoticeDAO.selectNotice(notice_no); // 글번호를 db에 저장 
		if(notice == null) { // 공지사항 불러올게 업으면 
			throw new DataNotFoundException(notice_no + "에 해당하는 글이 없습니다.");
		} // 공지사항 불러올게 있으면 
		NoticeDAO.incrementHit(notice_no); // 조회수 증가 시키는거 
		return notice;

	}

	// r공지사항 수정 하는거 
	@Override
	public ServiceResult modifyNotice(NoticeVO vo) {
		NoticeVO saveNotice = readNotice(vo.getNotice_no());
		ServiceResult result = null;
		// 사원번호가 맞으면 삭제 가능하도록 
		if(saveNotice.getEmp_no().equals(vo.getEmp_no())) {
			int rowcnt = NoticeDAO.updateNotice(vo);
			if(rowcnt > 0) {
				processAttatches(vo);
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	// 삭제 하느느거 
	@Transactional
	@Override
	public ServiceResult removeNotice(NoticeVO vo) {
		NoticeVO saveNotice = readNotice(vo.getNotice_no());
		
		ServiceResult result = null;
		//
		if(saveNotice.getEmp_pass().equals(vo.getEmp_pass())) {
			List<AttatchVO> attatchList = saveNotice.getAttatchList();
			String[] delAttNames =  null;
			if(attatchList!=null && !attatchList.isEmpty()) {
				delAttNames = new String[attatchList.size()];
				for(int i=0; i<delAttNames.length; i++) {
					delAttNames[i] = attatchList.get(i).getAtt_savename();
				}
			}
			processAttatches(vo);
			int rowcnt = NoticeDAO.deleteNotice(vo);
			if(rowcnt > 0) {
				deleteBinary(delAttNames);
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAIL;
			}
		}else{
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	// 파일 다운받는거 
	@Override
	public AttatchVO downloadAttatch(int att_no) {
		AttatchVO attatch = attatchDAO.selectAttatch(att_no);
		if(attatch == null) {
			throw new DataNotFoundException(att_no+"파일이 없습니다.");
		}
		attatchDAO.incrementDownCount(att_no);
		return attatch;
	}

}
