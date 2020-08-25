package ERP.controller.order.ret;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.service.order.IOr_Retrun_pService;
import enums.ServiceResult;
import vo.order.Or_Return_PVO;

@Controller
@RequestMapping("/order/return")
public class Or_ReturnPModifyController {
	
	@Inject
	IOr_Retrun_pService service;
	
	@DeleteMapping(produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(@RequestBody Or_Return_PVO retVO) {
		String str = "";
		ServiceResult result = service.deleteOrReturn(retVO);
		if(ServiceResult.OK.equals(result)) {
			str = "해당 반품서가 반품 취소되었습니다.";
		}else {
			str = "삭제실패. 잠시후 다시 시도해주세요.";
		}
		return str;
	}
	
}
