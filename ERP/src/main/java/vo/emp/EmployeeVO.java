package vo.emp;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import validate.stereotype.MimeChecker;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"emp_no","emp_regno"})
public class EmployeeVO implements Serializable {
	
	public EmployeeVO(String emp_no, String emp_pass) {
		super();
		this.emp_no = emp_no;
		this.emp_pass = emp_pass;
	}
	
	private List<Salary_TransVO> transList;		//퇴직금정산용 리스트
	
	private int rnum;
	
	private String pos_no; 		//직급코드
//	@NotBlank
	private String fulltime; 	//정규직여부
	private String emp_addr2;	//상세주소
	private String country; 	//국적
//	@NotBlank
	private String bank; 		//은행명
	private String emp_birthday; //생일
	private String emp_no; 		//사원번호
//	@NotBlank
	private String hire_date; 	//입사일자
	
	@MimeChecker(contentType = "image/*")
	private MultipartFile emp_img;		//사원사진명
	
//	private String emp_image;
	
//	@NotBlank
	private String emp_phone; 	//핸드폰번호
	private String emp_email; 	//이메일
	private String emp_zip; 	//우편번호
//	@MimeChecker(contentType = "image/*")
	private MultipartFile bank_img; 	//통장사본사진명
	private String emp_addr; 	//주소
	private String dep_no; 		//부서코드
	private String dep_no2; 		//부서코드
//	@NotBlank
	private String emp_name; 	//사원명
//	@NotBlank	
	private String emp_en_name; //영문명
//	@NotBlank
	private String emp_gen; 	//성별
	private String soldier; 	//병역여부
//	@NotBlank
	private String emp_regno; 	//주민번호
//	@NotBlank
	private String emp_bankno; 	//계좌번호
//	@NotBlank
	private String emp_pass; 	//비밀번호
	
	private Integer cer_no;
	
	private String work_start_day;	//근무기간 시작일
	private String work_end_day;	//근무기간 마지막일

	private Integer extension_pay;	//연장수당
	private String sal_date;	//급여지급날짜 
	private String name; //정규직 구분
	private String work_date;
//	여기부터 --------------
	private List<Emp_CareerVO> careerVOList;	//경력VO
//	private List<CertificationVO> certVOList;
	private List<EducationVO> eduVOList;	//학력VO
	private List<EMP_CertVO> empCertVOList;	//자격증  VO
	private DepartmentVO depVO;	//부서VO
	private PositionVO posVO;	//직급VO
	
	private Integer  deduction;
	private Integer  actual_payment;
	
	private String retire_reason;
	private Integer retire_salary;
	private String payment_day;
	private String retireList;
	private String annList;
	
	private String retire_date;
	private Integer  my_basicsalary;
	
	private String ann_status;
	private Integer ann_no;
	private String remark;
	private String ann_date;
	
	private String today_ann; // 발령 등록일 
	private String st_before; // 발령 내용
	
	
	public void setEmp_img(MultipartFile emp_img) {
		if(emp_img == null) {return;}// 이미지 파일이 없으면 리턴 
		
		String filename = emp_img.getOriginalFilename(); // 이미지 파일의  파일이름을 변환해서 filename에 담기
		
		if(filename == null || filename.isEmpty()) {return;} // 파일이름이 없거나 비어 있으면 리턴 
		this.emp_img = emp_img;   // emg_img에  변환된 이름을 넣는다 vo emp_img에 넣는다.?
//		emp_image = UUID.randomUUID().toString(); // 저장명 결정  
	}
	
	
//	// 사진은 폴더에 저장되는거 db에 저장되지 않는다. 
	public void saveFile(File saveFolder) throws IllegalStateException, IOException{
		if(emp_img == null) return;
		File saveFile = new File(saveFolder, emp_no);  // 사원번호로 파일이름을 저장
		emp_img.transferTo(saveFile); 
		
	}
	
	private String role_name;	//권한(등록용)
	private Set<String> emp_roles;	//권한
	
}
