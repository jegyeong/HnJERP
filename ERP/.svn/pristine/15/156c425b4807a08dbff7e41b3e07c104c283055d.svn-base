package ERP.controller.emp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ERP.dao.ICalendarDAO;
import ERP.service.ICalendarService;
import enums.ServiceResult;
import validate.groups.UpdateGroup;
import vo.BoardVO;
import vo.CalendarVO;

@Controller
@RequestMapping("emp/register/calendar")
public class CalendarController { // 관리자 달력 
	@Inject
	ICalendarService service;
	@Inject
	ICalendarDAO dao;
	
	
	@GetMapping(value = "/admin", produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
	@ResponseBody
	public List<Map<String, String>> list( // 달력 정보 가져오는거 
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute CalendarVO cal,
			Model model ){
		
			List<CalendarVO> calList= service.readCalendarList(cal);
			List<Map<String, String>> maplist = new ArrayList<Map<String,String>>();
			for(CalendarVO vo : calList) {
				
				Map<String,String> map = new HashMap<String, String>();
				map.put("title", vo.getCalendar_title());
				map.put("description", vo.getCalendar_content());
				map.put("start", vo.getCalendar_start());
				map.put("end", vo.getCalendar_end());
				map.put("username", vo.getUsername());
				map.put("backgroundColor", vo.getBackground());
				
				maplist.add(map);
			}
			

		return maplist; //게시판 목록 리스트 
	}
	
	@GetMapping("/admin")
	public String listCal( // 달력 형식? 그림? 가져오는거 
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@ModelAttribute CalendarVO cal,
			Model model ){
		
			service.readCalendarList(cal);
			

		return "emp/iframe"; //게시판 목록 리스트 
	}

	
	@PutMapping
	@ResponseBody
	public String update( // 일정 수정 
		@Validated(UpdateGroup.class) @ModelAttribute("board") BoardVO board, 
		BindingResult errors, Model model,
		RedirectAttributes redirectAttributes
	){
//		String goPage = null;
//		String message = null;
//		if (!errors.hasErrors()) {
//			ServiceResult result = service.modifyBoard(board);
//			switch (result) {
//			case FAIL:
//				message = "쫌따 다시 해보셈.";
//				redirectAttributes.addFlashAttribute("board", board);
//				goPage = "redirect:/board/{bo_no}/form";
//				break;
//			case INVALIDPASSWORD:
//				message = "비번 오류.";
//				redirectAttributes.addFlashAttribute("board", board);
//				goPage = "redirect:/board/{bo_no}/form";
//				break;
//			default: // OK
//				goPage = "redirect:/board/{bo_no}";
//				break;
//			}
//		} else {
//			goPage = "redirect:/board/{bo_no}/form";
//			redirectAttributes.addFlashAttribute("board", board);
//			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.board", errors);
//		}
//
//		model.addAttribute("message", message);

		return "emp/iframe"; 
	
	}
	
	// 일정 등록 
	@PostMapping("insertSC")
	@ResponseBody
	public String insertSC(
			@RequestBody CalendarVO calVO, // AJAX로 요청하는거 calVO에  입력값을 받는거 
			Model model,
			BindingResult errors
			) {
		
		
		String goPage = null;
		
		if(!errors.hasErrors()) {
			ServiceResult result = service.createCalendar(calVO); //DB에 입력 받은 값을 넣기 
			switch(result) {
			case FAIL :
				goPage = "emp/iframe";
				break;
			case OK :
				goPage = "redirect:/emp/register/calendar/admin";
				break;
			}
		}else {
			goPage="emp/iframe";
		}
		return goPage;
		
	}

	
	
	
}
