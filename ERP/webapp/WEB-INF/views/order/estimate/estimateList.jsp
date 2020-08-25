<%--
* [[개정이력(Modification Information)]]
* 	수정일                 수정자      	수정내용
* ----------  ---------  -----------------
* 2020. 7. 2      이제경       		최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<h1 style="padding-left: 30px;padding-top: 25px;">견적서조회</h1>

<div class="col-xs-12" style="padding-left: 30px; padding-top: 10px;">
	<div class="box">
		<div class="box-header">
<!-- 			<h3 class="box-title">견적서조회</h3> -->
			<table>
				<tbody>
					<tr>
					<td>
						<div class="#" id="searchUI">
						<!-- 탭 -->
						<ul class="nav nav-pills nav-tabs" style="margin-top: 10px; margin-bottom: 20px;">
						  <li class="nav-item" id="status_all">
						    <a class="nav-link active" data-toggle="tab" href="#">전체</a>
						  </li>
						  <li class="nav-item" id="status_ing">
						    <a class="nav-link" data-toggle="tab" href="#">진행중</a>
						  </li>
						  <li class="nav-item" id="status_ok">
						    <a class="nav-link" data-toggle="tab" href="#">완료</a>
						  </li>
						  <li class="nav-item" id="status_del">
						    <a class="nav-link" data-toggle="tab" href="#">취소</a>
						  </li>
						</ul>
						<spring:message code="date" />
						<input type="date" name="startDay"/>&nbsp;~&nbsp;<input type="date" name="endDay"/>				
						<spring:message code="buyer.buyer_name" />
						<input type="text" name="buyer_name">
						<spring:message code="emp.emp_name" />
						<input type="text" name="emp_name">
						</div>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<div style="margin-top: 10px;">
<!-- 									<select name="searchType"> -->
<!-- 										<option value="" -->
<%-- 											${empty pagingVO.searchVO.searchType? "selected":"" }> --%>
<!-- 											모두</option> -->
<!-- 									</select>  -->

									<input type="button" value="검색" id="searchBtn"  class="btn btn-outline-primary"> 
									<input type="button" value="새글등록"  class="btn btn-outline-success"
										onclick="location.href='<c:url value="/order/estimate/form" />';">
								</div>
<%-- 								<nav id="pagingArea">${pagingVO.pagingHTML }</nav> --%>
						</td>
					</tr>
				</tfoot>

			</table>
		</div>
	</div>
	
	<!-- /.box-header -->
	<div style="background-color: white; margin: 30px; margin-right: 55px;">
	<div id="tableDiv" class="table table-bordered table-hover dataTable" style="height:600px;overflow-y: scroll;">
<!-- 		<div class="box-header"> -->
<!-- 			<br> -->
<!--               <h3 class="box-title">견적서</h3> -->
<!--             <br> -->
<!--             </div> -->
		<table class="table table-hover" id="estimateTable">
			
			<thead>
                <tr role="row">
                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="checkBox" aria-sort="checkBox">#</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="est_date"><spring:message code="board.bo_date" /></th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="est_no"><spring:message code="estimate.est_no" /></th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="buyer_name"><spring:message code="buyer.buyer_name" /></th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="est_price"><spring:message code="estimate.est_price" /></th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="2" aria-label="est_status"><spring:message code="status" /></th>
                </tr>
                
<!-- 				<tr> -->
<!-- 					<th>#</th> -->
<%-- 					<th><spring:message code="board.bo_date" /></th> --%>
<%-- 					<th><spring:message code="estimate.est_no" /></th> --%>
<%-- 					<th><spring:message code="buyer.buyer_name" /></th> --%>
<%-- 					<th><spring:message code="estimate.est_price" /></th> --%>
<%-- 					<th><spring:message code="status" /></th> --%>
<!-- 				</tr> -->
			</thead>
			<tbody id="listBody">

			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						<input type="button" id="delBtn" class="btn btn-outline-danger" value="삭제">
					</td>
				</tr>
			</tfoot>

		</table>
	</div>
	</div>
	<div style="margin-bottom: 10px;">
		<input type="button" id="print" class="btn btn-outline-dark" value="인쇄">
		<input type="button" id="exportBtn" class="btn btn-outline-dark" value="엑셀저장">
<!-- 		<input type="button" id="delBtn" class="btn btn-dark" value="삭제"> -->
	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">견적서상세보기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
			 <button type="button" id="updateBtn" class="btn btn-primary mr-2">수정</button>
			 <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<%-- <form:form id="searchForm" action="${pageContext.request.contextPath }/order/estimate" type="post"> --%>
<form:form id="searchForm" action="${pageContext.request.contextPath }/order/estimate" method="get">
	<input type="hidden" name="page" value="${param.page }">
	<input type="hidden" name="startDay" value="" />
	<input type="hidden" name="endDay" value="" />
	<input type="hidden" name="buyer_name" value="" />
	<input type="hidden" name="emp_name" value="" />
	<input type="hidden" name="status" id="status" value="" />
<!-- 	<input type="hidden" name="searchType" value="" /> -->
<!-- 	<input type="hidden" name="searchWord" value="" /> -->
</form:form>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
<script type="text/javascript">
	var listBody = $("#listBody");
	var searchForm = $("#searchForm").paging(
			{
				searchUI : "#searchUI",
				searchBtn : "#searchBtn",
				pagination : "#pagingArea",
				pageParam : "page",
				byAjax : true,
				success : function(resp) {
					console.log(resp);
					let estimateList = resp.dataList;
					let pagingHTML = resp.pagingHTML;
					console.log(estimateList);
					let trTags = [];
					if (estimateList.length > 0) {
						$.each(estimateList, function(idx, estimate) {
							let trTag = $("<tr>").append(
// 									$("<td>").html(estimate.rnum),
									$("<td>").html($("<input>").attr({type:"checkbox", name:"inputChk"}).addClass("chk")).addClass("chk"),
									$("<td>").html(estimate.est_date),
									$("<td>").html(estimate.est_no).attr({name:"est_no", class:"est_no", value:estimate.est_no}),
									$("<td>").html(estimate.buyer_name),
									$("<td>").html(estimate.estimateList.est_price),
									$("<td>").html(
											$("<select>").append(
												$("<option>").val("OR01").text("진행중"),
												$("<option>").val("OR02").text("완료"),
												$("<option>").val("OR99").text("취소")
											).addClass("select").val(estimate.est_prog)
									).addClass("select").data("est_no", estimate.est_no),
									$("<td>").html($("<input>").attr({type:"button", name:"selectBtn", value:"진행상태변경"}).addClass("btn btn-outline-danger")).addClass("selectBtn")
							).data("est_no", estimate.est_no);
							trTags.push(trTag);
						});
					} else {
						trTags.push($("<tr>").html(
								$("<td colspan='8'>").text("조건에 맞는 게시글이 없음")));
					}
					listBody.html(trTags);
					listBody.data("currentPage", resp.currentPage);
					$("#pagingArea").html(pagingHTML);
					searchForm.find("[name='page']").val("");
					//엑셀저장------------------------------------------------------------
					estimateTable = $("#estimateTable").tableExport({
						   headers: true,        // (Bool), 테이블의 <thead> 태그 안에 <th> 나 <td> 가 있으면 표시함 (기본: true)
					       footers: true,       // (Bool), 테이블의 <tfoot> 태그 안에 <th> 나 <td> 가 있으면 표시함, (기본: false)
					       formats: ["xlsx"],    // (String[]), 저장할 파일 포맷 반드시 배열 타입이어야 함, 아니면 에러 발생. (기본: ['xlsx', 'csv', 'txt'])
//					 	        filename: "exceldata",// 다운로드 파일명(확장자 제외하고 이름만). (기본: 'id')
					       bootstrap: true,     // (Bool), 부트스트랩 사용시 true, 사용시 부트스트랩 버튼 스타일 유지해줌. (기본: true)
					       exportButtons: false,  // (Bool), 선택한 확장자 포맷들로 자동으로 내장 버튼을 출력해줌. (기본: true)
					       position: "top",      // (top, bottom), 캡션 표시 위치(버튼이 출력되는 위치로 테이블 상단(top), 하단(bottom)을 선택. (기본: 'bottom')
					       ignoreRows: null,     // (Number, Number[]), 엑셀 파일 저장시 제외할 테이블 행을 숫자, 또는 숫자 배열로 지정. (기본: null)
					       ignoreCols: null,     // (Number, Number[]), 엑셀 파일 저장시 제외할 테이블 열을 숫자, 또는 숫자 배열로 지정. (기본: null)
					       trimWhitespace: true, // (Boolean), 테이블 안의 텍스트 앞뒤에 붙은 줄바꿈, 공백, 탭을 모두 제거해줌. true 권장. (기본: false)
					       RTL: false,           // (Boolean), 엑셀 워크시트를 오른쪽에서 왼쪽으로 출력함. 아랍어 전용으로 false 고정. ( (기본: false)
					       sheetname: "Sheet1"   // (id, String), 시트이름 (기본: 'id')
					});
				}

			}).submit();

	
	// 모달창 띄우기
	var sampleModal = $("#exampleModal").modal({
		show:false
	}).on("hidden.bs.modal",function(){
		sampleModal.find(".modal-body").empty();
		sampleModal.data("est_no","");
	});
	   
	       
	function loadEstView(est_no) {
		$.ajax({
			url : "<c:url value='/order/estimate/'/>" + est_no,
			dataType : "html",
			// Accept : 
			// html > text/html, Content-Type:text/html
			// json >  application/json 
			success : function(resp) {
				sampleModal.find(".modal-body").html(resp);
				sampleModal.data("est_no", est_no);
				sampleModal.modal("show");
			},
			error : function(errorResp) {
				console.log(errorResp.status + ":" + errorResp.responseText);
			}
		});
	}

	//tr태그 클릭------------------------------------------------------------
	var est_num;
	var listView = $("#listBody").on("click", "tr", function(e){
// 		console.log(e.target);
		if($(e.target).attr("class")=='select') return;
		if($(e.target).attr("class")=='chk') return;
		if($(e.target).attr("class")=='selectBtn') return;
		if($(e.target).attr("class")=='btn btn-outline-danger') return;
		est_num = $(this).data("est_no");
		loadEstView(est_num);
		console.log(est_num);
	}).css({cursor:"pointer"});
	

	//tr엑셀파일로 저장하기------------------------------------------------------------
	let estimateTable = null;
   $("#exportBtn").on("click", function(){
		let name = prompt("file name");
		let exportData = estimateTable.getExportData()['estimateTable']['xlsx'];
		console.log(exportData.filename);
	    //                   // data          // mime              // name              // extension
	    estimateTable.export2file(exportData.data, exportData.mimeType, name, exportData.fileExtension);
   });

	//수정버튼------------------------------------------------------------
   	
	$("#updateBtn").on("click", function(){
// 		let est_no = sampleModal.find("td").eq(4).text();
		let est_no = sampleModal.find("tr").eq(1).find("td").text();
// 		alert(est_no)
		console.log(est_no);
		location.href= "${pageContext.request.contextPath }/order/estimate/"+est_no+"/form";
		
	});
	
	//진행상태변경------------------------------------------------------------
	
	var selectBtn = $("#listBody").on("click", "input[type=button]", function(){
		let est_prog = $(this).parent().prev().find("select").val();
		console.log(est_prog);
		let est_no = $(this).parent().parent().find("td").eq(2).text();
		loadSelect(est_no, est_prog);
	});
	
	function loadSelect(est_no, est_prog) {
		$.ajax({
			url : "<c:url value='/order/prog/estimate'/>",
			dataType : "html",
			data : {
				est_no : est_no,
				est_prog : est_prog},
			success : function(resp) {
				alert("진행상태가 변경되었습니다.");
			},
			error : function(errorResp) {
				console.log(errorResp.status + ":" + errorResp.responseText);
			}
		});
	}
	
//탭관련------------------------------------------------------------
	//전체
	$("#status_all").on("click", function(){
		$("#status").val("");
		searchBtn.click();
	});
	
	//진행중
	$("#status_ing").on("click", function(){
		$("#status").val("OR01");
		searchBtn.click();
	});
	
	//완료
	$("#status_ok").on("click", function(){
		$("#status").val("OR02");
		searchBtn.click();
	});
	
	//취소
	$("#status_del").on("click", function(){
		$("#status").val("OR99");
		searchBtn.click();
	});
	
//삭제버튼클릭------------------------------------------------------------
	var delBtn = $("#delBtn").on("click", function(){
		var est_noList = [];
	
// 		let est_no = $("#listBody").find("tr").eq(0).find("td").eq(2);
// 		alert(est_no);
		
		//선택된값 가져오기
// 		var chkbox = $("input[name=inputChk]:checked").parent().parent().find("#est_no").val();
// 		var chkbox = $("input[name=inputChk]:checked").parent().parent().find("td[name=est_no]").text();
// 		console.log(chkbox);
		
		var chkbox='';
			chkbox = $("input[name=inputChk]:checked").parent().parent().find("td[name=est_no]");
		
		//값을 리스트에 담아주기
		$.each(chkbox,function(idx,item){
			est_noList.push($(item).text()); //
			console.log(est_noList);
			deleteEstimate(est_noList);
		});
		
	});
	
	
	
	function deleteEstimate(est_noList){
		jsonData = {est_noList : est_noList};
		$.ajax({
			url : "${cPath}/order/estimate/delete",
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			type : "POST",
			data :JSON.stringify(jsonData),
			success : function(resp) {
				alert(resp);
				searchBtn.click();
			},
			error : function(errorResp) {
				console.log(errorResp.status + ":" + errorResp.responseText);
			}
		}); 
	}

//인쇄버튼클릭------------------------------------------------------------
$("#print").on("click", function(){
	var no = [];
	let chk = true;
	$.each($("input[name='inputChk']"),function(idx, input){
		alert(input);
		if($(input).is(":checked")) {
			var tr = $(this).closest('tr');
			no.push(tr.find(".est_no").text());
// 			alert(no);
			chk = false;
		}
	});
	if(chk){
		alert("인쇄할 전표를 선택하지 않았습니다.")
		return;
	}
// 	alert(no);
	printset(no);

});

var print= function(){
	$("#printhtml").empty()
};
var printset = function(no){
	console.log(new Date());
			$.ajax({
				url : "${cPath}/order/estimate/print/all"
				,method:"post"
				,dataType : "html" // Accept:application/json, Content-Type:application/json
				,contentType:"application/json"
// 				,data : {list:no}
				,data : JSON.stringify({list:no})
				,success : function(resp) {
					const setting = "width=890, height=841";
					const objWin = window.open('', 'print', setting);
					objWin.document.open();
				 	objWin.document.write(resp);
				 	objWin.document.write('<div class="page_break"></div>');
					objWin.focus(); 
//				 	ojWin.document.close();
					setTimeout(function(){objWin.print();objWin.close();},100);
				}
				,error : function(errorResp) {
					console
							.log(errorResp.status + ":"
									+ errorResp.responseText);
				}
			});
	};


var exampleModal = $("#exampleModal").modal({
	show:false
}).on("hidden.bs.modal", function(){
	exampleModal.find(".modal-body").empty();
});


	
</script>

