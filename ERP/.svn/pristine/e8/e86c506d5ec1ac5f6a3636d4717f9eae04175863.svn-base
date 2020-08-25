<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
.tab { white-space: pre; }
</style>
<h2>재무상태표</h2>
				<div class="form-inline d-flex ml-md-auto d-print-none middleDiv" id="searchUI"class='text-right'>
					<text>기준</text>
					<select name="standard" id="standard" class="form-control mr-2">
						<option value>년도</option>
					</select>
					<text>비교</text>
					<select name="compare" id="compare" class="form-control mr-2">
						<option value>년도</option>
					</select>
					<input class="btn btn-primary mr-2" type="button" value="<spring:message code='search'/>" id="searchBtn" onclick="page();">
				</div>
<div class='tableStyle'>
<table class="table table-bordered table-hover text-left table-condensed">
	<thead class="table-primary text-center">
		<tr>
			<th>재무제표표시명</th>
			<th colspan='2' id="standardth">기준</th>
			<th colspan='2' id="compareth">비교</th>
		</tr>
	</thead>
	<tbody id="listBody">
	</tbody>
</table>
</div>
<form id="searchForm" action="${cPath }/account/plusMinus">
	<input type="hidden" name="base_year" value="${param.base_year }"/>
	<input type="hidden" name="compare_year" value="${param.compare_year }"/>
</form>
</div>
<script>
for(var i = new Date().getFullYear(); i >= ${year}; i--){
	$("#standard").append($("<option>").text(i).val(i));
	$("#compare").append($("<option>").text(i).val(i));
}
function page(){
	var standard = $("#standard").val();
	var compare = $("#compare").val();
	if(standard) $("#standardth").text("기준 (" + standard + "년)");
	else $("#standardth").text("기준 (" + new Date().getFullYear() + "년)");
	if(compare) $("#compareth").text("비교 (" + compare + "년)");
	else $("#compareth").text("비교 (" + (new Date().getFullYear() - 1) + "년)");
	$.ajax({
		url : "${cPath}${currentPage}",
		data : {
			standard:standard,
			compare:compare
		},
		dataType : "json", // Accept:application/json, Content-Type:application/json
		success : function(resp) {
			let result = resp;
			let division = "";
			let standard_name = "";
			let standardsum = 0;
			let comparesum = 0;
			let standardsumsum = 0;
			let comparesumsum = 0;
			let standardtotal = 0;
			let comparetotal = 0;
			let sumtag = [];
			let trTags = [];
			let trTag = null;
			let standardTd = null;
			let compareTd = null;
			$.each(result,function(idx, list){
				if(division!=list.division){
					if(idx!=0){
						trTag = $("<tr>").append(
							$("<td>").text(division + " 총계")
							,$("<td>")
							,$("<td>").text(numberWithCommas(standardsumsum))
							,$("<td>")
							,$("<td>").text(numberWithCommas(comparesumsum))
						).css("background-color","lightgray");
						trTags.push(trTag);
					}
					division = list.division;
					trTag = $("<tr>").append(
							$("<th>").attr("colspan","5").text(division)
					).css("color","blue").css("text-align","center");
					trTags.push(trTag);
					standardsumsum = 0;
					comparesumsum = 0;
				}
					if(standard_name!=list.standard_name){
						standard_name = list.standard_name;
						if(idx != 0){
							$(standardTd).text(numberWithCommas(standardsum));
							$(compareTd).text(numberWithCommas(comparesum));
						}
						trTag = $("<tr>").append(
							$("<td>").html("<span class='tab'>&#9;</span><span class='tab'>&#9;</span>" + standard_name)
							,$("<td>")
							,standardTd = $("<td>")
							,$("<td>")
							,compareTd = $("<td>")
						).css("color","green");
						standardsum = 0;
						comparesum = 0;
						trTags.push(trTag);
					}
				
					trTag = $("<tr>").append(
						$("<td>").html("<span class='tab'>&#9;</span>"+list.account_name)
						,$("<td>").text(numberWithCommas(list.standard))
						,$("<td>")
						,$("<td>").text(numberWithCommas(list.compare))
						,$("<td>")
					)
					trTags.push(trTag);
						standardsum += list.standard;
						comparesum += list.compare;
						standardsumsum += list.standard;
						comparesumsum += list.compare;
						standardtotal += list.standard;
						comparetotal += list.compare;
						
						if(idx==result.length-1){
							$(standardTd).text(numberWithCommas(standardsum));
							$(compareTd).text(numberWithCommas(comparesum));
							trTag = $("<tr>").append(
								$("<td>").text(division + " 총계")
								,$("<td>")
								,$("<td>").text(numberWithCommas(standardsumsum))
								,$("<td>")
								,$("<td>").text(numberWithCommas(comparesumsum))
							).css("background-color","lightgray");
							trTags.push(trTag);
							trTag = $("<tr>").append(
									$("<td>").text("자산+부채+자본 총계")
									,$("<td>")
									,$("<td>").text(numberWithCommas(standardtotal))
									,$("<td>")
									,$("<td>").text(numberWithCommas(comparetotal))
							).css("background-color","lightgray");
							trTags.push(trTag);
						}
						console.log(standard_name)
			})
			console.log(trTags);
			$("#listBody").html(trTags);
		},
		error : function(errorResp) {
			console.log(errorResp.status + ":" + errorResp.responseText);
		}
	});
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
}
page();
</script>
