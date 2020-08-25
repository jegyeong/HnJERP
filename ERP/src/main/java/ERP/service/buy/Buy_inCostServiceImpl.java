package ERP.service.buy;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ERP.dao.buy.IBuy_InCostDAO;
import enums.ServiceResult;
import vo.wareHouse.MaterialVO;

@Service
public class Buy_inCostServiceImpl implements IBuy_inCostService {

	@Inject
	IBuy_InCostDAO dao;
	
	@Override
	public ServiceResult updateInCost(MaterialVO matVO) {
		int result = dao.updateInCost(matVO);
		if(result>0) return ServiceResult.OK;
		else return ServiceResult.FAIL;
	}

}
