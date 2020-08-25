package ERP.service.wareHouse;

import java.util.List;

import enums.ServiceResult;
import vo.PagingVO;
import vo.order.Or_Return_PVO;

public interface IEnterBuyReService {
//	7. 반품의뢰서 불러오기  -- 제경
	/**
	 * 조건에 맞는 반품의뢰서 수 
	 * @param pagingVO
	 * @return
	 */
	public int readBuyerReturnCnt(PagingVO<Or_Return_PVO> pagingVO);
	/**
	 * 조건에 맞는 반품의뢰서 목록 불러오기 
	 * @param pagingVO
	 * @return
	 */
	public List<Or_Return_PVO> readBuyerReturnList(PagingVO<Or_Return_PVO> pagingVO);
//	10. 반품의뢰서 상세보기 -- 제경
	/**
	 * 반품의뢰서 상세보기 
	 * @param board_no
	 * @return
	 */
	public Or_Return_PVO readBuyerReturn(int board_no);
//	12. 상품입고하기 
	/**
	 * 반품의뢰서를 토대로 상품 입고 (반품의뢰서를 파라미터로 받는다.)
	 * @param buyReVo
	 * @return
	 */
	public ServiceResult ReEnterProd(Or_Return_PVO buyReVo);
}
