package ERP.service;

import java.util.List;

import enums.ServiceResult;
import vo.CalendarVO;

/**
 * @author 연지은
 * @since 2020. 6. 29
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                   수정자               수정내용
 * --------     --------    ----------------------
 * 2020. 6. 29        작성자명               최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * 
 */
public interface ICalendarService { // 일정등록 수정 삭제

	public ServiceResult createCalendar(CalendarVO vo);  // 일정 등록
	public ServiceResult modifyCalendar(CalendarVO vo);  // 일정 수정
	public List<CalendarVO> readCalendarList(CalendarVO vo);
	public ServiceResult removeCalendar(CalendarVO vo); // 일정삭제
	public CalendarVO readCalendar(int calendar_no);  // 일정 하나 가져오는거
	
}
