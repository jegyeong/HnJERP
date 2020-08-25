package vo.wareHouse;

import java.io.Serializable;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.ToString;
import vo.product.MaterialSectorVO;

@Data
@ToString
public class MaterialVO implements Serializable{
	private Integer rnum; // row number
	
	private String mat_no; // 원자재 번호

	@NotBlank
	private String mat_name; //원자재 이름

	@NotBlank
	private String lprod_no; // 분류코드

	@NotBlank
	private String mat_use; // 원자재 사용여부
	
	private Integer mat_standard; // 원자재 규격
	private String mat_stand_size; // 원자재 규격단위
	
	private Integer mat_in_cost; // 입고단가
	private String mat_stock_size; // 수량단위
	private String buyer_no; //거래처 번호
	
	private Integer mat_stock; // 원자재 현재고량
	
	@Min(0)
	private Integer mat_safe_stock; // 안전 재고량
	
	private String mat_validity; // 유효기한
	
	private String store_name; 
	
	private String store_no;// 창고 구역 번호
	
	private String sector_no; // 창고 섹터 번호

	private LprodVO lprodVO;	// 분류 VO
	private String lprod_name;	//분류명
	
	// 검색용
	private String startDay;
	private String endDay;
    private String mat_cnt;
	
    //sql 문 용 변수 
    private int porder_no;
    private MaterialSectorVO materSectorVO;
	
}
