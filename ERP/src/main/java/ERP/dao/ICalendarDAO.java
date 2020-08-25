package ERP.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import vo.CalendarVO;
import vo.PagingVO;

@Repository
public interface ICalendarDAO {

	public int insertCalendar(CalendarVO vo); // 일정추가
	public int updateCalendar(CalendarVO vo); // 일정수정
	public List<CalendarVO> selectCalendarList(CalendarVO vo);
	public int deleteCalendar(CalendarVO vo);  // 일정삭제
	public CalendarVO selectCalendar(int calendar_no);  // 하나 선택했을경우 
	
	
}
