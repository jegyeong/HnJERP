package ERP.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ERP.dao.order.IEstimateDAO;
import ERP.service.order.IEstimateService;
import enums.ServiceResult;
import validate.groups.InsertGroup;
import vo.order.EstimateListVO;
import vo.order.EstimateVO;


@Controller
@RequestMapping("/order/estimate")
public class EstimateInsertController {
	@Inject
	IEstimateService service;
	
	@Inject
	IEstimateDAO dao;
	
	private void attribute(Model model) {
		model.addAttribute("lprodList", dao.selectAllProdLgu());
		
	}
	
	@ModelAttribute("currentAction")
	public String currentAction() {
		return "/order/estimate/estimate";
	}
	
	@GetMapping("form")
	public String form(@ModelAttribute("estimate")EstimateVO estimate , Model model) {
		attribute(model);
		return "order/estimate/estimateForm";
	}
	
	
	
	@PostMapping
	public String insert(
			@Validated(InsertGroup.class)
			@ModelAttribute("estimate") EstimateVO estimate,
			@RequestParam(required = false) int[] est_no,
			@RequestParam(required = false) String[] prod_no,
			@RequestParam(required = false) int[] est_qty,
			@RequestParam(required = false) int[] est_price,
			BindingResult errors,
			Model model
	) throws IllegalStateException, IOException {
		
		//상품목록 리스트에 넣어주기-------------------------------------------------
		List<EstimateListVO> list = new ArrayList<>();
		if(prod_no!=null) {
			for(int i=0; i<prod_no.length; i++) {
				EstimateListVO vo = new EstimateListVO();
				vo.setEst_no(estimate.getEst_no());
				vo.setProd_no(prod_no[i]);
				vo.setEst_qty(est_qty[i]);
				vo.setEst_price(est_price[i]);
				list.add(vo);
			}
		}
		estimate.setEstimateList(list);
		//------------------------------------------------------------
		
		String goPage = null;
		String message = null;
		
		
		System.err.println("여기까지 왔음");
		System.out.println(estimate);
		if(estimate!=null) {
			ServiceResult result = service.createEstimate(estimate);
			switch (result) {
			case FAIL:
				message = "잠시후에 다시 시도하세요";
				goPage = "order/estimateForm";
				break;

			default:
				goPage = "redirect:/order/estimate";
				break;
			}
		}else {
			goPage = "order/estimateForm";
		}
		
		model.addAttribute("message", message);
		return goPage;
	}
	

	
}
