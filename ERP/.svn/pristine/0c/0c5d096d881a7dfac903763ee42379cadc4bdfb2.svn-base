package ERP.dao.order;

import java.util.List;

import org.springframework.stereotype.Repository;

import vo.order.Or_Return_PVO;

@Repository
public interface IOr_Return_pDAO {
	
	/**
	 * @param retVO
	 * @return 반품등록
	 */
	public int insertOrReturn(Or_Return_PVO retVO);
	
	public int selectOr_Ret_pListPK();
	
	/**
	 * @return 반품서 조회
	 */
	public List<Or_Return_PVO> selectOrReturnList();
	
	/**
	 * @param retVO
	 * @return 반품서 취소
	 */
	public int deleteOrReturn(Or_Return_PVO retVO);
	
}
