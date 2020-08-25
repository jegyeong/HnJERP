<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<h2>공지사항 상세보기</h2>
<div class='tableStyle'>
<table class="table table-bordered">
	<tbody>
		<tr>
			<td>제목  : ${notice.notice_title}</td>
			<td>조회수 : ${notice.notice_view}</td>
		</tr>
		
		<tr>
			<td>작성자 : ${notice.emp_name}
			
			</td>
			
			<td>작성일  : ${notice.notice_date }</td>
		</tr>
		
	<%-- 	<tr>
		
		<c:if test="${not empty notice.attatchList }">
			<tr>
				<td>기존파일</td>
				<td>
					<c:forEach items="${notice.attatchList }" var="attatch" varStatus="vs">
						<span class="eachAttatch">${attatch.attatch_name }
							<span class="delBtn" data-attno="${attatch.attatch_code }">[DEL]</span>${not vs.last?"&nbsp;":"" }</span>
					</c:forEach>                                     
				</td>
			</tr>
		</c:if>
		
		</tr> --%>
		
		<tr>
			<td colspan="2">
			<form id="delForm" method="post">
				<input type="hidden" name="emp_pass" id="emp_pass" value="${notice.emp_pass }"/>
				<input type="hidden" name="_method" value="delete"/>
				<input type="hidden" name="notice_no" value="${notice.notice_no }"/>
					<c:forEach items="${notice.attatchList }" var="attatch" varStatus="vs">
						<input type="hidden" id="delAtt" name="deleteAttatches" value="${attatch.att_no }">
						<a href="<c:url value='/notice/file/${attatch.att_no }'/>">${attatch.att_filename }</a> ${not vs.last?"&nbsp;":"" }
					</c:forEach>
			</form>
			</td>
		</tr>	
	
		<tr>
			<td colspan="2">${notice.notice_content }</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-warning" value="수정하기" 
					onclick="location.href='<c:url value="/notice/${notice.notice_no }/form"/>';"
				/>
				<input type="button" class="btn btn-outline-danger" value="삭제하기" id="del"	/>
				<input type="button" class="btn btn-outline-secondary" value="뒤로가기" 
					onclick="history.back();"
				/>
				<input type="button" class="btn btn-outline-info" value="목록으로" 
					onclick="location.href='<c:url value='/notice'/>';"
				/>

			</td>
		</tr>
	</tfoot>
</table>
</div>

<script type="text/javascript">
	var empPass = $("#emp_pass").val();
	
	//*********************여기 다시보기 삭제하기**********************

	$(document).ready(function(){
	 	$("#del").on("click", function(){
			let pass = prompt("비밀번호 입력해주세요.");
			
			if(pass == empPass){
				$.ajax({
					 url : "${cPath}/notice/"+${notice.notice_no}+"?emp_pass="+pass,
					 type: 'DELETE',
					 success : function(resp){
						 $("button[value='목록으로']").click();
					 }
						 
				});
				
// 				$("#delForm").submit();
				
			}else{
				alert("입력하신 비밀번호가 틀립니다.");
			}
		});

		
		
	});

</script>







