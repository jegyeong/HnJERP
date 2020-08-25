package ERP.controller.emp;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ERP.dao.emp.IEmpListDAO;
import ERP.dao.emp.IEmployeeDAO;
import ERP.service.emp.IEmployeeService;
import ERP.service.emp.IRetirementService;
import enums.ServiceResult;
import validate.groups.UpdateGroup;
import vo.PagingVO;
import vo.SearchVO;
import vo.emp.AttatchVO;
import vo.emp.DepartmentVO;
import vo.emp.EMP_CertVO;
import vo.emp.EducationVO;
import vo.emp.Emp_CareerVO;
import vo.emp.EmployeeVO;
import vo.emp.Salary_TransVO;

@Controller
@RequestMapping("/emp/manage")
public class EmployeeController { // 

	@Inject 
	IEmployeeService service;
	@Inject
	IEmpListDAO dao;
	@Inject
	IEmployeeDAO empDao;
	@Inject
	IRetirementService reservice;

			
	private void attributeSetting(Model model) {
		
//		  model.addAttribute("certList", dao.selectLicensList()); //
		model.addAttribute("posList", dao.selectPosList()); //
		model.addAttribute("solList", dao.selectSolidList()); //
		model.addAttribute("fullList", dao.selectFulltime()); // 
	}
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody  // 급여 리스트 보여주는거???
	public PagingVO<Salary_TransVO> ajaxForlist(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Model model,EmployeeVO emp
			){
		empList(currentPage, emp, model);
		return (PagingVO<Salary_TransVO>) model.asMap().get("pagingVO"); 
	}
	
	
	// 사원 리스트
	@GetMapping("empList")
	public String empList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			EmployeeVO emp, Model model
			){
		
		PagingVO<EmployeeVO> pagingVO = new PagingVO<>();
		pagingVO.setDetailSearch(emp);
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.readEmpListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
	
		List<EmployeeVO> empList = service.readEmployeeList(pagingVO);
		pagingVO.setDataList(empList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("currentAction","/emp/manage/");
		return "emp/empList"; 
		
	}
	
	// 목록하나 클릭했을때  상세보기 모달 창으로  상세정보 가져오기  
	@GetMapping("{emp_no}")
	public String view(
			@PathVariable(required = true) String emp_no,
			Model model) {
		attributeSetting(model);
		model.addAttribute("currentAction","/emp/manage/empInput"); // 모달창이 뿌려질때 주소도 같이 들어가야 한다. 
		EmployeeVO vo = new EmployeeVO();
		vo.setEmp_no(emp_no);
		EmployeeVO emp = service.readEmployee(emp_no); // 파라미더로 string 으로 받아야 하는데 서비스가 employeevo 일때 vo를 새로 만들어서 넣어준다.  
		model.addAttribute("emp", emp);  // 사원정보가져오는거 
		return "/emp/empinfoModal";
	}

	
	@GetMapping("empinformation") // 인사등록 폼 가져오는거 
	public String doGet(Model model) throws ServerException, IOException{ // 
		attributeSetting(model);
		model.addAttribute("currentAction", "/emp/manage/empInput");
		return "emp/empinformation";
			}
	
	
	//사원등록
	@PostMapping("empInput")  
	public String doPost(@Valid @ModelAttribute("emp") EmployeeVO emp, 
						@ModelAttribute("dep") DepartmentVO dep,
						@RequestBody @ModelAttribute("emp_career") Emp_CareerVO emp_career,
						@RequestBody @ModelAttribute("emp_certvo") EMP_CertVO emp_certvo,
						@RequestBody @ModelAttribute("edu") EducationVO edu,
						@ModelAttribute("attr") AttatchVO attr,
						BindingResult errors,						
						Model model,
						RedirectAttributes redirectAttributes, // session 으로 전달하는거 
						@RequestParam(required = false) String currentPage
						) throws IllegalStateException, IOException, AddressException, MessagingException  { // �궗�썝�쓣 泥섏쓬 �벑濡앺븯怨� 踰꾪듉�쓣 �닃���쓣 �븣
		attributeSetting(model);

//		model.addAttribute("currentAction", "/emp/manage/empInput"); // currentActtion에 기본 페이지 경로 설정 

		String goPage = null;
		String message = null;
		
		if(!errors.hasErrors()) {
//			MultipartFile emp_img = emp.getEmp_img();
			
			ServiceResult result = service.createEmployee(emp);
			switch (result) {
			case FAIL:
				message = "다시 등록해주세요";
				goPage = "emp/empinformation";
				break;

			default:
				message = "새로운 사원을 등록했습니다.";
				goPage = "redirect:/emp/manage/empList";
				
//				redirectAttributes.addFlashAttribute("lastUpdateEmp", emp);  // lastUpdateEmp--> update컨트롤러에 있음 
				break; //addFlashAttribute : 전달한 값은  url뒤에 붙지 않는  일회성, 리프레시할 경우 데이터 소멸 
			}
		}else {
			goPage = "emp/empinformation";
		}
		
		model.addAttribute("message", message);
		return goPage;
	}
	
	
	
	
	// update시 db에서 트리거 발생해서  추가항목을 삭제해준다ㅣ. db 트리거 확인
	//  모달창에서 수정 하는거
	@ResponseBody  // 수정성공이라는 글자가 그대로 jsp로 날아가는거 
	@PostMapping(value="empInput/{emp_no}", produces = "text/plain;charset=UTF-8")
	public String update(
			@PathVariable String emp_no,
			@Validated(UpdateGroup.class) @ModelAttribute("emp") EmployeeVO emp,
			BindingResult errors,
			Model model
			
			){
//		model.addAttribute("currentAction", "/emp/manage/empInput");
		ServiceResult result = null;
		if(!errors.hasErrors()) {
			result = service.modifyEmployee(emp);
			
		}
		String str = result == ServiceResult.OK ? "수정성공" : "수정실패";
		return str;
		
	}
	
	
	@GetMapping("departmentList")
	public String list(Model model){
		List<DepartmentVO> depList = empDao.selectDepartmentList();
//		model.addAttribute("depList", depList);
		
		List<Integer> acList = new ArrayList<>();	//회계
		List<Integer> buyList = new ArrayList<>();	//구매
		List<Integer> empList = new ArrayList<>();	//인사
		List<Integer> orderList = new ArrayList<>();	//영업
		List<Integer> productList = new ArrayList<>();	//생산
		List<Integer> whList = new ArrayList<>();	//자재
		int acCnt=0, buyCnt=0, empCnt=0, orderCnt=0;
		int productCnt=0, whCnt=0;
		for(DepartmentVO dep : depList) {
			if("회계".equals(dep.getDep_name1())) {
				acList.add(dep.getDep_cnt());
				acCnt += dep.getDep_cnt();
			}else if("구매".equals(dep.getDep_name1())) {
				buyList.add(dep.getDep_cnt());
				buyCnt += dep.getDep_cnt();
			}else if("인사".equals(dep.getDep_name1())) {
				empList.add(dep.getDep_cnt());
				empCnt += dep.getDep_cnt();
			}else if("영업".equals(dep.getDep_name1())) {
				orderList.add(dep.getDep_cnt());
				orderCnt += dep.getDep_cnt();
			}else if("생산".equals(dep.getDep_name1())) {
				productList.add(dep.getDep_cnt());
				productCnt += dep.getDep_cnt();
			}else if("자재".equals(dep.getDep_name1())) {
				whList.add(dep.getDep_cnt());
				whCnt += dep.getDep_cnt();
			}
		}
		acList.add(acCnt);
		buyList.add(buyCnt);
		empList.add(empCnt);
		orderList.add(orderCnt);
		productList.add(productCnt);
		whList.add(whCnt);
		
		model.addAttribute("acList", acList);
		model.addAttribute("buyList", buyList);
		model.addAttribute("empList", empList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("productList", productList);
		model.addAttribute("whList", whList);
		
		return "emp/departmentList";
	}
	

	
	
}
