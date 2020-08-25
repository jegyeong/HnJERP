package ERP.controller.account;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.service.account.IStatisticsService;
import vo.account.StatisticsVO;

@Controller
@RequestMapping("/account/table")
public class StatisticsReadController {
	@Inject
	IStatisticsService service;
	@ModelAttribute("year")
	public Integer yaer(){
		return service.year();
	}
	
	@GetMapping(value = "plusMinus", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<StatisticsVO> ajaxForlist(StatisticsVO vo){
		set(vo);
		return service.readPlusMinus(vo);
	}
	private void set(StatisticsVO vo) {
		double d =  Calendar.getInstance().getWeekYear();
		if(vo.getStandard()==null)
			vo.setStandard(d);
		if(vo.getCompare()==null) 
			vo.setCompare(d-1);
	}

	@GetMapping("plusMinus")
	public String list(StatisticsVO vo, Model model){
		model.addAttribute("currentPage","/account/table/plusMinus");
		return "account/statistics/plusMinus";
	}
	@GetMapping(value = "buySell", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<StatisticsVO> ajaxbuySell(StatisticsVO vo){
		set(vo);
		return service.readbuySell(vo);
	}
	@GetMapping("buySell")
	public String listtable(
			StatisticsVO vo, Model model
			){
		model.addAttribute("currentPage","/account/table/buySell");
		return "account/statistics/buySell";
	}
	
	@GetMapping(value = "productCost", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<StatisticsVO> ajaxproductCost(StatisticsVO vo){
		set(vo);		
		return service.readProductCost(vo);
	}
	@GetMapping("productCost")
	public String productCostlist(
			StatisticsVO vo, Model model
			){
		model.addAttribute("currentPage","/account/table/productCost");
		return "account/statistics/productCost";
	}
	
	
}
