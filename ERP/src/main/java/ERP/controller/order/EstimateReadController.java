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

import ERP.service.order.IEstimateService;
import vo.PagingVO;
import vo.account.ChitVO;
import vo.order.EstimateListVO;
import vo.order.EstimateVO;
import vo.wareHouse.ProdVO;

@Controller
@RequestMapping("/order/estimate")
public class EstimateReadController {
	
	@Inject
	IEstimateService service;
	
	@GetMapping(produces = "application/json;charset=UTF-8")
	@ResponseBody
	public PagingVO<EstimateVO> ajaxList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			EstimateVO detailSearch, Model model
	){
		list(currentPage, detailSearch, model);
		PagingVO<EstimateVO> pagingVO = (PagingVO<EstimateVO>) model.asMap().get("pagingVO");
		return pagingVO;
	}
	

	@GetMapping
	public String list(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			EstimateVO detailSearch, Model model
			) {
		PagingVO<EstimateVO> pagingVO = new PagingVO<>();
		pagingVO.setDetailSearch(detailSearch); //상세검색조건
		pagingVO.setCurrentPage(currentPage);	//현재페이지
		int totalRecord = service.readEstimateCount(pagingVO);
		System.err.println("리스트 도착함?");
		List<EstimateVO> estimateList = service.readEstimateList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setDataList((List<EstimateVO>) estimateList);
		
		//페이징 vo에 데이터가 다있으니까 보내주기!
		model.addAttribute("pagingVO", pagingVO);
		
		//논리적인 view name
		return "order/estimate/estimateList";
	}
	
	
	@GetMapping("{est_no}")
	public String view( @PathVariable(required = true) String est_no, Model model, String prod_no
		) {
		
		System.out.println("컨트롤러");
		int est_num = Integer.parseInt(est_no);
		
		EstimateVO estimateList = service.readEstimate(est_num);
		List<EstimateVO> list = new ArrayList<EstimateVO>();
		list.add(estimateList);
	
		model.addAttribute("estimate", list);
		return "/order/estimate/estimateView";
	}
	
	@PostMapping(value = "print/all", produces = "text/html;charset=UTF-8" )
	public String printAll(@RequestBody Map<String, Object> map, Model model) {
		System.out.println("      map값 : "+map);
		List<String> lista = (List<String>) map.get("list");
		int[] list = new int[lista.size()];
		for(int i = 0; i < lista.size(); i++) 
//			System.err.println(lista.get(i));
//			list[i] = lista.get(i);
			list[i] = Integer.parseInt(lista.get(i));
		
		List<EstimateVO> estimate = service.readEstPrint(list);
		model.addAttribute("estimate", estimate);
		return "/order/estimate/estimateView";
	}
}
