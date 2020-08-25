<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


 <!--  급여내역 상세페이지 -->
<table class="table table-bordered  text-left">
	<thead class="table-primary">
		<tr >
			<th>사원ID</th>  
			<td> ${empVO.emp_no}</td> 
			<th>소속팀</th>
			<td> ${empVO.dep_no} </td>
			<th>성명</th>
			<td> ${empVO.emp_name} </td>
		</tr>
		<tr>
			<th>근무기간</th>
			<td>${empVO.work_start_day } ~ ${empVO.work_end_day }</td>
			<th>직급 </th>
			<td> ${empVO.pos_no}</td>
			<th>지급일 </th>
			<td>${empVO.sal_date} </td>
		</tr>
		<tr>
			<th>은행명 </th>
			<td> ${empVO.bank}</td>
			<th>예금주 </th>
			<td> ${empVO.emp_name} </td>
			<th>계좌번호  </th>
			<td>${empVO.emp_bankno}</td>		
		</tr>
		
	</thead>
</table>	
  
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
			<fmt:parseNumber var="mySalary" value="${empVO.my_basicsalary}" integerOnly="true" />
			<fmt:formatNumber type="number" var="mySalary1" value="${mySalary}" />
			<td>${mySalary1}원</td>
			<th>소득세 </th>
			<fmt:parseNumber var="percent" value="${ empVO.my_basicsalary / 168}" integerOnly="true" />
			<fmt:formatNumber type="number" var="percent1" value="${percent }" />
			<td>${percent1} 원</td>
			
		</tr>
		<tr>
			<th>연장수당 </th>
			<fmt:parseNumber var="extense" value="${ empVO.extension_pay}" integerOnly="true" />
			<fmt:formatNumber type="number" var="extense1" value="${extense }" />
			<td>${extense1} 원</td>
			<th>주민세</th>
			<fmt:parseNumber var="juminTax" value="${ empVO.my_basicsalary / 168 * 0.1}" integerOnly="true" />
			<fmt:formatNumber type="number" var="juminTax1" value="${juminTax }" />
			<td>${juminTax1} 원</td>
			
			
		</tr>
		<tr>
			<td></td>
			<fmt:parseNumber var="eatPrice" value="" integerOnly="true" />
			<fmt:formatNumber type="number" var="eatPrice1" value="" />
			<td></td>
			<th>고용보험 </th>
			<fmt:parseNumber var="goBOHUM" value="${empVO.my_basicsalary * 0.0065 }" integerOnly="true" />
			<fmt:formatNumber type="number" var="goBOHUM1" value="${goBOHUM }" />
			<td>${goBOHUM1 } 원  </td>
			
		</tr>
		<tr>
			<fmt:parseNumber var="BUS" value="" integerOnly="true" />
			<fmt:formatNumber type="number" var="BUS1" value="" />
			<td></td>
			<td></td>
			<th>국민연금 </th>
			<fmt:parseNumber var="KUKMIN" value="${empVO.my_basicsalary * 0.045}" integerOnly="true" />
			<fmt:formatNumber type="number" var="KUKMIN1" value="${KUKMIN }" />
			<td>${KUKMIN1} 원</td>
			
		</tr>
		<tr>
			<th>기타</th>
			<td></td>
			<th>건강보험 </th>
			<fmt:parseNumber var="KUNKANG" value="${empVO.my_basicsalary * 0.03035}" integerOnly="true" />
			<fmt:formatNumber type="number" var="KUNKANG1" value="${KUNKANG }" />
			<td>${KUNKANG1} 원</td>
			
		</tr>
		<tr>
			<td></td>
			<td></td>
			<th>결근공제 </th>
			<td>원</td>
			
		</tr>
		<tr>
			<th>급여계</th>
			<fmt:parseNumber var="SALARYSUM" value="${empVO.extension_pay + empVO.my_basicsalary + (7000 * empVO.work_date) + (1250 * 2 * empVO.work_date)}" integerOnly="true" />
			<fmt:formatNumber type="number" var="SALARYSUM1" value="${SALARYSUM }" />
			<td>${SALARYSUM1} 원</td>
			<th>공제합계 </th>
			<fmt:parseNumber var="GONGJAE" value="${(empVO.my_basicsalary / 168) + (empVO.my_basicsalary / 168 * 0.1)+(empVO.my_basicsalary * 0.0065)+(empVO.my_basicsalary * 0.045 )+(empVO.my_basicsalary * 0.03035) }" integerOnly="true" />
			<fmt:formatNumber type="number" var="GONGJAE1" value="${GONGJAE }" />
			<td>${GONGJAE1} 원</td>
			
		</tr>
		<tr>
			<td></td>
			<td></td>
			<th>실수령액 </th>
			<fmt:parseNumber  var="REMO" value="${(empVO.extension_pay + empVO.my_basicsalary + (7000 * empVO.work_date) + (1250 * 2 * empVO.work_date)) - ((empVO.my_basicsalary / 168) + (empVO.my_basicsalary / 168 * 0.1)+(empVO.my_basicsalary * 0.0065)+(empVO.my_basicsalary * 0.045 )+(empVO.my_basicsalary * 0.03035))}"  integerOnly="true" />
			<fmt:formatNumber type="number" var="REMO1" value="${REMO}" />
			<td>${REMO1} 원 </td>
			 
		</tr>
	</tbody>
	
</table>
</div>