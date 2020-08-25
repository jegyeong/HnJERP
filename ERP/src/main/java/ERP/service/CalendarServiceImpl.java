package ERP.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import ERP.dao.ICalendarDAO;
import enums.ServiceResult;
import vo.CalendarVO;
import vo.PagingVO;

@Service
public class CalendarServiceImpl implements ICalendarService {

	@Inject
	WebApplicationContext container;
	ServletContext application;
	@Inject
	ICalendarDAO dao;
	
	// 일정등록 
	@Transactional
	@Override
	public ServiceResult createCalendar(CalendarVO vo) { // 일정등록
		
		 ServiceResult result = null;
		
		 int sc = dao.insertCalendar(vo);
		 
		 if(sc > 0) { // insert 되었으면  ok
			 result = ServiceResult.OK;
		 }else {
			 result = ServiceResult.FAIL;
		 }
		return result;
	}

	// 일정 수정 
	@Override
	public ServiceResult modifyCalendar(CalendarVO vo) {
		return dao.updateCalendar(vo)>0? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<CalendarVO> readCalendarList(CalendarVO vo) {
		return dao.selectCalendarList(vo);
	}

	// 일정 삭제 
	@Override
	public ServiceResult removeCalendar(CalendarVO vo) {
		return dao.deleteCalendar(vo)>0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	
	// 일정 하나 불러오는거 
	@Override
	public CalendarVO readCalendar(int calendar_no) {
		return dao.selectCalendar(calendar_no);
	}

}
