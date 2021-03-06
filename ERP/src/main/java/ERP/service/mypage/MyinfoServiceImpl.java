package ERP.service.mypage;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import ERP.dao.IMyinfomationDAO;
import ERP.dao.emp.IEmployeeDAO;
import enums.ServiceResult;
import exception.DataNotFoundException;
import vo.emp.EmployeeVO;

@Service
public class MyinfoServiceImpl implements IMyinfoService {

	@Inject
	WebApplicationContext container;
	ServletContext application;
	
	@Value("#{appInfo.empImgePath}") // src/main/resources appInfo.proterties에 등록된 파일을 저장할 경로를 
	String empImgePath;
	File saveFolder;
	
	@Inject
	private IMyinfomationDAO dao;
	@Inject
	private IEmployeeDAO empdao;
	
	
	// 이미지 파일 
	@PostConstruct
	public void init() {
		application = container.getServletContext();
		String folderPath = application.getRealPath(empImgePath); // 이미지의 경로를 받아서 저장 폴더 변수 명에 넣어주는거 
		saveFolder = new File(folderPath);
		if(!saveFolder.exists()) {saveFolder.mkdirs(); }
		// 폴더가 존재 하지 않으면  saveFoler파일를 폴더를 생성하는거ㅓ   
		//mkdirs --> c드라이브에 temp라는 폴더가 없는 경우temp폴더를 생성하고 그안에 log폴더를 생성 
	}
	
	
	
	private void processImage(EmployeeVO emp) { // 파일 저장하는거 
		try {
			MultipartFile emp_img = emp.getEmp_img();
			if(emp_img != null) { // 이미지가 있으면 
				emp.saveFile(saveFolder);
			}
		}catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	// 내 정보 수정 
	@Transactional
	@Override
	public ServiceResult modifyMyinfo(EmployeeVO vo) {
		ServiceResult result = null;
		
		int cnt = dao.updateMyInfo(vo); //db에 vo넣어줘서 update해주는거 
		
		if(cnt>0) {
			result = ServiceResult.OK;
			
//			AutheticateServiceImpl service =   AutheticateServiceImpl();
			 
			
			
		}else {
			result = ServiceResult.FAIL;
		}
		
		
		// 자격증 추가 사항 insert
		// 1. 추가사항이 있으면
		if((vo.getEmpCertVOList()!=null)||(vo.getCareerVOList()!=null)||(vo.getEduVOList()!=null)) {
			// xml에서 pk 만드는 자격증 번호 pk 불러오는거 
			int cert_no = dao.selectCerNO(); // 자격증의 pk를 불러오고 
			if(vo.getEmpCertVOList()!=null) { // 2.자격증의 추가 사항이 있으면 
				for(int i = 0; i<vo.getEmpCertVOList().size(); i++) { // 3.자격증의 추가 사항 만큼 for문을 돌려서 
					vo.getEmpCertVOList().get(i).setCert_no(cert_no++); // 4. 자격증의 순번을 +해준다. 
				}
				dao.insertCer(vo);
			}
		}
		
		if(vo.getEmp_img() != null && StringUtils.isNotBlank(vo.getEmp_img().getOriginalFilename()) ) processImage(vo);
		
		return result;
	}

	// 내정보 읽어오는거 
	@Override
	public EmployeeVO readMyinfo(EmployeeVO emp_no) {
		EmployeeVO emp = dao.selectMyInfo(emp_no);
		if(emp == null) {
			throw new DataNotFoundException(emp+"에 해당하는 사원이 없습니다.");
		}
		return emp;
	}
	
	// 수정 시  자격증
	@Override
	public ServiceResult creatModalCert(EmployeeVO vo) {
		ServiceResult result = dao.insertCer(vo)>0? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}


	// 내 비번 변경 
	@Override
	public ServiceResult modifyPassword(EmployeeVO vo) {
		// 내 정보를 가져와서 내정보와 입력한 정보값이 같으면 비번을 변경할 수 있도록  
		EmployeeVO emp =  empdao.selectEmployee(vo.getEmp_no()); // 기존의 값을 가져오는거 
		// emp는 기존의 값      vo는 jsp에서  담은값
		ServiceResult result = null;
		System.out.println("jsp에서 가져온 값 ******" + vo.getEmp_name());
		System.out.println("jsp에서 가져온 값 ******" + vo.getEmp_no());
		
		if(emp!=null) {  // 기존의 비번이 있으면
			if(emp.getEmp_pass().equals(vo.getEmp_name())) { // 기존의 비번과 입력한 기존의 비번이 같을떄
				 dao.updateMyPASS(vo);  // update  해당하는 아이디에  새로운 비번이 update
 				 emp = empdao.selectEmployee(vo.getEmp_no());
 				 try {
					BeanUtils.copyProperties(vo,emp);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 result = ServiceResult.OK;
			}else {
				result = ServiceResult.INVALIDPASSWORD;
			}
		
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;

	}


}
