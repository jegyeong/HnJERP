package ERP.service.wareHouse;

import java.util.List;

import enums.ServiceResult;
import vo.PagingVO;
import vo.buy.Buy_ReturnVO;
import vo.order.DeliveryOrderVO;
import vo.wareHouse.OuterDocumentVO;

public interface IOuterDocumentService {
	
	// 7. 출하지시서, 생산보고서 불러오기 
	/**
	 * 조건에 맞는 출하지시서, 생산보고서 갯수 반환
	 * @param pagingVO
	 * @return
	 */
	public int readOuterDocCnt(PagingVO<OuterDocumentVO> pagingVO);
	
	/**
	 * 조건에 맞는 출하지시서, 생산보고서 목록 전체 조회 
	 * @param pagingVO
	 * @return
	 */
	public List<OuterDocumentVO> readOuterDocList(PagingVO<OuterDocumentVO> pagingVO);
	
//	9. 출하지시서 상세보기 -- 제경
	/**
	 * 출하지시서 상세보기 
	 * @param board_no
	 * @return
	 */
	public DeliveryOrderVO readDeliveryOrder(int board_no);
	
	/**
	 * 출하지시서 진행상태 수정하기 OR02
	 * @param deliveryVO
	 * @return
	 */
	public ServiceResult updateOrDelivery(DeliveryOrderVO deliveryVO);
	
//==========================================================

	/**
	 * 조건에 맞는 반품서 갯수 불러오기 
	 * @param pagingVO
	 * @return
	 */
	public int readBuyReCnt(PagingVO<Buy_ReturnVO> pagingVO);
	
	/**
	 * 조건에 맞는 반품서 목록 불러오기 
	 * @param pagingVO
	 * @return
	 */
	public List<Buy_ReturnVO> readBuyReList(PagingVO<Buy_ReturnVO> pagingVO);

	/**
	 * 반품서 상세보기 
	 * @param board_no
	 * @return
	 */
	public Buy_ReturnVO readBuyReturn(int board_no);
	
	/**
	 * 반품서 상태 변경하기 
	 * @param buy_returnVO
	 * @return
	 */
	public ServiceResult updateBuyReturn(Buy_ReturnVO buy_returnVO);

}
