package vo.account;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import validate.groups.InsertGroup;
import validate.groups.UpdateGroup;
import validate.stereotype.MimeChecker;

@Data
public class FixAssetsVO implements Serializable{
	@NotNull(groups = UpdateGroup.class)
	private Integer fixassets_no; //고정자산코드
	private String amor_way; //상각방법
	private String getdate; //취득일자
	private BigDecimal getcost; //취득가액
	public String getGetcost2() {
		if(getcost!=null)
		return getcost.toPlainString();
		return null;
	}
	@NotNull(groups = InsertGroup.class)
	private Integer life_year; //내용연수
	private Integer account_no; //계정코드
	private String assets_name; //자산명
	private String use_status; //사용여부
	private String amor_date;
	private BigDecimal amor_cost;
	public String getAmor_cost2() {
		if(amor_cost!=null)
		return amor_cost.toPlainString();
		return null;
	}
	
	
	private List<FixMinusVO> fixMinusList; // 상각이력
	
	private String account_name;
	private String status;	// 자산상태
	private BigDecimal now; // 당기상각액
	public String getNow2() {
		if(now!=null)
		return now.toPlainString();
		return null;
	}
	private BigDecimal total; //상각누계액
	public String getTotal2() {
		if(total!=null) 
		return total.toPlainString();
		return null;
	}
	@MimeChecker(contentType = "image/*")
	private MultipartFile img;

	public void saveFile(File saveFolder) throws IllegalStateException, IOException {
		if (img == null)
			return;
		File saveFile = new File(saveFolder, fixassets_no+"");
		img.transferTo(saveFile);
	}
	
}
