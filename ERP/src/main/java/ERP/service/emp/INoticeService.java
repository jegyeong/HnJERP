package ERP.service.emp;

import java.util.List;

import enums.ServiceResult;
import vo.PagingVO;
import vo.emp.AttatchVO;
import vo.emp.NoticeVO;

public interface INoticeService {
	

	public ServiceResult createNotice(NoticeVO vo);
	public int readNoticeCount(PagingVO<NoticeVO> pagingVO);
	public List<NoticeVO> readNoticeList(PagingVO<NoticeVO> pagingVO);
	public NoticeVO readNotice(int notice_no);
	public ServiceResult modifyNotice(NoticeVO vo);
	public ServiceResult removeNotice(NoticeVO vo);
	public AttatchVO downloadAttatch(int att_no);
}
