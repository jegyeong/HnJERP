<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


 <!--  급여내역 상세페이지 -->
<div>
<table class="table table-bordered  text-left">
	<thead class="table-primary">
		<tr >
			<th>사원ID</th>  
			<td> ${authUser.emp_no}</td> 
			<th>소속팀</th>
			<td class=col-3> ${authUser.dep_no} </td>
			<th>성명</th>
			<td class=col-3> ${authUser.emp_name} </td>
		</tr>
		<tr>
			<th>근무기간</th>
			<td> 날짜 계산해서 넣어야 함  </td>
			<td>직급 </td>
			<td> ${authUser.pos_no}</td>
			<td>지급일 </td>
			<td>${authUser.sal_date} </td>
		</tr>
		<tr>
			<td>은행명 </td>
			<td> ${authUser.bank}</td>
			<td>예금주 </td>
			<td> ${authUser.emp_name} </td>
			<td>계좌번호  </td>
			<td>${authUser.emp_bankno}</td>		
		</tr>
		
	</thead>
</table>	
 </div> 
  
 <div>
<table class="table table-bordered table-hover text-left">	
	<tbody id="listBody">
		<tr>
			<th>지급항목</th>
			<th>지급액 </th>
			<th>공제항목 </th>
			<th>공제액</th>
			
		</tr>
		<tr>
			<th>기본급 </th>
			<fmt:parseNumber var="mySalary" value="${sal.my_basicsalary}" integerOnly="true" />
			<fmt:formatNumber type="number" var="mySalary1" value="${mySalary}" />
			<td>${mySalary1}원</td>
			<th>소득세 </th>
			<fmt:parseNumber var="percent" value="${ sal.my_basicsalary / 168}" integerOnly="true" />
			<fmt:formatNumber type="number" var="percent1" value="${percent }" />
			<td>${percent1} 원</td>
			
		</tr>
		<tr>
			<th>연장수당 </th>
			<fmt:parseNumber var="extense" value="${ sal.extension_pay}" integerOnly="true" />
			<fmt:formatNumber type="number" var="extense1" value="${extense }" />
			<td>${extense1} 원</td>
			<th>주민세</th>
			<fmt:parseNumber var="juminTax" value="${ sal.my_basicsalary / 168 * 0.1}" integerOnly="true" />
			<fmt:formatNumber type="number" var="juminTax1" value="${juminTax }" />
			<td>${juminTax1} 원</td>
			
			
		</tr>
		<tr>
			<td></td>
			<fmt:parseNumber var="eatPrice" value="" integerOnly="true" />
			<fmt:formatNumber type="number" var="eatPrice1" value="" />
			<td></td>
			<th>고용보험 </th>
			<fmt:parseNumber var="goBOHUM" value="${sal.my_basicsalary * 0.0065 }" integerOnly="true" />
			<fmt:formatNumber type="number" var="goBOHUM1" value="${goBOHUM }" />
			<td>${goBOHUM1 } 원  </td>
			
		</tr>
		<tr>
			<fmt:parseNumber var="BUS" value="" integerOnly="true" />
			<fmt:formatNumber type="number" var="BUS1" value="" />
			<td></td>
			<td></td>
			<th>국민연금 </th>
			<fmt:parseNumber var="KUKMIN" value="${sal.my_basicsalary * 0.045}" integerOnly="true" />
			<fmt:formatNumber type="number" var="KUKMIN1" value="${KUKMIN }" />
			<td>${KUKMIN1} 원</td>
			
		</tr>
		<tr>
			<th>기타</th>
			<td></td>
			<th>건강보험 </th>
			<fmt:parseNumber var="KUNKANG" value="${sal.my_basicsalary * 0.03035}" integerOnly="true" />
			<fmt:formatNumber type="number" var="KUNKANG1" value="${KUNKANG }" />
			<td>${KUNKANG1} 원</td>
			
		</tr>
		<tr>
			<td></td>
			<td></td>
			<th>결근공제 </th>
			<td></td>
			
		</tr>
		<tr>
			<th>급여계</th>
			<fmt:parseNumber var="SALARYSUM" value="${sal.extension_pay + sal.my_basicsalary + (7000 * work.work_date) + (1250 * 2 * work.work_date)}" integerOnly="true" />
			<fmt:formatNumber type="number" var="SALARYSUM1" value="${SALARYSUM }" />
			<td>${SALARYSUM1}</td>
			<th>공제합계 </th>
			<fmt:parseNumber var="GONGJAE" value="${(sal.my_basicsalary / 168) + (sal.my_basicsalary / 168 * 0.1)+(sal.my_basicsalary * 0.0065)+(sal.my_basicsalary * 0.045 )+(sal.my_basicsalary * 0.03035) }" integerOnly="true" />
			<fmt:formatNumber type="number" var="GONGJAE1" value="${GONGJAE }" />
			<td>${GONGJAE1}</td>
			
		</tr>
		<tr>
			<td></td>
			<td></td>
			<th>실수령액 </th>
			<fmt:parseNumber  var="REMO" value="${(sal.extension_pay + sal.my_basicsalary + (7000 * work.work_date) + (1250 * 2 * work.work_date)) - ((sal.my_basicsalary / 168) + (sal.my_basicsalary / 168 * 0.1)+(sal.my_basicsalary * 0.0065)+(sal.my_basicsalary * 0.045 )+(sal.my_basicsalary * 0.03035))}"  integerOnly="true" />
			<fmt:formatNumber type="number" var="REMO1" value="${REMO}" />
			<td>${REMO1} </td>
			
		</tr>
	</tbody>
	
</table>
</div>