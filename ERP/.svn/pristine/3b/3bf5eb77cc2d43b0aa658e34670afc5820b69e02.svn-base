package vo.buy;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class Buy_ItemVO {
	private String item_no; //일반물품코드
	private Integer or_code; //발주번호
	@NotBlank
	private String item_name; //일반물품명
	@Min(0)
	private Integer item_qty; //수량
	@Min(0)
	private Integer item_cost; //단가
	@NotBlank
	private String item_lprod;	//분류명
	@NotBlank
	private String item_stand_size;	//규격단위
}
