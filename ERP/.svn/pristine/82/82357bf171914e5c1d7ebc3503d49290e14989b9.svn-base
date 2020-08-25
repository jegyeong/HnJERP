<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<h2>비밀번호 변경</h2>  

<div class="tableStyle" >  
<table class="table table-bordered  text-left">
	<tbody id="listBody">
		<tr>
		<th>기본 비밀번호 </th>
		<td>
		<input type="text" id="emp_pass"  class="form-control" style="width:200px;" name="emp_pass">
		
		</td>
		</tr>
		
		<tr>
		<th>새 비밀번호 </th>
		<td><input type="text" id="password1" class="form-control" style="width:200px;" name="emp_pass"></td>
		</tr>
		
		<tr>
			<th>새 비밀번호 확인 </th>
				<td><input type="text" id="password2" class="form-control"  style="width:200px;" name="emp_pass"></td>
		</tr>
	</tbody>
</table>
</div>
<button type="button" style="float: right; margin: 0 1000px 0 0;"  id="popupBtn" class="btn btn-outline-success ">변경하기</button>


<script type="text/javascript">
 $(document).ready(function(){
	 $('#popupBtn').on("click", function(){
		// 입력창에 들어간 값 
		 var pwd1 = $("#emp_pass").val(); 
		// 기존의 비번과 입력한 비번과 동일한지 확인 
		 var emp_pass =  "${authUser.emp_pass}"; 
		 console.log(emp_pass);
		 
		 // 새 비밀번호 1
		 var pass1 = $("#password1").val();
		 // 새 비밀번호 2
		 var pass2 = $("#password2").val();
				
		 var emp_no = "${authUser.emp_no}";  // 사원 비번 
		 
	//  경우1)	  기존 비번과 입력한 비번이 동일시에 새로입력한 비번1,2 가 동일한지 확인 후 비번  update
				
		 if(pwd1 == emp_pass){
			 if(pass1 == pass2){
				 $.ajax({
					 url : "${cPath}/mypage/myInfo/passWordChange/update",
					 type: 'post',
					 data : {
						 'emp_no' : emp_no,
						 'emp_name' : pwd1, // 기존의 비번을 입력받은거 
						 'emp_pass' : pass2  // 새로 변경된 비번 
					 },
					 dataType: "text",
					 success : function(resp){
						 if(resp =='수정성공'){
							 
							 alert("새로운 비밀번호로 변경했습니다.");
							 
							 window.history.back();
							 
						 }else if( resp == '수정실패'){
							 
							alert("새로운 비밀번호 변경 실패했습니다.");	 
							
							$("input[name='emp_pass']").val('');
						 }
					 }
				 })
			 }else{
				 alert("새로운 비밀번호 변경 실패했습니다. 다시 시도해주세요");
			 }
			 
	//	경우2)  기존 비번과 입력한 비번이 동일하지 않으면  새로입력한 비번1,2 가 동일하지 않으면  새로입력한 비번이 같아도 update가 안됨
		 }else{
			 alert("기존 비밀번호가 불일치 합니다.");
		 }
	 });
	 
 })
</script>

