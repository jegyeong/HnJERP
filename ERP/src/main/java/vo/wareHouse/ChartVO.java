package vo.wareHouse;

import lombok.Data;

@Data
public class ChartVO {

	private String mat_no; // 원자재 번호
	private String mat_name; // 원자재 이름 
	private int cnt; 
}
