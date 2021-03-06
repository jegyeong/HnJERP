<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

   <table id="tranTable" class="table table-hover">
   		<thead>
   			<tr>
   				<th>출하번호</th>
   				<th>주문서번호</th>
   				<th>작성일자</th>
   				<th>출하일</th>
   				<th>담당자명</th>
   				<th>거래처명</th>
   				<th>진행상태</th>
   			</tr>
   		</thead>
   		<tbody>
	  			<c:if test="${not empty shipList }">
   				<c:forEach items="${shipList }" var="ship">
   					<c:if test="${not empty ship.deliveryList }">
   					<c:forEach items="${ship.deliveryList }" var="delivery">
	   					<c:if test="${not empty delivery.order }">
	   					<c:forEach items="${delivery.order }" var="list">
   					<tr>
   						<td class="ship_no">${ship.ship_no }</td>
   						<td class="or_no">${list.or_no }</td>
   						<td class="ship_date">${ship.ship_date }</td>
   						<td class="ship_p_date">${ship.ship_p_date }</td>
   						<td class="emp_name">${ship.emp_name }</td>
   						<td class="buyer_name">${ship.buyer_name }</td>
   						<td class="ship_prog">${ship.ship_prog }
   						<input type="hidden" class="emp_no" value="${ship.emp_no }">
   						<input type="hidden" class="buyer_no" value="${ship.buyer_no }">
   						<table class="prodDiv">
   						
   							<c:forEach items="${list.orderList }" var="orList">
								<c:if test="${orList.prodList!=null }">
	   							<c:forEach items="${orList.prodList }" var="prod">
<%-- 	   							<input type="hidden" value="${prod }" id="list"> --%>
   								<tr>
   									<td>#</td>
   									<td class="prod_no">${prod.prod_no }<input type='hidden' name='prod_no' value='${prod.prod_no }'></td>
   									<td class="prod_name">${prod.prod_name }<input type='hidden' name='prod_name' value='${prod.prod_name }'></td>
   									<td>${prod.prod_standard }${prod.prod_stand_size }</td>
   									<td class="prod_out_price">${prod.prod_out_price }<input type='hidden' name='orp_qty' value='${orList.orp_qty }'></td>
   									<td class="orp_qty">${orList.orp_qty }</td>
<%--    									<td>${orList.orp_price*0.1 }</td> --%>
   									<td><input type="text"></td>
<%--    									<td>${prod.prod_out_price*orList.orp_qty+orList.orp_price*0.1 }</td> --%>
   								</tr>
	   							</c:forEach>
	   							</c:if>
							</c:forEach>
   						</table>
   						</td>
   					</tr>
	   				</c:forEach>	
					</c:if>
   				</c:forEach>	
				</c:if>
			</c:forEach>
   			</c:if>
   		</tbody>
   </table>   
   
<script type="text/javascript">
   	$(".prodDiv").hide();	
 </script>
    