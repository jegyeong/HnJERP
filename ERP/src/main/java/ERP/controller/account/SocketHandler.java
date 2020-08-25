package ERP.controller.account;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import vo.emp.EmployeeVO;

public class SocketHandler extends TextWebSocketHandler{
	//※클라이언트 연결 된 후
	//WebSocketSession을 매개 변수로 받고 클라이언트가 연결된 후 
	//해당 클라이언트의 정보를 가져와 연결확인 작업을한다.
	//클라이언트의 세션을 세션 저장 리스트에 add()로 추가 한다.
	@Inject
	ServletContext application;
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			EmployeeVO vo = (EmployeeVO) session.getAttributes().get("authUser");
			if(vo!=null) {
				List<WebSocketSession> list = ((Map<String, List<WebSocketSession>>)application.getAttribute("socket")).get(vo.getDep_no2());
				if(list!=null)
					list.add(session);
			}
		}
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			EmployeeVO vo = (EmployeeVO) session.getAttributes().get("authUser");
			if(vo!=null) {
				List<WebSocketSession> list = ((Map<String, List<WebSocketSession>>)application.getAttribute("socket")).get(vo.getDep_no2());
				if(list!=null)
					list.remove(session);
			}
		}

	// 웹 소켓 서버로 데이터를 전송했을 경우
	//연결된 모든 클라이언트에게 메시지 전송 : 리스트
	//연결된 모든 사용자에게 보내야 하므로 for문으로 세션리스트에 있는 모든 세션들을 돌면서
	// sendMessage()를 이용해 데이터를 주고 받는다.
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			String text = message.getPayload();
			List<WebSocketSession> list = ((Map<String, List<WebSocketSession>>)application.getAttribute("socket")).get(text.substring(0,4));
			if(list!=null) 
				for(WebSocketSession s : list)
					s.sendMessage(message);
		}
		
		
		@Override // onerror
		public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
			// TODO Auto-generated method stub
			super.handleTransportError(session, exception);
		}
}
