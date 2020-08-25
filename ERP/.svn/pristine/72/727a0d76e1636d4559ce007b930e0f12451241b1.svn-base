<%--
* [[개정이력(Modification Information)]]
* 	수정일                 수정자      	수정내용
* ----------  ---------  -----------------
* 2020. 7. 3      	이제경       	최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<h1 style="padding-left: 30px;padding-top: 25px;">견적서폼</h1>

<style>
table {
	border-collapse: collapse;
}

th, td {
	border: 1px solid gray;
}
</style>

<form:form id="estimateForm" modelAttribute="estimate" method="post" enctype="multipart/form-data" class="#"
	action="${cPath }/order/estimate/${estimate.est_no }">
	

	
	<c:if test="${not empty estimate.est_no }" >
		<input type="hidden" name="_method" value="${'delete' eq methodType ?'delete':'put' }">
	</c:if>
	
	<input class="form-control" type="hidden" name="currentPage" value="${param.currentPage }"/>
	
<div style="background-color: white; margin: 30px; margin-right: 55px; width: 493px;">
	<table class="table table-bordered">
		<tr>
			<th><spring:message code="date" /></th>
			<td><input type="date" name="est_date" value="${estimate.est_date }"></td>
		</tr>
		<tr>
			<th><spring:message code="estimate.est_no" /></th>
			<td><input type="text" name="est_no" value="${estimate.est_no }" placeholder="자동생성" readonly="readonly"></td>
		</tr>
		<tr>
			<th><spring:message code="buyer.buyer_name" />
				<input type="button" id="buyerBtn" value="찾기" class="btn btn-outline-primary" />
			</th>
			<td><input type="text" name="buyer_no" id="buyer_no" value="${estimate.buyer_no }" placeholder="거래처코드" />
				<input type="text" id="buyer_name" value="${estimate.buyer_name }" placeholder="거래처명" /></td>
		</tr>
		<tr>
			<th><spring:message code="emp.emp_name" />
				<input type="button" id="empBtn" value="찾기" class="btn btn-outline-primary"/>
				
			</th>
			<td><input type="text" name="emp_no" id="empNo" value="${estimate.emp_no }" placeholder="담당자코드" />
				<input type="text" id="empName" value="${estimate.emp_no }" placeholder="담당자명" /></td>
		</tr>
	</table>
</div>
<div style="background-color: white; margin: 30px; margin-right: 55px;">
	<table class="table table-bordered">
		<thead>
			<tr>
				<td id="hid">
					<select class="dynamicElement" id="selectLprod_no" style="margin: 5px;"
						data-url="<c:url value='/order/estimate/prod/lprod'/>">
						<option value="">상품분류</option>
					</select> 
					<select class="dynamicElement" id="selectProd_no" style="margin: 5px;"
						data-url="<c:url value='/order/estimate/prod/prod'/>">
						<option value="">상품명</option>
					</select>
					<input type="button" value="품목추가" style="margin: 5px;"
						   class="btn btn-outline-success" onclick="addProd()">
				</td>	
<!-- 				<td id="addProd"> -->
<!-- 					 <input type="button" value="품목추가" class="btn btn-outline-dark" onclick="addProd()"> -->
<!-- 				</td> -->
			</tr>
		</thead>			
		<tbody>
			<tr>
				<td>
					<table id="estimateTable">
						<thead>
							<tr>
								<th>#</th>
								<th><spring:message code="prod_code" /></th>
								<th><spring:message code="prod_name" /></th>
								<th><spring:message code="prod_standard" />단위</th>
								<th><spring:message code="prod_qty" /></th>
								<th><spring:message code="prod_price" /></th>
<%-- 								<th><spring:message code="prod_validity" /></th> --%>
								<th><spring:message code="prod_totalprice" /></th>
<!-- 								<th>비고</th> -->
							</tr>
						</thead>
						<tbody id="listBody">
						<c:choose>
							<c:when test="${not empty estimate }">
<%-- 								<c:forEach items="${estimate }" var="estimate"> --%>
									<c:if test="${estimate.estimateList!=null }">
									<c:forEach items="${estimate.estimateList }" var="list">
										<c:if test="${list.prodList!=null }">
										<c:forEach items="${list.prodList }" var="pList">
											<tr>
												<td><input type="checkbox" name="inputChk"></td>
												<td><input type="text" value="${pList.prod_no }" name="prod_no" class="prodNo" readonly="readonly"></td>
												<td class="prodName">${pList.prod_name }</td>
												<td>${pList.prod_standard }${pList.prod_stand_size}</td>
												<td><input type="text" value="${list.est_qty }" name="est_qty" class="estQty"></td>
												<td class="prodOutPrice">${pList.prod_out_price }</td>
<%-- 												<td><input type="text" value="${pList.prod_validity }" name="prod_validity"></td> --%>
												<td><input type="text" value="${list.est_price }" name="est_price" class="estPrice" readonly="readonly"></td>
<!-- 												<td><input type="text"  -->
<%-- 														value='<c:if test="${not empty est_no }"></c:if>${pList.prod_validity }'  --%>
<!-- 														name="est_price" class="estPrice"> -->
<!-- 												</td> -->
											</tr>								
										</c:forEach>
										</c:if>
									</c:forEach>
									</c:if>
<%-- 								</c:forEach> --%>
							</c:when>
						</c:choose>
<!-- 						<tr> -->
<!-- 							<td>견적서총금액</td> -->
<!-- 							<td colspan="7"> -->
<!-- 							<span id="est_totalPrice"></span> -->
<!-- 							</td> -->
<!-- 						</tr> -->
					</tbody>
				</table>
				견적서 총금액 : <span id="est_totalPrice"></span>
			</td>
		</tr>
	</tbody>
	<tfoot>
			<tr>
				<td id="deleteProd">
					<input type="button" id="deleteProdBtn" class="btn btn-outline-danger" value="품목삭제" onclick="delProd()">
				</td>
<!-- 				<td colspan="1"> -->
<!-- 					<input type="submit" value="저장">  -->
<!-- 					<input type="reset" value="초기화">  -->
<%-- 					<input type="button" value="목록으로" onclick="location.href='<c:url value="/order/estimate"/>'" /> --%>
<!-- 				</td> -->
			</tr>
		</tfoot>
	</table>
</div>
<div id="button" style="margin: 30px; margin-right: 55px;">
	<input type="submit" class="btn btn-success" value="저장"> 
	<input type="reset" class="btn btn-dark" value="초기화"> 
	<input type="button" class="btn btn-dark" value="목록으로" onclick="location.href='<c:url value="/order/estimate"/>'" />
</div>
</form:form>


<!-- 거래처 모달창 -->
<div class="modal fade" id="exampleModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      </div>
      <div class="modal-footer">
<!--       	<button type="button" id="matAddBtn" class="btn btn-primary mr-2" data-dismiss="modal">추가</button> -->
<!--         <button type="button" id="print2" class="btn btn-secondary" data-dismiss="modal">인쇄</button> -->
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript" src="${cPath}/resources/js/modalView.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath }/resources/js/dynamicSelect.js?time=${System.currentTimeMillis()}"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/paging.js?time=${System.currentTimeMillis()}"></script>
<script type="text/javascript">

//품목 삭제
//---------------------------------------------------------------------------------
	
	function delProd(){
		var listBody = document.getElementById('listBody');
		var lastRow = listBody.rows.length;
		var confirm_val = confirm("선택한 상품을 삭제하시겠습니까?");
		if(confirm_val){
			for(var i=lastRow; i>=1; i--){
				if($("#listBody").find("input:checkbox").eq(i-1).is(":checked")){
				alert("선택");
					listBody.deleteRow(i-1);
// 					index--;
				}
			}
		}

	}
	

//거래처 모달창
//---------------------------------------------------------------------------------
// 	function loadBuyerView(){
// // 		$("#matAddBtn").hide();
// // 		$("#exampleModal").text("사원목록");
// 		$.ajax({
// 			url : "${cPath}/order/modal/estimate/buyer",
// 			dataType : "html",
// 			success : function(resp) {
// 				exampleModal.find(".modal-body").html(resp);
// 				exampleModal.modal("show");
// 			},
// 			error : function(errorResp) {
// 				console.log(errorResp.status + ":" + errorResp.responseText);
// 			}
// 		});
// 		$(document).on("click", "#buyerTable tr", function(){
// 			let buyer_no = $(this).find(".buyer_no").text();
// 			let buyer_name = $(this).find(".buyer_name").text();
// 			exampleModal.modal("hide");
			
// 			$("#buyer_no").val(buyer_no);
// 			$("#buyer_name").val(buyer_name);
// 		}).css({ cursor:"pointer" });
// 	}
// 	$("#buyerBtn").on("click", function(){
// // 		exampleModal.modal("show");
// 		loadBuyerView();
// 	});
	


//담당자 모달창
//---------------------------------------------------------------------------------
// 	function loadEmpView(){
// 		$("#matAddBtn").hide();
// // 		$("#exampleModal").text("사원목록");
// 		$.ajax({
// 			url : "${cPath}/buy/document/empModal",
// 			dataType : "html",
// 			success : function(resp) {
// 				exampleModal.find(".modal-body").html(resp);
// 				exampleModal.modal("show");
// 			},
// 			error : function(errorResp) {
// 				console.log(errorResp.status + ":" + errorResp.responseText);
// 			}
// 		});
// 		$(document).on("click", "#empTable tr", function(){
// 			let emp_no = $(this).find(".emp_no").text();
// 			let emp_name = $(this).find(".emp_name").text();
// 			exampleModal.modal("hide");
			
// 			$("#empNo").val(emp_no);
// 			$("#empName").val(emp_name);
// 		}).css({ cursor:"pointer" });
// 	}
// 	$("#empBtn").on("click", function(){
// // 		exampleModal.modal("show");
// 		loadEmpView();
// 	});

   var exampleModal = $("#exampleModal").modal({
		show:false
	}).on("hidden.bs.modal", function(){
		exampleModal.find(".modal-body").empty();
	});
   //사원 목록 모달창
   modalView({
	  noText : "#empNo",      //사원 클릭 시, 입력될 태그 지정
	  nameText : "#empName",  //사원 클릭 시, 입력될 태그 지정
	  clickBtn : "#empBtn",        //모달창을 띄울 버튼 지정
      urlPath : "${cPath}/buy/document/empModal",
      title:"사원 목록"				//제목
   });
   //거래처 목록 모달창
   modalView({
	  noText : "#buyer_no",      //사원 클릭 시, 입력될 태그 지정
	  nameText : "#buyer_name",  //사원 클릭 시, 입력될 태그 지정
	  clickBtn : "#buyerBtn",         //모달창을 띄울 버튼 지정
      urlPath : "${cPath}/buy/document/buyerModal",
      title:"거래처 목록"				//제목
   });

	
//상품추가
//---------------------------------------------------------------------------------
	var index=0;
	function addProd(){
		var prodNo =  $("#selectProd_no").val();
// 		console.log(prodNo);
		
		var flag = true;
		
		if(prodNo == ''){
			alert("상품을 선택해주세요");
			return;
		}
		
		$(document).find(".prodNo").each(function(idx, item){
			if($(this).val() == prodNo){
				alert("중복된 상품이 존재합니다.");
				flag = false;
				return;
			}
		});
		
		if(flag){
				$.ajax({
					type:"get",
					url:"${cPath}/order/estimate/prod/"+prod_no
				}).done(function(resp){
						let prod = resp;
						var trTags = [];
								trTag = $("<tr>").append(
										$("<td>").html($("<input>").attr({type:"checkbox", name:"inputChk"})),
										$("<td>").html($("<input>").addClass("prodNo").attr({type:"text", name:"prod_no", readonly:"readonly"}).val(prod.prod_no)),
										$("<td>").text(prod.prod_name),
										$("<td>").text(prod.prod_standard).attr("name", "prod_standard"),
										$("<td>").html($("<input>").addClass("estQty").attr("type",'text').attr("name","est_qty")),
										$("<td>").addClass("prodOutPrice").text(prod.prod_out_price),
// /										$("<td>").text(prod.prod_totalPrice),
// 										$("<td>").text(prod.prod_validity),
										$("<td>").html($("<input readonly/>").addClass("estPrice").attr({type:"text", name:"est_price"}))
										.data("prod_no", prod.prod_no));	
// 							totalPrice(trTag, index);
								index++;
								console.log(trTag);
							$("#listBody").append(trTag);
// 							alert(index);
// 							alert(result);
// 							$(select).prop("select[name=prod_no]",0);
// 							$(select).prop("select[name=lprod_no]",0);



				});
		}
	}
	
// 	var totalPrice(){
// 		result = est_qty * prod_price;
// 		alert(result);
// 	}
	
// 	var result="";
// 	function totalPrice(trTag, index){
// 		let qty = trTag.find("input").eq(2).on("change", function(){
// 			var num1 = trTag.find("td").eq(5).text();  //가격
// 			var num2 = qty.val();						//수량
// 			result = num1*num2;
// // 			alert(result);
// 			trTag.find($("input")).eq(3).val(result);
			
// 		});
// 	}

		


//품목 셀렉트박스
//---------------------------------------------------------------------------------
	
	var optionPtrn = "<option value='%V' %S>%T</option>";
	var lpord_noTag = $("#selectLprod_no").data("success", function(resp) {
		var html = "";
		$.each(resp, function(idx, estimate) {
			html += optionPtrn.replace("%V", estimate.lprod_no)
								.replace("%T", estimate.lprod_name);
		});
			lpord_noTag.append(html);
			
	}).on("change", function() {
	
		let lprod_no = $(this).val();

		prod_noTag.trigger("renew", {
			lprod_no : lprod_no
		});

	});
	
 	var prod_no="";
	var prod_noTag = $("#selectProd_no").data("success", function(resp) {
		var html = "<option value>상품명</option>";
		$.each(resp, function(idx, estimate) {
			html += optionPtrn.replace("%V", estimate.prod_no)
							.replace("%T", estimate.prod_name)
							.replace("%S", estimate.prod_no == "{estimate.prod_no}"?"selected":"");
		});
		prod_noTag.html(html);
		
	}).on("change", function(){
		prod_no = $(this).val();
		
		console.log(prod_no)
		
	});		
		var listBody = $("#listBody");
		
			var data1 = null;
			var data2 = $("#selectProd_no").clone();
// 			listBody.html(trTag);

	$(".dynamicElement").dynamicSelect();

//유효성검사-----------------------------------------------------
	
	//꼭 필요한것 EMP_NO, EST_PRICE, BUYER_NO,
	// 		  PROD_NO, EST_QTY 
	//id 주고 유효성 검사하기(n)
	$("#estimateForm").on("submit", function(){
// 		alert("검사");
// 		console.log(event);
// 		e.preventDefault();

 		//거래처 검사
		var buyer_no = $("#buyer_no").val();
 		if(buyer_no == ""){
 			alert("거래처를 검색해 주세요");
//  			buyer_no.focus();
 			return false;
 		}
		
 		
		//사원검사
		var emp_no = $("#empNo").val();
 		if(emp_no==""){
 			alert("사원을 검색해 주세요");
//  			emp_no.focus();
 			return false;
 		}
 		
	
 		var prodNoExist = $("#listBody").find("input[class=prodNo]").val();
//  		var prodNoExist = $("#listBody").childrens("tr").find("input[class=prodNo]");
//  		alert(prodNoExist);
 		if(prodNoExist == null){
// 	 		alert("상품검사");
 			alert("상품을 입력해주세요");
 			return false;
 		}
 		
		
 		//수량검사
		//리턴 값을 넣을 val 변수
 		var val = true;
 		$.each($(".estQty"),function(index, est_qty){
//  			alert("이치문")
 			if($(est_qty).val() == ''){
//  				alert("이치문 안에 이프문");
//  				alert(val);
 				alert((index+1)+"번째 상품 수량을 입력해주세요");
 				val = false;
 				return false;
 			}
 		});
 		if(!val) return false;
 		
 		
 		
 		
 		
	});
 		
	
//수량수정시값다시계산-----------------------------------------------------
//+견적금액 전체
	
	$("#listBody").on("change keyup paste",".estQty", function(){
// 		let price = $(this).parent().next().children().eq(0).text();
		let price = $(this).parent().next().eq(0).text();
// 		alert(price);
		let qty = $(this).val();
// 		console.log(price + " =" + qty);
			$(this).parent().parent().find($(".estPrice")).val(price*qty);
			//총금액 검사
// 	 		var val = true;
	 		var est_totalPrice = 0;
	 		$.each($(".estPrice"), function(index, est_price){
	 			var est_price = $(est_price).val() * 1;
	 				est_totalPrice += est_price;
	 		});
	 		//전체견적서 값 넣어주기
	 		
	 		$("#est_totalPrice").text(est_totalPrice);
	});
	
	
	$("input[name='est_qty']").change();
</script>



