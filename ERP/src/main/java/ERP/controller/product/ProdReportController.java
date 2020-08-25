package ERP.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ERP.dao.product.IpdReportDao;
import ERP.service.product.IpdReportService;
import ERP.service.product.IprodOrderService;
import enums.ServiceResult;
import google.GoogleTest;
import vo.emp.EmployeeVO;
import vo.product.PdReportVO;
import vo.product.PductListVO;
import vo.product.PductorderVO;

@Controller
@RequestMapping("/report")
public class ProdReportController {


	@Inject
	IprodOrderService service;
	
	
	@GetMapping()
	public String list( 
		
			) {
		
		return "product/pdreportForm";
	}
	
	@GetMapping("list")
	public String selectlist(Model model) {
	
		
		List<PductorderVO> list =	service.ReadConfirmorderList();
	model.addAttribute("order",list);
	
		
		return "/product/pdreportSearch";
	}
	
	
	@PostMapping("analysis")
	public @ResponseBody PductorderVO analysis(MultipartFile fileupload, HttpSession session){
		
		GoogleTest googleTest = new GoogleTest();
		String ocrResult = "";
		try {
			ocrResult = googleTest.test(fileupload);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int index = ocrResult.indexOf("의뢰 번호:")+6;
		String test = ocrResult.substring(index, index+ 5);
		test = test.replaceAll("[^0-9]", "");
		System.out.println(test.replaceAll("[^0-9]", ""));
		
		EmployeeVO empvo =  (EmployeeVO) session.getAttribute("authUser");
		String empName = empvo.getEmp_name();
		
		PductorderVO ocrVO = service.ReadOCR(test);
		ocrVO.setEmp_name(empName);
		
		
		return ocrVO;
	}
	
	
	@PostMapping
	public String insert( @Valid PdReportVO reportvo,Errors errors, Model model, RedirectAttributes redicrectAttributes ) {
		
		System.out.println(reportvo.toString());
		
		
		String goPage = "product/pdreportForm"; 
		String message = "작성된 폼이 잘못됬습니다.";
		if(!errors.hasErrors()) {

			ServiceResult result =  service.CreateProdorder(reportvo);
		     goPage = "redirect:/report";
			 message = "저장이 완성되었습니다.";
			 redicrectAttributes.addFlashAttribute("message",message);
			 return goPage;
			 
		}
		model.addAttribute("Failmessage",message);
		
		return goPage;
	}
	
}
