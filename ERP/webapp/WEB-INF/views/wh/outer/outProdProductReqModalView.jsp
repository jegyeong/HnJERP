<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!--  <h2 style="padding-left: 30px; padding-top: 25px;">생산의뢰서 상세보기</h2> -->

<div style="background-color: white; margin: 30px; margin-right: 55px;">
	<table class="table">
		<thead>
			<tr>
				<th>생산의뢰번호</th>
				<td>${pductOrVO.porder_no }</td>
				<th>작성일자</th>
				<td>${pductOrVO.porder_date }</td>
			</tr>
			<tr>
				<th>소속부서</th>
				<td>${pductOrVO.dep_name }</td>
				<th>사원이름</th>
				<td>${pductOrVO.emp_name }</td>
			</tr>
		</thead>
			<c:choose>
				<c:when test="${not empty pductOrVO.pductList}">
					<c:forEach items="${pductOrVO.pductList }" var="pductlist">
					<tr>
						<th colspan="4">상품</th>
					</tr>
						<tr class="table-info">
							<th>
								#
							</th>
							<th>
								<spring:message code="pductlist.prod_no"/>
							</th>
							<th>
								<spring:message code="prod.prod_name"/>
							</th>
							<th>
								<spring:message code="pductlist.pduct_cnt"/>
							</th>
						</tr>
						<tr>
							<td>${pductOrVO.rnum }</td>
							<td>${pductlist.prod_no }</td>
							<td>${pductlist.prodvo.prod_name }</td>
							<td>${pductlist.pduct_cnt }</td>
						</tr>
						<tr>
							
							
						</tr>
						<tfoot>
						<tr>
							<th colspan="4">BOM</th>
						</tr>
						<tr class="table-info">
							<th>
								<spring:message code="bom.mat_no"/>
							</th>
							<th>
								<spring:message code="mat.mat_name"/>
							</th>
							<th>
								<spring:message code="bom.mat_number"/>
							</th>
							<th>
								<spring:message code="bom.mat_size"/>
							</th>
						</tr>
							<c:choose>
								<c:when test="${not empty pductOrVO.pductList}">
									<c:forEach items="${pductOrVO.pductList }" var="pductlist">
										<c:forEach items="${pductlist.prodvo.bomlist }" var="bom">
											<c:forEach items="${bom.matList }" var="mat">
												<tr>
													<td>${bom.mat_no}</td>
													<td>${mat.mat_name }</td>
													<td>${bom.mat_number }</td>
													<td>${bom.mat_size }</td>
												</tr>
											</c:forEach>
										</c:forEach>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<th></th>
										<th colspan="3">BOM 정보 없음</th>
									</tr>
								</c:otherwise>
							</c:choose>
						</tfoot>
					</c:forEach>
				</c:when>
			</c:choose>
	</table>
</div>