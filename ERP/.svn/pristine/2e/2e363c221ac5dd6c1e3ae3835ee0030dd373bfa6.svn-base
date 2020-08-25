package ERP.controller.account;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ERP.dao.IBuyerDAO;
import ERP.service.IBuyerService;

@Controller
@RequestMapping("/account/basic/buyer")
public class BuyerReadController {@Inject
	IBuyerService service;
	@Inject
	IBuyerDAO dao;
	
	@GetMapping
	public String list() {
		return "account/buyer/buyerList";
	}
}
