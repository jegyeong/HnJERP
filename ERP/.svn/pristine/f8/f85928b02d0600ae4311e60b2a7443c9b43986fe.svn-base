package ERP.service.wareHouse;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ERP.dao.wareHouse.IEnterDAO;
import enums.ServiceResult;
import vo.PagingVO;
import vo.buy.Buy_DocumentVO;
import vo.product.StuffVO;
import vo.wareHouse.EnterStuffVO;

@Service
public class EnterBuyDocServiceImpl implements IEnterBuyDocService {

	@Inject
	IEnterDAO dao;
	
	

	

	@Override
	public List<EnterStuffVO> readBuyDocList(String pagingVO) {
	   
		return dao.readBuyDocList(pagingVO);
	}



	@Override
	public ServiceResult insertEnter(List<StuffVO> stufflist,String code) {
		
		
		for(StuffVO stuff : stufflist) {
			stuff.setStuff_name(code);
			dao.InsertSector(stuff);
		}
		
		
		
		return null;
	}



	@Override
	
	public ServiceResult insertInnerEnter(EnterStuffVO stuffvo) {
		
		dao.InsertEnter(stuffvo);
		
		return null;
	}

}
