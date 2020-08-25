package ERP.controller.account;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.dao.account.IStatisticsDAO;
import ERP.service.account.IStatisticsService;
import vo.account.StatisticsVO;

@Controller
@RequestMapping("/account/pm")
public class MonthlyReadController {
	@Inject
	IStatisticsService service;
	@Inject
	IStatisticsDAO dao;
	@ModelAttribute("year")
	public Integer yaer(){
		return service.year();
	}
	
	@GetMapping(value = "monthly", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<StatisticsVO> ajaxForlist(
		StatisticsVO vo, Model model
		){
		double d = Calendar.getInstance().getWeekYear();
		if(vo.getStandard()==null)
			vo.setStandard(d);
		list(vo, model);
		return (List<StatisticsVO>) model.asMap().get("list");
	}
	@GetMapping("monthly")
	public String list(
			StatisticsVO vo, Model model
			){
		double d = Calendar.getInstance().getWeekYear();
		if(vo.getStandard()==null)
			vo.setStandard(d);
			List<StatisticsVO> list = service.readMonth(vo);
			model.addAttribute("list", list);
			model.addAttribute("currentPage", "/account/pm/monthly");
		return "account/statistics/monthly";
	}
	
	@GetMapping(value = "product/{year}", produces = "text/plain;charset=UTF-8")
//	@GetMapping(value = "product/{year}", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxForproductlist(
//	public List<D3VO> ajaxForproductlist(
		@PathVariable Double year, StatisticsVO vo, Model model
		){
		vo.setStandard(year);
		productlist(vo, model);
//		return (List<D3VO>) model.asMap().get("list");
		return (String) model.asMap().get("list");
	}
	@GetMapping("productly")
	public String productlist(
			StatisticsVO vo, Model model
			){
		double d = Calendar.getInstance().getWeekYear();
		if(vo.getStandard()==null)
			vo.setStandard(d);
		String list = service.readProduct(vo);
//		List<D3VO> list = service.readProduct(vo);
		model.addAttribute("prodyear", dao.prodYear());
		model.addAttribute("list", list);
		return "account/statistics/plain";
	}
}
