package ERP.service.account;

import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import ERP.dao.account.IFixMinusDAO;
import vo.account.FixAssetsVO;
import vo.account.FixMinusVO;

@Service
public class FixMinusServiceImpl implements IFixMinusService{
	@Inject
	IFixMinusDAO dao;

	@Override
	public FixMinusVO readFixMinus(FixMinusVO vo) {
		return dao.selectFixMinus(vo);
	}

	@Override
	public List<FixAssetsVO> readFixMinusList(FixMinusVO vo) {
		List<FixAssetsVO> list = dao.selectFixMinusList(vo);
		for(FixAssetsVO fvo : list) {
			double total = 0;
			if(fvo.getFixMinusList()!=null)
				for(FixMinusVO minus : fvo.getFixMinusList()) {
					total += minus.getAmor_cost();
				}
			fvo.setTotal(BigDecimal.valueOf(total));
		}
		return list;
	}

	@Scheduled(cron="1 0 0 1 * *")
	public void payFixMinus() {
		dao.insertFixMinus();
	}

	
}
