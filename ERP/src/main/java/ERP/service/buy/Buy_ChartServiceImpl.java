package ERP.service.buy;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ERP.dao.buy.IBuy_ChartDAO;
import vo.buy.Buy_ChartVO;

@Service
public class Buy_ChartServiceImpl implements IBuy_ChartService {

	@Inject
	IBuy_ChartDAO dao;
	
	@Override
	public List<Buy_ChartVO> readPurchaseChart(Buy_ChartVO chartVO) {
		List<Buy_ChartVO> chartList = new ArrayList<>();
		for(int i=1; i<=12; i++) {	//1월부터 12월까지
			chartVO.setMonth_date(i);
			Buy_ChartVO buyChart = dao.selectPurchaseChart(chartVO);
//			buyChart.setMonth_date(i);
			chartList.add(buyChart);
		}
		return chartList;
	}

}
