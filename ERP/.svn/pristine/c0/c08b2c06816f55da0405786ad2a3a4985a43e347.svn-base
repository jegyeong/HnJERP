package ERP.controller.emp;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ERP.service.emp.INoticeService;
import enums.ServiceResult;
import validate.groups.InsertGroup;
import vo.emp.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeInsertController {
	@Inject
	INoticeService service;
	
	@ModelAttribute("currentAction")
	public String currentAction() {
		return "/notice";
		
	}
	
	@GetMapping("form")
	public String form(
			@ModelAttribute("notice") NoticeVO notice) {
				return "emp/noticeForm";
		
	}
	
	@PostMapping
	public String insert(
			@Validated(InsertGroup.class)@ModelAttribute("notice") NoticeVO notice,
			BindingResult errors,
			Model model
			) {
			String goPage = null;
			String message = null;
			if(!errors.hasErrors()) {
				ServiceResult result = service.createNotice(notice);
				switch (result) {
				case FAIL:
					message = "다시 시도해주세요.";
					goPage = "emp/noticeForm";
					break;

				default:
					goPage ="redirect:/notice/"+notice.getNotice_no();
					break;
				}
			}else {
				goPage = "emp/noticeForm";
			}
			model.addAttribute("message", message);
				return goPage;
		
		
	}

	
}
