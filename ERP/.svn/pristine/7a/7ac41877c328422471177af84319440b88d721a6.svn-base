<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!-- 마이페이지 공지사항 -->
<h2>공지사항</h2>
		<div class="middleDiv form-inline d-flex ml-md-auto d-print-none" id="searchUI">

		<tr>
			<td >
					<select name="searchType" class="form-control mr-2">
						<option value="" ${empty pagingVO.searchVO.searchType?"selected":"" }>
 							<spring:message code="all" /> 
						</option>
						<option value="title" ${pagingVO.searchVO.searchType eq 'title'?"selected":"" }>
							<spring:message code="title" /> 
						</option>
						<option value="writer" ${pagingVO.searchVO.searchType eq 'writer'?"selected":"" }>
							<spring:message code="writer" /> 
						</option>
						<option value="content" ${pagingVO.searchVO.searchType eq 'content'?"selected":"" }>
						<spring:message code="content" /> 
						</option>
					</select>
					<input type="text" class="form-control mr-2" name="searchWord"
						value="${pagingVO.searchVO.searchWord }"
						onkeyup="event.keyCode==13?$('#searchBtn').trigger('click'):'';"
					>
					<input class="btn btn-success mr-2" type="button" value="<spring:message code='search'/>" id="searchBtn">
<%-- 					<input class="btn btn-success mr-2" type="button" value="<spring:message code='newBoard'/>"  --%>
<%-- 						onclick="location.href='<c:url value="/notice/form"/>';" --%>

			</td>
		</tr>
	
				</div>
					
<div class = 'tableStyle'>
<table  class="table table-bordered table-hover text-left">
	
	<thead class="table-primary">
		<tr>
			
			<th>no</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody id="listBody">
		
	</tbody>

</table>
</div>    

<div class ='middleDiv'>
	<nav id="pagingArea" class="d-flex ml-md-auto d-print-none">${pagingVO.pagingHTML }	</nav>
</div>	

	
<form id="searchForm" action="${pageContext.request.contextPath }/notice">
	<input type="hidden" name="page" value="${param.page }"/>
	<input type="hidden" name="searchType" value=""/>
	<input type="hidden" name="searchWord" value=""/>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
<script type="text/javascript">
	var listBody = $("#listBody");
	var searchForm = $("#searchForm").paging({
		searchUI:"#searchUI",
		searchBtn:"#searchBtn",
		pagination:"#pagingArea",
		pageParam:"page",
		byAjax:true,
		success:function(resp){
			let boardList = resp.dataList;
			let pagingHTML = resp.pagingHTML;
			let trTags = [];
			if(boardList.length>0){
				$.each(boardList, function(idx, notice){
					let trTag = $("<tr>").append(
									$("<td>").text(notice.rnum)
									, $("<td>").text(notice.notice_title).append($("<input>").attr({type:"hidden", value:notice.notice_no}))
									, $("<td>").text(notice.emp_name)
									, $("<td>").text(notice.notice_date)
									, $("<td>").text(notice.notice_view));
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

	
	// 행 하나를 눌렀을 떄  클릭 시점을 사원으로 잡는거 
	$("#listBody").on("click","tr",function(){
		let notice_no = $(this).find("td").eq(1).find("input").val();
		console.log(notice_no);
		loadAssetsView(notice_no);
	}).css({
		cursor:"pointer"
	});
	
//  행클릭시 화면전환으로 변경
	function loadAssetsView(notice_no){
		console.log(notice_no);
		$.ajax({
			url : "<c:url value='/mypage/myInfo/notice/'/>"+notice_no,
			dataType : "html",
			success : function(resp){
				 location.href = "<c:url value='/mypage/myInfo/notice/'/>"+notice_no
			},
			error : function(errorResp){
				console.log(errorResp.status + ":" + errorResp.responseText);
			}
		});
	}
</script>