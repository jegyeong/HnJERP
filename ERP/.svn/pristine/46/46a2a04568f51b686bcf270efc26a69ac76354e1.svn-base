package ERP.controller.buy.chart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.service.buy.IBuy_ChartService;
import vo.buy.Buy_ChartVO;

@Controller
@RequestMapping("/buy/chart/pur")
public class Pur_ChartController {
	
	@Inject
	IBuy_ChartService service;
	
	@GetMapping
	public String chartForm() {
		return "buy/chart/pur_chart";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<Buy_ChartVO> chartData(Buy_ChartVO chartVO){
		List<Buy_ChartVO> chartList = service.readPurchaseChart(chartVO);
		return chartList;
	}
}

