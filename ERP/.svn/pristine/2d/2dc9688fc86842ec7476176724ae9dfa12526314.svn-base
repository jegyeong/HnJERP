package vo.emp;

import java.io.Serializable;

import lombok.Data;

@Data
public class Salary_TransVO implements Serializable {

//	private Integer rnum;
	private String emp_no;
	private String sal_date;		// 지급날짜 
	private Integer my_basicsalary; // 기본급여
	private Integer extension_pay;   // 연장수당
	private Integer deduction; 		// 공제액
	private Integer actual_payment; // 실지급액
	
	
	private DepartmentVO depVO; // 부서
	private PositionVO posVO;  // 급여 
	
	
	private Integer sum_pay;	//3개월 총급여액
	private Integer work_cnt;	//3개월 재직 일수
	private Integer total_work_cnt;		//총 재직 일수
	private String sal_date_start;		//3개월치에서의 한달 시작일
	private String sal_date_end;		//3개월치에서의 한달 마지막일
	
	private Integer one_cnt;	//퇴직 1달 전 재직일수
	private Integer two_cnt;	//퇴직 2달 전 재직일수
	private Integer three_cnt;	//퇴직 3달 전 재직일수
}

