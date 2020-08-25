package ERP.service.wareHouse;

import java.util.List;

import vo.wareHouse.ChartVO;
import vo.wareHouse.MaterialVO;
import vo.wareHouse.ProdVO;

public interface IChartService {
	// prodvo 안에서 전부 출력할수 있도록 
	// 어디서 어떤 정보를 긁어올것인지 파악  

	// 현황(CHART)
	// 상품별 입고, 출고, 폐기 현황 보여주기
	public int prodEnterChart(ProdVO prod_no);
	public int prodOuterChart(ProdVO prod_no);
	public int prodDisuseChart(ProdVO prod_no);
	
	// 원자재별 입고, 출고, 폐기 현황 보여주기
	public int matEnterChart(MaterialVO mat_no);
	public int matDisuseChart(MaterialVO mat_no);
	
	public List<ChartVO> matReOuterChart(); // 원자재 반품 출고 
	
	
}
