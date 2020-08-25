<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- <h2 style="padding-left: 30px; padding-top: 25px;">원자재 상세보기</h2> -->

<div style="background-color: white; margin: 30px; margin-right: 55px;">
	<table class="table">
		<tr>
			<th>
				<spring:message code="mat.mat_no"/>
			</th>
			<td>${mat.mat_no }</td>
		</tr>
		<tr>
			<th>
				<spring:message code="mat.mat_name"/>
			</th>
			<td>${mat.mat_name }</td>
		</tr>
		<tr>
			<th>
				<spring:message code="mat.lprod_no"/>
			</th>
			<td>${mat.lprod_no }</td>
		</tr>
		<tr>
			<th>
				<spring:message code="mat.mat_standard"/>
			</th>
			<td>${mat.mat_standard }</td>
		</tr>
		<tr>
			<th>
				<spring:message code="mat.mat_stand_size"/>
			</th>
			<td>${mat.mat_stand_size }</td>
		</tr>
		<tr>
			<th>
				<spring:message code="mat.mat_validity"/>
			</th>
			<td>${mat.mat_validity }</td>
		</tr>
		<tr>
			<th>
				<spring:message code="mat.stock"/>
			</th>
			<td>${mat.mat_stock }</td>
		</tr>
		<tr>
			<th>
				<spring:message code="mat.mat_safe_stock"/>
			</th>
			<td>${mat.mat_safe_stock }</td>
		</tr>
		<tr>
			<th>
				<spring:message code="mat.mat_stock_size"/>
			</th>
			<td>${mat.mat_stock_size }</td>
		</tr>
		<tr>
			<th>
				<spring:message code="mat.mat_use"/>
			</th>
			<td>${mat.mat_use eq 'G001' ?'사용중' : '사용중지'}</td>
		</tr>
	</table>
</div>