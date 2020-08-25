package ERP.service.wareHouse;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ERP.dao.wareHouse.IOuterDao;
import enums.ServiceResult;
import vo.PagingVO;
import vo.buy.Buy_ReturnVO;
import vo.order.DeliveryOrderVO;
import vo.wareHouse.OuterDocumentVO;
import vo.wareHouse.ProdVO;

@Service
public class OuterDocumentServiceImpl implements IOuterDocumentService {

	@Inject
	IOuterDao outerDao;
	
	// 7. 출하지시서, 생산보고서 불러오기 
	@Override
	public int readOuterDocCnt(PagingVO<OuterDocumentVO> pagingVO) {
		return outerDao.readOuterDocCnt(pagingVO);
	}

	@Override
	public List<OuterDocumentVO> readOuterDocList(PagingVO<OuterDocumentVO> pagingVO) {
		return outerDao.readOuterDocList(pagingVO);
	}

	// 7-1. 출하지시서
	/**
	 * 출하지시서 상세보기 
	 * @param board_no
	 * @return
	 */
	@Override
	public DeliveryOrderVO readDeliveryOrder(int board_no) {
		return outerDao.readDeliveryOrder(board_no);
	}
	
	//=======================================================
	
	/**
	 * 출하지시서 진행상태 수정하기 OR02
	 * @param deliveryVO
	 * @return
	 */
	@Override
	public ServiceResult updateOrDelivery(DeliveryOrderVO deliveryVO) {
		/**
		 * 출하지시서 진행상태 수정 > 상품 출고테이블 insert > 
		 * 상품테이블 수량 update > 상품 창고 구역 update 
		 */
		
		int prodoutInsert =0;
		
		// or_delivery > 출하지시서 번호를 해당하는 문서의 진행상태를 변경시켜준다. 
		int orDelivUpdate = outerDao.updateOrDelivery(deliveryVO); // 출하지시서 진행상태 수정
		
		if(orDelivUpdate > 0) {
			// 출하지시서의 상태를 변경하면 출하지시서>주문서>주문서상품목록에 있는 상품을 반복문을 돌면서 insert시킨다. 
			int prodoutPK = outerDao.prodOutPK(); // prod_outpk 생성 
				deliveryVO.setProd_out_no(prodoutPK);
			prodoutInsert = outerDao.insertProdOut(deliveryVO); // 상품 출고 테이블 insert
		}
		
		ServiceResult result = null;
		if(prodoutInsert > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	//=======================================================
	
	@Override
	public int readBuyReCnt(PagingVO<Buy_ReturnVO> pagingVO) {
		return outerDao.readBuyReCnt(pagingVO);
	}

	@Override
	public List<Buy_ReturnVO> readBuyReList(PagingVO<Buy_ReturnVO> pagingVO) {
		return outerDao.readBuyReList(pagingVO);
	}

	@Override
	public Buy_ReturnVO readBuyReturn(int board_no) {
		return outerDao.readBuyReturn(board_no);
	}

	@Override
	public ServiceResult updateBuyReturn(Buy_ReturnVO buy_returnVO) {
		// 반품서 상태 수정 > 원자재 반품 출고 insert > 원자재 , 원자재 창고 테이블 update
		
		ServiceResult result = null;
		int matoutInsert = 0;
		
		int buyRetUpdate = outerDao.updateBuyReturn(buy_returnVO); // 반품서 진행상태 수정
		
		if(buyRetUpdate > 0) {
			int matoutPK = outerDao.matOutPK(); //mat_out pk 생성
			buy_returnVO.setMet_out_no(matoutPK); 
			matoutInsert = outerDao.insertMatOut(buy_returnVO);
		}
		if(matoutInsert > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}
	
	

}
