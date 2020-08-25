package ERP.controller.buy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.dao.buy.IBuy_InCostDAO;
import ERP.service.buy.IBuy_inCostService;
import enums.ServiceResult;
import vo.order.Or_ShipmentVO;
import vo.wareHouse.MaterialVO;

@Controller
@RequestMapping("/buy/incost")
public class InCostController {
	
	@Inject
	IBuy_InCostDAO dao;
	@Inject
	IBuy_inCostService service;
	
	@GetMapping()
	public String list(){
		return "buy/incost/inCostList";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, List<MaterialVO>> dataTableList(){
		Map<String, List<MaterialVO>> map = new HashMap<>();
		map.put("data", dao.selectInCostList());
		return map;
	}
	
	@PutMapping(produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String costUpdate(@RequestBody MaterialVO matVO) {		
		String str = "";	
		ServiceResult result = service.updateInCost(matVO);
		
		if(ServiceResult.OK.equals(result)) {
			str = "입고단가가 수정되었습니다.";
		}else {
			str = "수정 실패! 잠시후 다시 시도해주세요.";
		}
		return str;
	}
	
}
