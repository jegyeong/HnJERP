package ERP.service.order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ERP.dao.order.IProgDAO;
import ERP.dao.order.IShipmentDAO;
import enums.ServiceResult;
import exception.DataNotFoundException;
import vo.PagingVO;
import vo.order.DeliveryOrderVO;
import vo.order.ShipmentVO;

@Service
public class ShipmentServiceImpl implements IShipmentService {
	
	@Inject
	IShipmentDAO shipmentDAO;
	
	@Inject
	IProgDAO progDAO;
	
	@Transactional
	@Override
	public ServiceResult createShipment(ShipmentVO shipment) {
		int exist = shipmentDAO.exist(shipment.getDeliv_no());
		if(exist > 0) return ServiceResult.FAIL;
		int rowcnt = shipmentDAO.insertShipment(shipment);
		ServiceResult result = null;
		if(rowcnt>0) {
			rowcnt = progDAO.updateDeliveryProgEnd(shipment.getShip_no());
			if(rowcnt>0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ShipmentVO readShipment(int ship_no) {
		ShipmentVO shipmentVO = shipmentDAO.selectShipment(ship_no);
		if(shipmentVO==null) throw new DataNotFoundException();
		return shipmentVO;
	}

	@Override
	public int readShipmentCount(PagingVO<ShipmentVO> pagingVO) {
		return shipmentDAO.selectShipmentCount(pagingVO);
	}

//	@Override
//	public List<ShipmentVO> readShipmentList(PagingVO<ShipmentVO> pagingVO) {
//		return shipmentDAO.selectShipmentList(pagingVO);
//	}

	@Override
	public ServiceResult modifyShipment(ShipmentVO shipment) {
		int cnt = shipmentDAO.updateShipment(shipment);
		ServiceResult result = ServiceResult.FAIL;
		if(cnt>0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult removeShipment(ShipmentVO shipment) {
		ServiceResult result = null;
//		int rowcnt = shipmentDAO.deleteShipment(shipment);
//		if(rowcnt>0) {
//			result = ServiceResult.OK;
//		}else {
//			result = ServiceResult.FAIL;
//		}
		return result;
	}

	@Override
	public List<DeliveryOrderVO> readNoShippedList() {
		return (List<DeliveryOrderVO>) shipmentDAO.selectNoShipped();
	}

}
