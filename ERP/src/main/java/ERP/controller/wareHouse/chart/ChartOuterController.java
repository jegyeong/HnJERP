package ERP.controller.wareHouse.chart;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.service.wareHouse.IChartService;
import vo.wareHouse.ChartVO;

@Controller
@RequestMapping("/ware/chart/outer")
public class ChartOuterController {

	// 출고 현황 
	
	private static Logger logger = LoggerFactory.getLogger(ChartOuterController.class);
	
	@Inject
	IChartService chartService;
	
	@GetMapping
	public String listForm(){
		return  "wh/chart/chartMatReOut";
	}
	
	
	//원자재 반품 출고 보여주기 
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<ChartVO> MatReOut(){
		List<ChartVO> chartList = chartService.matReOuterChart();
		return chartList;
	}
}
