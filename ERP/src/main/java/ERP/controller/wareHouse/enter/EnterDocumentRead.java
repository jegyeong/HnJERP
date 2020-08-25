package ERP.controller.wareHouse.enter;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ERP.service.buy.IBuy_DocService;
import vo.PagingVO;
import vo.buy.Buy_DocumentVO;

@Controller
@RequestMapping("/ware/enter/buy")
public class EnterDocumentRead {	//구매요청서 조회
	
	@Inject
	IBuy_DocService service;
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<Buy_DocumentVO> ajaxList(@RequestParam(name="page",required=false,defaultValue="1") int currentPage,
			Buy_DocumentVO detailSearch, Model model) {
		list(currentPage, detailSearch, model);	//메서드 실행후엔 model안에 pagingVO가 들어있을 것임
		PagingVO<Buy_DocumentVO> pagingVO = (PagingVO<Buy_DocumentVO>) model.asMap().get("pagingVO");
		return pagingVO;
	}
	
	@GetMapping
	public String list(@RequestParam(name="page",required=false,defaultValue="1") int currentPage,
						Buy_DocumentVO detailSearch, Model model) {
		PagingVO<Buy_DocumentVO> pagingVO = new PagingVO<>();
 		pagingVO.setDetailSearch(detailSearch);
 		
 		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.readBuyDocCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<Buy_DocumentVO> docList = service.readBuyDocList(pagingVO);
		pagingVO.setDataList(docList);
		model.addAttribute("pagingVO", pagingVO);
		return "wh/enter/endocumentList";
	}
	
	
}


