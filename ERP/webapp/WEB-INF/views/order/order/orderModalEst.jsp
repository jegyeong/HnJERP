<%--
* [[개정이력(Modification Information)]]
* 	수정일                수정자      	수정내용
* ----------  ---------  -----------------
* 2020. 8. 14       이제경 	          최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
   <table id="estTable" class="table table-hover">
   		<thead>
   			<tr>
   				<th>견적서번호</th>
   				<th>작성일자</th>
   				<th>담당자명</th>
   				<th>거래처명</th>
   				<th>진행상태</th>
   			</tr>
   		</thead>
   		<tbody>
   			<c:if test="${not empty estList }">
   				<c:forEach items="${estList }" var="est">
   					<tr>
   						<td class="est_no">${est.est_no }</td>
   						<td class="est_date">${est.est_date }</td>
   						<td class="emp_name">${est.emp_name }</td>
   						<td class="buyer_name">${est.buyer_name }</td>
   						<td class="est_prog">${est.est_prog }
   						<input type="hidden" class="emp_no" value="${est.emp_no }">
   						<input type="hidden" class="buyer_no" value="${est.buyer_no }">
   						<table class="prodDiv">
   							<c:forEach items="${est.estimateList }" var="list">
								<c:if test="${list.prodList!=null }">
	   							<c:forEach items="${list.prodList }" var="prod">
   								<tr>
   									<td>
   									
   									#</td>
   									<td>${prod.prod_no }<input type='hidden' name='prod_no' value='${prod.prod_no }'></td>
   									<td>${prod.prod_name }<input type='hidden' name='prod_name' value='${prod.prod_name }'></td>
   									<td>${prod.prod_standard }${prod.prod_stand_size }</td>
   									<td>${list.est_qty }<input type='hidden' name='orp_qty' value='${list.est_qty }'></td>
   									<td>${prod.prod_out_price }</td>
   									<td>${prod.prod_out_price*list.est_qty }<input type='hidden' name='orp_price' value='${prod.prod_out_price*list.est_qty }'></td>
   								</tr>
	   							</c:forEach>
	   							</c:if>
							</c:forEach>
   						</table>
   						</td>
   					</tr>
   				</c:forEach>
   			</c:if>
   		</tbody>
   </table>
   
   <script  type="text/javascript">
   	$(".prodDiv").hide();
   </script>
