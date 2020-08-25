package security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
										Authentication authentication) throws ServletException, IOException {
		//Principal : 신원정보(id를 비롯한 기타 로그인시 조회된 개인정보를 가진 객체)
		MemberUserDetail mem = (MemberUserDetail) authentication.getPrincipal();	//인증객체
		//이미 authUser를 사용하던 중이므로 그 이름들을 변경하지 않기 위해, 멤버객체를 정해줌
		request.getSession().setAttribute("authUser", mem.getRealUser());
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
