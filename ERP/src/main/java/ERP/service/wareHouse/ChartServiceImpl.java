package ERP.service.wareHouse;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ERP.dao.wareHouse.IChartDAO;
import vo.wareHouse.ChartVO;
import vo.wareHouse.MaterialVO;
import vo.wareHouse.ProdVO;

@Service
public class ChartServiceImpl implements IChartService{
	
	@Inject
	IChartDAO chartDao;
	
	// 원자재 반품 출고 
	@Override
	public List<ChartVO> matReOuterChart() {
		return chartDao.matReOuterChart();
	}
		

	@Override
	public int prodEnterChart(ProdVO prod_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int prodOuterChart(ProdVO prod_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int prodDisuseChart(ProdVO prod_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int matEnterChart(MaterialVO mat_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int matDisuseChart(MaterialVO mat_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
