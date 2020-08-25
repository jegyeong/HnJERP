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

/**
 * 주문서
 */

@Data
@NoArgsConstructor
public class OrderVO implements Serializable {
	
	// 검색용 변수
	private String startDay;
	private String endDay;
	
	//견적서 불러오기(견적서 목록, 견적상품목록)
	private EstimateVO estimateVO;
	private EstimateListVO estListVO;
	
//	@NotNull(groups = UpdateGroup.class)
	private Integer or_no;		//주문서번호
	@NotBlank
	private String buyer_no;	//거래처코드
	@NotBlank
	private String emp_no;		//사원번호
	
	private Integer est_no;		//견적서번호
//	@NotBlank
	private String or_date;		//주문서작성일자
//	@NotBlank
	private String or_req_date;	//납기요청일자
//	@NotBlank
	private String or_status;	//진행상태
	
	private String status; //진행상태(탭버튼)
	
	private Integer or_totalPrice; //주문서 총금액(DB에 없음)
	
	private List<OrderListVO> orderList; //주문상품목록
	
	private BuyerVO buyerVO;
	
	private EmployeeVO employeeVO;
	
	private LprodVO lprodVO;
	
	private String buyer_name;
	
	private String emp_name;
	
	//deliv_no가 존재하는지 확인하기 위한 deliv_no
	//해당하는 주문서에 대한 delivery가 없으면 null값, 있으면 출하지시서번호
	private Integer deliv_no;
}
