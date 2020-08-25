<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<h1 style="padding-left: 30px; padding-top: 25px;">나의 근태관리</h1>  

<div class="form-inline d-flex ml-md-auto d-print-none" id="searchUI" style="padding-left: 30px; padding-top: 10px;">
 <table class="">
 <thead class="">
		<tr class="row">
			<th>날짜</th>
			<td class=""><input type="date" name="work_date">
			<input type="submit" value="검색" id="searchBtn" class="btn btn-outline-secondary" ></td>
		</tr>	
</thead>
</table>
</div>

<div style="background-color: white; margin: 30px; margin-right: 55px;">
<table class="table table-bordered table-hover text-left">
	<thead class="table-primary" >
		<tr>
			<th>No.</th>
			<th>날짜</th>
			<th>사원번호</th>
			<th>출근시간</th>
			<th>퇴근시간</th>
			<th>지각시간</th>
			<th>연장시간</th>
		</tr>
	</thead>
	<tbody id="listBody">
		
	</tbody>
</table>
</div>
<div style="padding-left: 30px; padding-top: 10px;">
	<nav id="pagingArea" class="d-flex ml-md-auto d-print-none">
		${pagingVO.pagingHTML }
	</nav>	
</div>

<form id="searchForm" action="${pageContext.request.contextPath}/emp/work" method="get">
	<input type="hidden" name="page" value="${param.page }"/>
	<input type="hidden" name="work_date" value=""/>
	<input type="hidden" name="dep_no2" value=""/>
	<input type="hidden" name="dep_no" value=""/>
	<input type="hidden" name='emp_no' value="${authUser.emp_no }">
</form> 


<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/js/dynamicSelect.js?time=${System.currentTimeMillis()}"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/js/paging.js?time=${System.currentTimeMillis()}"></script>
	
<script type="text/javascript">

		// 옵션 선택시 
// 		var optionPtrn = "<option value='%V'  %S>%T</option>";
// 		var departmentCode = $("select[name='dep_no2']").data( // 부서코드
// 				"success",
// 				function(resp) { // 콘트롤러의 리턴 값  departmentList가 resp에 담기는거 
// 					var html = "";
// 					$.each(resp, function(idx, dep) {
// 						html += optionPtrn.replace("%V", dep.DEP_NO)
// 								.replace("%T", dep.DEP_NAME);
// 					});
// 					departmentCode.append(html);
// 				}).on("change", function() {  // 부서 선택 마다 소속팀이 바뀌는거 
// 			let dep_no = $(this).val();
		
// 			dep_no2.trigger("renew", {
// 				dep_no2 : dep_no
// 			});
// 		});
		
// 		var dep_no2 = $("select[name='dep_no']").data( // 소속 팀
// 				"success",
// 				function(resp) {
// 					var html = "<option value>소속팀</option>";
// 					$.each(resp, function(idx, dep) {
// 						html += optionPtrn.replace("%V", dep.dep_no)
// 								.replace("%T", dep.dep_name);
// 					});
// 					dep_no2.html(html);
// 				});
		
// 		$(".dynamicElement").dynamicSelect();

	
	// 리스트 목록 출력 하는거 
	
	var listBody = $("#listBody");
	var searchForm = $("#searchForm").paging({
		searchUI:"#searchUI",
		searchBtn:"#searchBtn",
		pagination:"#pagingArea",
		pageParam:"page",
		byAjax:true,
		success:function(resp){
			let workList = resp.dataList;
			let pagingHTML = resp.pagingHTML;
			let trTags = [];
			if(workList.length>0){
				$.each(workList, function(idx, work){
					let trTag = $("<tr>").append(
									$("<td>").text(work.rnum)
									, $("<td>").text(work.work_date)
									, $("<td>").text(work.emp_no)
									, $("<td>").text(work.work_time)
									, $("<td>").text(work.offwork_time)
									, $("<td>").text(work.lateTime)
									, $("<td>").text(work.extendsTime)); // 연장시간
					trTags.push(trTag);
				});
				$("#pagingArea").html(pagingHTML);
			}else{
				trTags.push($("<tr>").html($("<td colspan='8'>").text("조건에 맞는 게시글이 없음.")));
				$("#pagingArea").empty();
			}
			listBody.html(trTags);
			listBody.data("currentpage", resp.currentPage);
			searchForm.find("[name='page']").val("");
		}
	}).submit();

</script>