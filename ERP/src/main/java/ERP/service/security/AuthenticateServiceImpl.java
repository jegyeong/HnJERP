package ERP.service.security;

import javax.inject.Inject;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import ERP.dao.emp.IEmployeeDAO;
import security.MemberUserDetail;
import vo.emp.EmployeeVO;

@Service
public class AuthenticateServiceImpl implements UserDetailsService{
	@Inject
	IEmployeeDAO dao;
	
	@Inject
	MessageSourceAccessor accessor;
	
	
	//Wrapper로 만듬
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeVO member = dao.selectEmployee(username);	//사원VO 가져오기
		if(member==null) {
			//DigestAuthenticationFilter.usernameNotFound : 프로퍼티 파일에 있는 Key값
			String message = accessor.getMessage("DigestAuthenticationFilter.usernameNotFound", new Object[] {username});
			throw new UsernameNotFoundException(message);
		}
		return new MemberUserDetail(member);
	}
}







