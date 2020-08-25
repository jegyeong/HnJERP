package ERP.service.buy;

import java.util.List;

import vo.buy.Buy_ChartVO;

public interface IBuy_ChartService {
	
	public List<Buy_ChartVO> readPurchaseChart(Buy_ChartVO chartVO);
	
}
