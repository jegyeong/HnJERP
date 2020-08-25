<%--
* [[개정이력(Modification Information)]]
* 	수정일                 수정자      	수정내용
* ----------  ---------  -----------------
* 2020. 8. 17      	이제경       	최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<h1>출하지시서</h1>
<c:if test="${delivery != null }"><c:forEach items="${delivery }" var="deliv" begin="0" step="1" varStatus="i">

<table class="table">
	<thead>
		<tr>
			<th><spring:message code="order.or_no" /></th>
			<td>${deliv.or_no }</td>
		</tr>
		<tr>
			<th><spring:message code="delivery.deliv_no" /></th>
			<td>${deliv.deliv_no }</td>
		</tr>
		<tr>
			<th><spring:message code="date" /></th>
			<td>${deliv.deliv_date }</td>
		</tr>
		<tr>
			<th><spring:message code="emp.emp_name" /></th>
			<td>${deliv.emp_name }</td>
		</tr>
		<tr>
			<th><spring:message code="delivery.deliv_schd" /></th>
			<td>${deliv.deliv_schd }</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>#</th>
			<th><spring:message code="prod_code" /></th>
			<th><spring:message code="prod_name" /></th>
			<th><spring:message code="prod_standard" />단위</th>
			<th><spring:message code="prod_qty" /></th>
		</tr>
		<tr>
			<c:if test="${deliv!=null }">
				<c:forEach items="${deliv.order }" var="order">
					<c:if test="${order.orderList!=null }">
					<c:forEach items="${order.orderList }" var="oList">
						<c:if test="${oList.prodList!=null }">
						<c:forEach items="${oList.prodList }" var="pList">
							<tr>
								<td>#</td>
								<td>${pList.prod_no }</td>
								<td>${pList.prod_name }</td>
								<td>${pList.prod_standard }${pList.prod_stand_size }</td>
								<td>${oList.orp_qty }</td>
							</tr>
						</c:forEach>
						</c:if>
					</c:forEach>
					</c:if>
				</c:forEach>
				</c:if>			
		</tr>
	
	</tbody>

</table>
</c:forEach>
</c:if>
