package ERP.controller.order.ret;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.dao.order.IOr_Return_pDAO;
import vo.order.Or_Return_PVO;

@Controller
@RequestMapping("/order/return")
public class Or_ReturnPReadController {
	
	@Inject
	IOr_Return_pDAO dao;
	
	@GetMapping
	public String list() {
		return "order/ret/orderReturnList";
	}
	
	@GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, List<Or_Return_PVO>> orReturnList(){
		Map<String, List<Or_Return_PVO>> map = new HashMap<>();
		map.put("data", dao.selectOrReturnList());
		return map;
	}
	
}
