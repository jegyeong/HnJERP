package ERP.controller.order.ret;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.service.order.IOr_Retrun_pService;
import enums.ServiceResult;
import vo.order.Or_Return_PVO;

@Controller
@RequestMapping("/order/return")
public class Or_ReturnPInsertController {
	
	@Inject
	IOr_Retrun_pService service;
	
	@GetMapping("form")
	public String form() {
		return "order/ret/orderReturnForm";
	}
	
	@PostMapping(produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String insert(@RequestBody Or_Return_PVO retVO) {
		System.out.println(retVO);
		String str = "";
		ServiceResult result = service.insertOrReturn(retVO);
		if(ServiceResult.OK.equals(result)) {
			str = "<h4>반품 신청이 완료되었습니다.</h4>";
		}else {
			str = "<h4>반품 신청이 실패하였습니다. 다시 시도해주세요.</h4>";
		}
		return str;
	}

}
