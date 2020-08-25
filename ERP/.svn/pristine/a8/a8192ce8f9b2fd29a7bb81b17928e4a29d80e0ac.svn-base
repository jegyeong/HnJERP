<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h2 style="padding-left: 30px; padding-top: 25px;">생산요청 상품 목록</h2>

<div style="padding-left: 30px; padding-top: 10px;">
	<form:form id="searchForm" action="${cPath }/ware/outer/prod" method="get">
		<input type="hidden" name="page" value=""/>
		<table class="table">
			<tr>
				<th>
					<spring:message code="prod.prod_name"/>
				</th>
				<td><input type="text" name="prod_name"/></td>
				<th>
					<spring:message code="prod.prod_no"/>
				</th>
				<td colspan="2"><input type="text" name="prod_no"/></td>
			</tr>
			<tr>
				<th>
					<spring:message code="prod.prod_out_price"/>
				</th>
				<td>
					<input type="number" name="startPrice" style="width:130px"/>
						&nbsp;~&nbsp;
					<input type="number" name="endPrice" style="width:130px"/>
				</td>
				<th>
					<spring:message code="prod.prod_use"/>
				</th>
				<td colspan="2">
					<select name="prod_use">
						<option value="">상태</option>
						<option value="G003">생산중</option>
						<option value="G004">생산중단</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<spring:message code="prod.prod_validity"/>
				</th>
				<td>
					<input type="date" name="startDay"/>&nbsp;~&nbsp;<input type="date" name="endDay"/>
				</td>
				<th>
					<spring:message code="prod.lprod_no"/>
				</th>
				<td>
					<select name="lprod_no">
						<option value="">상품 분류</option>
						<c:forEach items="${lprodList }" var="lprod">
							<option value="${lprod.lprod_no}">
								${lprod.lprod_name }
							</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="button" class="btn btn-info" value="검색" id="searchBtn"/></td>
			</tr>
		</table>
	</form:form><!-- 검색 form -->
</div>

<!-- 상품 목록 -->
<div style="background-color: white; margin: 30px; margin-right: 55px;">
	<table class="table">
		<thead class="table-primary">
			<tr>
				<th>
					<spring:message code="prod.rnum"/>
				</th>
				<th>
					<spring:message code="prod.prod_no"/>
				</th>
				<th>
					<spring:message code="prod.prod_name"/>
				</th>
				<th>
					<spring:message code="prod.prod_stock"/>
				</th>
				<th>
					<spring:message code="prod.prod_safe_stock"/>
				</th>
				<th>
					<spring:message code="prod.prod_stock_size"/>
				</th>
				<th>
					<spring:message code="prod.prod_out_price"/>
				</th>
				<th>생산신청</th>
			</tr>
		</thead>
		<tbody id="listbody"></tbody>
	</table>
</div>

<div style="padding-left: 30px; padding-top: 10px;">
	<nav id="pagingArea" class="d-flex ml-md-auto d-print-none">
		${pagingVO.pagingHTML }
	</nav>	
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
<script type="text/javascript">

	var listbody = $("#listbody");

	var searchForm = $("#searchForm").paging({
		searchUI : "#searchUI",
		searchBtn : "#searchBtn",
		pagination : "#pagingArea",
		pageParam : "page",
		byAjax : true,
		success : function(resp){
			let prodList = resp.dataList;
			console.log(prodList);
			let pagingHTML = resp.pagingHTML;
			let trTags = [];
			if(prodList.length > 0){
				$.each(prodList, function(idx,prod){
					let trTag = $("<tr>").append(
						$("<td>").text(prod.rnum),
						$("<td>").text(prod.prod_no),
						$("<td>").text(prod.prod_name),
						$("<td>").text(prod.prod_stock),
						$("<td>").text(prod.prod_safe_stock),
						$("<td>").text(prod.prod_stock_size),
						$("<td>").text(prod.prod_out_price),
						$("<td>").html(
							$("<a>").attr("href", "${cPath }/ware/outer/prod/pduct/insert/"+prod.prod_no)
							.html("생산 신청")													
						)						
					).data("prod_no",prod.prod_no);
					trTags.push(trTag);
				});
			$("#pagingArea").html(pagingHTML);
			}else{
				trTags.push($("<tr>").html(
					$("<td colspan='8'>").text("조건에 맞는 상품이 없습니다.")		
				));
				$("#pagingArea").empty();
			}
			$("#listbody").html(trTags);
			listbody.data("currentPage",resp.currentPage);
			searchForm.find("[name='page']").val("");
		}
	}).submit();

</script>
