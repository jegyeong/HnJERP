package ERP.service.security;

import enums.ServiceResult;
import vo.emp.EmployeeVO;

/**
 * 인증 처리에 사용할 로직을 가진 Business Logic Layer(Service Layer)
 *
 */
public interface IAuthenticateService {
	/**
	 * 인증 로직
	 * @param member
	 * @return 존재여부 확인(NOTEXIST), 비번을 통한 인증 (OK, INVALIDPASSWORD)
	 */
	public ServiceResult authenticated(EmployeeVO member);
}





