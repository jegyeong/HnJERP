package security;

import java.util.Collection;
import java.util.HashSet;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import vo.emp.EmployeeVO;

public class MemberUserDetail extends User {
	public static Collection<GrantedAuthority> generateAuthorities(Collection<String> roles) {
		Collection<GrantedAuthority> authorities = new HashSet<>();
		for(String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}

	public MemberUserDetail(EmployeeVO realUser) {
		super(realUser.getEmp_no(), realUser.getEmp_pass(), 
				true, true, true, true, generateAuthorities(realUser.getEmp_roles()));
		this.realUser = realUser;
	}
	
	private EmployeeVO realUser;
	
	public EmployeeVO getRealUser() {
		return realUser;
	}
}
