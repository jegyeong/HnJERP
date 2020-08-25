package ERP.controller.wareHouse.chart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ware/chart/disuse")
public class ChartDisUseController {

	// 폐기 현황 
	// 1. 원자재 입고 - 원자재 매입량을 보여준다. 
		// 1) 원자재별 
		// 2) 카테고리별
		// 3) 기간별 
	
	// 2. 상품 입고 - 상품의 생산량을 보여준다. 
		// 1) 상품별
		// 2) 카테고리별
		// 3) 기간별 

	@GetMapping
	public String ChartMatDisUseGet() {
		return "wh/chart/chartMatDisUse";
	}
	
}
