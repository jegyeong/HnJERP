package ERP.controller.buy;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ERP.service.buy.IBuy_DocService;
import enums.ServiceResult;
import validate.groups.InsertGroup;
import vo.buy.Buy_DocumentVO;
import vo.emp.EmployeeVO;

@Controller
@RequestMapping("/buy/document")
public class DocumentInsert {
	
	@Inject
	IBuy_DocService service;
	
	@GetMapping("form")
	public String form() {
		return "buy/document/documentForm";
	}
	
//	@AuthenticationPrincipal(expression="realUser") EmployeeVO authUser,
//	@AuthenticationPrincipal Object userDetail, HttpSession session
	@PostMapping
	public String insert(@Validated(InsertGroup.class) @ModelAttribute("docVO") Buy_DocumentVO vo, BindingResult errors
						, Model model, HttpSession session) {	//구매요청서 insert
		String goPage = null;
		String message = null;
		if(!errors.hasErrors()) {
			vo.setEmp_no(((EmployeeVO)session.getAttribute("authUser")).getEmp_no());	//세션객체에서 작성자 가져오기
			ServiceResult result = service.createBuyDoc(vo);
			switch(result) {
			case FAIL:
				message = "잠시 후 다시 시도해주세요";
				goPage = "buy/document/documentForm";
				break;
			default:
				System.out.println("등록 성공");
				goPage = "redirect:/buy/document";
			}
		}else {
			goPage = "buy/document/documentForm";
		}
		model.addAttribute("message", message);
		return goPage;
	}
	
	
}
