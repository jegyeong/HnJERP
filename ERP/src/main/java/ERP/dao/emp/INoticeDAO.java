package ERP.dao.emp;

import java.util.List;

import org.springframework.stereotype.Repository;

import vo.PagingVO;
import vo.emp.NoticeVO;

@Repository
public interface INoticeDAO {

	public int insertNotice(NoticeVO vo); // 공지사항 등록
	public int selectNoticeCount(PagingVO<NoticeVO> pagingVO); //  공지사항 페이징
	public List<NoticeVO> selectNoticeList(PagingVO<NoticeVO> pagingVO); //공지사항 목록 
	public NoticeVO selectNotice(int notice_no); // 공지사항 하나 선택했을 떄
	public void incrementHit(int notice_no); //조회수
	public int updateNotice(NoticeVO vo); // 공지사항 수정
	public int deleteNotice(NoticeVO vo); // 공지사항 삭제 
}
