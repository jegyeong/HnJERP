package ERP.dao.wareHouse;

import java.util.List;

import org.springframework.stereotype.Repository;

import vo.wareHouse.ChartVO;

@Repository
public interface IChartDAO {

	public List<ChartVO> matReOuterChart(); // 원자재 반품 출고 
}
