<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="retireMail">

<table class="table table-bordered  text-left" border="1" style='width:600px;height:800px;'>
	<thead class="">
		<tr>
			<th>입사일 </th> 
			<td>${emp.hire_date}</td>
			<th>퇴사일 </th> 
			<td>${emp.retire_date}</td>
		</tr>
		<tr>	
			<th>퇴직금지급일 </th> 
			<td>${emp.payment_day}</td>
			<th>퇴직 기준일</th> 
			<td>${emp.payment_day}</td>
		</tr>
		<tr>
			<th>소속</th>
			<td>${emp.dep_no}</td>
			<th>직급</th>	
			<td>${emp.pos_no}</td>
		</tr>
		<tr>			
			<th>사원ID </th>
			<td>${emp.emp_no}</td>
			<th> 성명 </th>
			<td>${emp.emp_name}</td>	
		</tr>
		 <tr >
			<th>근속일수 </th> 
			<fmt:parseDate var="sDate"  value="${emp.hire_date}" pattern="yyyy-MM-dd"/>
			<fmt:parseNumber value="${sDate.time/(1000*60*60*24)}" integerOnly="true" var="stDate"/>
			<fmt:parseDate var="eDate"  value="${emp.retire_date}" pattern="yyyy-MM-dd"/>
			<fmt:parseNumber value="${eDate.time/(1000*60*60*24)}" integerOnly="true" var="etDate"/>
			<td>${etDate-stDate}일</td>
			<th>퇴직사유 </th> 
			<td>${emp.retire_reason}</td>
			
		</tr> 
		<tr>		
			<th>퇴직금 </th>
			<fmt:parseNumber var="reMo" value="${emp.retire_salary}" integerOnly="true" />
			<fmt:formatNumber type="number" var="reMo1" value="${reMo}" />
			<td>${reMo1} 원</td>
			<th>퇴직소득세</th>
			<fmt:parseNumber var="reTax" value="${emp.deduction}" integerOnly="true" />
			<fmt:formatNumber type="number" var="reTax1" value="${reTax}" />
			<td>${reTax1} 원</td>
			
		</tr>
		<tr>
			<th>예금주</th>
			<td>${emp.emp_name}</td>
			<th>차인지급액</th>
			<fmt:parseNumber var="realMoney" value="${emp.retire_salary - emp.deduction}" integerOnly="true" />
			<fmt:formatNumber type="number" var="realMoney1" value="${realMoney}" />
			<td>${realMoney1} 원 </td>
		</tr>
		<tr>	
			<th>은행명</th>
			<td>${emp.bank }</td>
			<th>계좌번호</th>
			<td>${emp.emp_bankno}</td>
			
		</tr>
		
		</thead>
	</tbody>
	
</table>
</div>
<div  class=" form-inline d-flex ml-md-auto d-print-none middleDiv">
	<input class="form-control " style="width:350px;" type="text" value="${emp.emp_email}" > 
	<input class="btn btn-outline-info mr-2" type="submit" value="전송"> 
</div>




<script type="text/javascript">
	// 금액 ,  찍어주는거 
     function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	}
    // 메일 내용하고 메일주소를 같이 묶어서 보내야 함
     // map형태로 만들어서 mail로 묶어서  data에 보냄 
    

     $("input[type='submit']").on("click",function(){
    	  
	     var mail = { content : $("#retireMail").html(),  mailadd : $("input[type='text']").val() }
    	
	     $.ajax({
    		  url : "${cPath}/emp/retire/retireMail",
    		  headers:{
	    		  "Content-Type" : 'application/json'
    		  },
    		  dataType : "html", // 컨트롤러에서 결과 값을 받을거
    		  type : 'post',
    		  data : JSON.stringify(mail),  // div로 묶은 내용을 mail에 담아서 보내기
    		  // 스크립트를 json으로 마쉘링 하는거 
    		  success : function(resp){
    			 	
    				  alert("메일이 전송되었습니다.");
    				 $("#exampleModal").modal("hide");
    		  }
    		  
    	  });
     });

</script>