package ERP.controller.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.service.order.IOrderService;
import vo.PagingVO;
import vo.order.OrderVO;

@Controller
@RequestMapping("/order/order")
public class OrderReadConroller {
	
	@Inject
	IOrderService service;
	
	@GetMapping(produces = "application/json;charset=UTF-8")
	@ResponseBody
	public PagingVO<OrderVO> ajaxList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			OrderVO detailSerch, Model model
	){
		list(currentPage, detailSerch, model);
		PagingVO<OrderVO> pagingVO = (PagingVO<OrderVO>) model.asMap().get("pagingVO");
		return pagingVO;
	}

	@GetMapping
	public String list(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			OrderVO detailSearch, Model model
	) {
		PagingVO<OrderVO> pagingVO = new PagingVO<>();
		pagingVO.setDetailSearch(detailSearch);
		System.out.println("    detailSearch 값 : " + detailSearch);
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.readOrderCount(pagingVO);
		
		System.out.println("orderList 도착함?");
		
		List<OrderVO> orderList = service.readOrderList(pagingVO);
		
		System.err.println(orderList);
		
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setDataList(orderList);
		
		//페이징 vo에 데이터가 다있으니까 보내주기!
		model.addAttribute("pagingVO", pagingVO);
				
		//논리적인 view name
		return "order/order/orderList";
	}
	
	@GetMapping("{or_no}")
	public String view(
		@PathVariable(required = true) String or_no, Model model
	) {
		System.out.println("order 컩트롤러" + or_no);
		int or_num = Integer.parseInt(or_no);
		
		OrderVO orderList = service.readOrder(or_num);
		List<OrderVO> list = new ArrayList<>();
		list.add(orderList);
		model.addAttribute("order", list);
		
		return "/order/order/orderView";
	}
	
	@PostMapping(value = "print/all", produces = "text/html;charset=UTF-8")
	public String printAll(@RequestBody Map<String, Object> map, Model model) {
		System.err.println("   Map값 : "+map);
		List<Integer> lista = (List<Integer>) map.get("list");
		int[] list = new int[lista.size()];
		for(int i = 0; i < lista.size(); i++) {
			list[i] = lista.get(i);
		}
		
		List<OrderVO> order = service.readOrdPrint(list);
		model.addAttribute("order", order);
		return "/order/order/orderView";
		
	}
	
}
