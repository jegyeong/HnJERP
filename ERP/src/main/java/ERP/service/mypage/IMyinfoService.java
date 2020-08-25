package ERP.service.mypage;

import java.util.List;

import enums.ServiceResult;
import vo.emp.EmployeeVO;

public interface IMyinfoService {

	// 내정보 
	public ServiceResult modifyMyinfo(EmployeeVO vo);
	
	public EmployeeVO readMyinfo(EmployeeVO vo);
	
	public ServiceResult creatModalCert(EmployeeVO vo); // 사원 자격증 선택

	public ServiceResult modifyPassword(EmployeeVO vo);  // 비번변경

}
