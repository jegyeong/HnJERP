package vo.order;

import java.util.List;

import lombok.Data;

@Data
public class Or_Return_PVO {
	private Integer or_retp_no; //상품반품번호
	private Integer ship_no; //출하등록번호
	private String emp_no; //사원번호
	private String status; //진행상태
	private String or_retp_date; //반품일자
	
	private List<Or_Ret_PlistVO> ret_pList;
	private Integer pcnt;	//총 반품 수량
	
	private Integer or_no;		//주문번호
	private String or_date;		//주문일자(주문서table)
	private String emp_name;	//사원명
	private String dep_name;	//부서명
	private String buyer_no;	//거래처번호
	private String buyer_name;	//거래처명
	
	private List<Integer> or_retp_noList;	//반품번호 리스트 - 삭제용
}
