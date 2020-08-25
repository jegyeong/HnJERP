package listener;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.tiles.request.ApplicationAccess;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.WebSocketSession;

import vo.emp.EmployeeVO;

/**
 * Application Lifecycle Listener implementation class TotalEventListener
 *
 */
@WebListener
public class TotalEventListener implements ServletContextListener, HttpSessionListener, ServletRequestListener, HttpSessionAttributeListener{
	private Logger logger = LoggerFactory.getLogger(TotalEventListener.class);

//	4. application scope
//	5. session scope 
//	6. request scope
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
	}
	
	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		
	}
	
//	3. request lifecycle
	@Override
	public void requestInitialized(ServletRequestEvent sre) {
		logger.info("{} 로부터 {} 요청 발생.", sre.getServletRequest().getRemoteAddr(), new Date());
		long startTime = System.currentTimeMillis();
		sre.getServletRequest().setAttribute("startTime", startTime);
	}
	
	@Override
	public void requestDestroyed(ServletRequestEvent sre) {
		long endTime = System.currentTimeMillis();
		long startTime = (Long) sre.getServletRequest().getAttribute("startTime");
		logger.info("{} 요청의 소요 시간 {}ms", sre.getServletRequest().getRemoteAddr(), endTime-startTime);
	}
	
//	2. session lifecycle
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		logger.info("{} 세션 생성", se.getSession().getId());
		
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		logger.info("{} 세션 소멸", se.getSession().getId());
		HttpSession session = se.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("authUser");
		if(emp!=null)
		if(emp.getDep_no2()!=null) {
			HashSet<EmployeeVO> set = (HashSet<EmployeeVO>) session.getServletContext().getAttribute(emp.getDep_no2());
			set.remove(emp);
		}
		
	}
//	1. context lifecycle
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		logger.info("{} 컨텍스트 시작", sce.getServletContext().getContextPath());
		ServletContext application = sce.getServletContext();
		Map<String,List<WebSocketSession>> map = new HashMap<String, List<WebSocketSession>>();
		map.put("구매부서", new ArrayList<WebSocketSession>());
		map.put("인사부서", new ArrayList<WebSocketSession>());
		map.put("회계부서", new ArrayList<WebSocketSession>());
		map.put("영업부서", new ArrayList<WebSocketSession>());
		map.put("생산부서", new ArrayList<WebSocketSession>());
		map.put("자재부서", new ArrayList<WebSocketSession>());
		application.setAttribute("socket", map);
		application.setAttribute("cPath", application.getContextPath());
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		logger.info("{} 컨텍스트 소멸", sce.getServletContext().getContextPath());
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

	
}
