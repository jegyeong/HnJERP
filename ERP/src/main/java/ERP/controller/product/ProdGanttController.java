package ERP.controller.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ERP.service.product.IprodOrderService;
import vo.product.PductorderVO;

@Controller
@RequestMapping("/product/gantt")
public class ProdGanttController {
	
	@Inject
	IprodOrderService service;
	
	@GetMapping("list")
	String Getgantt(Model model ) {
		
		List<PductorderVO> list =	service.ReadConfirmorderList();
		model.addAttribute("order",list);
		
		return "product/ganttChart";
	}
	
	
}
