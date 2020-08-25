<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<h2>부서별 인사현황 </h2>  

<div class='tableStyle'>
<table class="table table-bordered  text-left">
	<thead class="table-primary">
		<tr>
			<td>부서 </td>
			<td>1팀 </td>
			<td>2팀 </td>
			<td>3팀 </td>
			<td>총인원 </td>
		</tr>
	</thead>
	<tbody>
		<c:if test="${not empty acList }">
			<tr>
				<td>회계부서</td>
			<c:forEach items="${acList }" var="ac">
				<td>${ac }</td>
			</c:forEach>
			</tr>
		</c:if>
		<c:if test="${not empty buyList }">
			<tr>
				<td>구매부서</td>
			<c:forEach items="${buyList }" var="ac">
				<td>${ac }</td>
			</c:forEach>
			</tr>
		</c:if>
		<c:if test="${not empty whList }">
			<tr>
				<td>자재부서</td>
			<c:forEach items="${whList }" var="ac">
				<td>${ac }</td>
			</c:forEach>
			</tr>
		</c:if>
		<c:if test="${not empty productList }">
			<tr>
				<td>생산부서</td>
			<c:forEach items="${productList }" var="ac">
				<td>${ac }</td>
			</c:forEach>
			</tr>
		</c:if>
		<c:if test="${not empty orderList }">
			<tr>
				<td>영업부서</td>
			<c:forEach items="${orderList }" var="ac">
				<td>${ac }</td>
			</c:forEach>
			</tr>
		</c:if>
		<c:if test="${not empty empList }">
			<tr>
				<td>인사부서</td>
			<c:forEach items="${empList }" var="ac">
				<td>${ac }</td>
			</c:forEach>
			</tr>
		</c:if>
	</tbody>
</table>
</div>
<%

SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일");

%>

<div  style="margin: 30px; margin-right: 55px;">
	<table>
		<tr class="row">
			<td class="col ">
			<div>집계 기준일 : <%=sf.format(new Date()) %></div> 
			</td>
		</tr>
	</table>
</div>




