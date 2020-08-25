package ERP.dao.buy;

import org.springframework.stereotype.Repository;

import vo.buy.Buy_ChartVO;

@Repository
public interface IBuy_ChartDAO {
	
	public Buy_ChartVO selectPurchaseChart(Buy_ChartVO chartVO);
	
}
