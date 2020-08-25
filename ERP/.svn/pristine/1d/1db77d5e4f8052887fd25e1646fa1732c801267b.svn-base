package ERP.service.order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ERP.dao.order.IOrderModalDAO;
import vo.order.EstimateVO;
import vo.order.ShipmentVO;

@Service
public class OrderModalServiceImpl implements IOrderModalService {
	
	@Inject
	IOrderModalDAO dao;
	
	@Override
	public List<EstimateVO> readEstModal() {
		return dao.selectEstModal();
	}

	@Override
	public List<ShipmentVO> readShipModal() {
		return dao.selectShipModal();
	}
	
	
}
