package vo.order;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;
import validate.groups.UpdateGroup;
import vo.BuyerVO;
import vo.emp.EmployeeVO;
import vo.wareHouse.LprodVO;
import vo.wareHouse.ProdVO;

/**
 * 견적서
 */

@Data
@NoArgsConstructor
public class EstimateVO implements Serializable {
	
	// 검색용 변수
	private String startDay;
	private String endDay;
	
	@NotNull(groups = UpdateGroup.class)
	private Integer est_no; //견적서번호
//	@NotBlank
	private String emp_no;	//사원번호
	@NotBlank
	private String buyer_no; //거래처번호
//	@NotBlank
	private String est_date; //작성일자
//	@NotBlank
	private String est_prog; //진행상태
	
	private String status; //견적서 진행상태 (탭으로)
	
	private String est_totalPrice; //견적서 총금액(DB에 없음)
	
//	private EstimateListVO estimateListVO; //VO
	
	private List<EstimateListVO> estimateList; //상품여러개 넣어야하니까
	
	private BuyerVO buyerVO;
	
	private EmployeeVO employeeVO;
	
	private LprodVO lprodVO;
	
//	private String prod_name;
	
	private String buyer_name;
	
	private String emp_name;
	
	private List<Integer> est_noList;
	

	
}
