package ERP.controller.order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ERP.service.order.IOrderModalService;
import vo.order.EstimateVO;
import vo.order.ShipmentVO;

@Controller
@RequestMapping("/order/modal")
public class OrderModalViewController {
	
	@Inject
	IOrderModalService service;
	
	@GetMapping("estModal")
	public String estList(Model model) {
		List<EstimateVO> estList = service.readEstModal();
		System.err.println(         "estList :" + estList);
		
		model.addAttribute("estList", estList);
		return "/order/order/orderModalEst";
	}
	
	@GetMapping("shipModal")
	public String shipList(Model model) {
		List<ShipmentVO> shipList = service.readShipModal();
		System.err.println(     "shipList : "+shipList);
		model.addAttribute("shipList", shipList);
		return "/order/transDetails/TransDModalShip";                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
	}
	
}
