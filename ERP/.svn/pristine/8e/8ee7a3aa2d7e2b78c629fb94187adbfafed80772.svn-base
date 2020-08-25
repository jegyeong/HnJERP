package vo.emp;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;


@Data
@ToString
public class NoticeVO {
	private Integer rnum;
	private Integer notice_no      ;
	private String emp_no         ;
	private String emp_name         ;
	private String notice_title   ;
	private String notice_date    ;
	private String notice_content ;
	private Integer notice_view    ;
	private String	emp_pass;
	
	private MultipartFile[] notice_files;
	
	private List<AttatchVO> attatchList;
	
	private int startAttNo;
	
	private int[] deleteAttatches;
	
	public void setNotice_files(MultipartFile[] notice_files) {
		this.notice_files = notice_files;
		if(notice_files == null || notice_files.length==0) return;
		attatchList = new ArrayList<>();
		for(MultipartFile no_File : notice_files) {
			if(StringUtils.isBlank(no_File.getOriginalFilename())) continue;
			attatchList.add(new AttatchVO(no_File));
		}
	}
	

}
