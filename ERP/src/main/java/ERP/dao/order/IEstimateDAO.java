package ERP.dao.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import vo.BuyerVO;
import vo.PagingVO;
import vo.order.EstimateListVO;
import vo.order.EstimateVO;
import vo.wareHouse.ProdVO;

/**
 * 견적서 persistence layer
 */
@Repository
public interface IEstimateDAO {
	
	/**
	 * 신규등록
	 * @param estimate
	 * @return 등록된 견적서 수 
	 */
	public int insertEstimate(EstimateVO estimate);
	
	/**
	 * 견적서 상세조회
	 * @param est_no
	 * @return 존재하지 않으면 null 반환
	 */
	public EstimateVO selectEstimate(int est_no);

	/**
	 * 검색조건에 맞는 견적서 조회
	 * @param pagingVO
	 * @return 
	 */
	public int selectEstimateCount(PagingVO<EstimateVO> pagingVO);
	
	/**
	 * 검색조건에 맞는 견적서 목록조회
	 * @param pagingVO
	 * @return
	 */
	public List<EstimateVO> selectEstimateList(PagingVO<EstimateVO> pagingVO);
	
	//정보수정-----------------------------------------------------------------------
	/**
	 * 견적서 수정
	 * @param estimate
	 * @return
	 */
	public int updateEstimate(EstimateVO estimate);
	
//	public int updateEstList(EstimateListVO estimateList);
	//수정시 상품 삭제 후 다시 업뎃
	//상품삭제
	/**
	 * 업뎃하기위한 삭제
	 * @param est_no
	 * @return
	 */
	public int deleteEstimateProd(int est_no);
	//현재있는 상품 업뎃
	/**
	 * 삭제후 상품 업데이트
	 * @param estimateList
	 * @return
	 */
	public int insertEstimateProd(List<EstimateListVO> estimateList);
	
	
	//견적서완전삭제-----------------------------------------------------------------------
	/**
	 * 견적서 삭제
	 * @param est_no
	 * @return
	 */
//	public int deleteEstimate(EstimateVO estimateVO);
	/**
	 * 견적서삭제
	 * @param est_no
	 * @return
	 */
	public int deletEstimate(EstimateVO estimate);
	
	/**
	 * 견적상품삭제
	 * @param est_no
	 * @return
	 */
	public int deleteEstPList(EstimateVO estimate);
	
	//견적서완전삭제-----------------------------------------------------------------------
	
	/**
	 * prod의 분류코드 전부 불러오기
	 * @return
	 */
	public List<Map<String, String>> selectAllProdLgu();
	
	/**
	 * 분류코드에 해당하는 상품 모두 불러오기
	 * @param prod_lgu
	 * @return
	 */
	public List<ProdVO> selectAllProd(@Param("lgu") String prod_lgu);
	
	/**
	 * 상품 상세보기
	 * @param prod_no
	 * @return
	 */
	public ProdVO selectProd(String prod_no);
	
	/**
	 * 프린트 하기 위한 
	 * @param estimate
	 * @return
	 */
	public List<EstimateVO> selectEstPrint(int[] estimate);
	
	
}
