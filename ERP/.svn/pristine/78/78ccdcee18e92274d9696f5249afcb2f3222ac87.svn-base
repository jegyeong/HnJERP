package ERP.controller.emp;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ERP.service.emp.INoticeService;
import board.service.IBoardService;
import enums.ServiceResult;
//
///board/글번호/form	:		BoardModifyController.form
///board/글번호(PUT)	:		BoardModifyController.update
///board/글번호(DELETE)	:	BoardModifyController.delete
import validate.groups.UpdateGroup;
import vo.BoardVO;
import vo.emp.NoticeVO;

@Controller
@RequestMapping("/notice/{notice_no}")
public class NoticeModifyController {
	@Inject
	INoticeService service;
	
	@ModelAttribute("currentAction")
	public String currentAction(@PathVariable(required = true) int notice_no) {
		return "/notice/"+notice_no;
	}
	
	@ModelAttribute("methodType")
	public String methodName() {
		return "put";
	}
	
	
	
	@GetMapping("form")
	public String form(@PathVariable(required = true) int notice_no, Model model) {
		if(!model.containsAttribute("notice")) {
			NoticeVO notice = service.readNotice(notice_no);
			model.addAttribute("notice", notice);
		}
		return "emp/noticeForm";
	}
	
	@PutMapping
	public String update(
		@Validated(UpdateGroup.class) @ModelAttribute("notice") NoticeVO notice, 
		BindingResult errors, Model model,
		RedirectAttributes redirectAttributes
	){
		String goPage = null;
		String message = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyNotice(notice);
			switch (result) {
			case FAIL:
//				message = "쫌따 다시 해보셈.";
				redirectAttributes.addFlashAttribute("notice", notice);
				goPage = "redirect:/notice/{notice_no}/form";
				break;
			case INVALIDPASSWORD:
//				message = "비번 오류.";
				redirectAttributes.addFlashAttribute("notice", notice);
				goPage = "redirect:/notice/{notice_no}/form";
				break;
			default: // OK
				goPage = "redirect:/notice/{notice_no}";
				break;
			}
		} else {
			goPage = "redirect:/notice/{notice_no}/form";
			redirectAttributes.addFlashAttribute("notice", notice);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.notice", errors);
		}
		redirectAttributes.addFlashAttribute("message", message);

		return goPage;
		
	}
	
	@DeleteMapping
	public String delete(
			@PathVariable(required = true) int notice_no,
			@RequestParam(required = true) String emp_pass,
			RedirectAttributes redirectAttributes
			){
		
		 	String goPage = null;
		   
		 	NoticeVO nov = new NoticeVO();
		 	nov.setNotice_no(notice_no);
		 	nov.setEmp_pass(emp_pass);
	
			ServiceResult result = service.removeNotice(nov);
			switch (result) {
			case FAIL:
				goPage = "redirect:/notice/{notice_no}";
				break;
			case INVALIDPASSWORD:
				goPage = "redirect:/notice/{notice_no}";
				break;
			default: // OK
				goPage = "redirect:/notice";
				break;
			}
		
//		redirectAttributes.addFlashAttribute("message", message);
		
		return goPage;
		
	}
}


