<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- jQuery -->
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/fontawesome-free/css/all.min.css">
<!-- IonIcons -->
<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap-4.5.0-dist/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 -->
<script src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<h2 style="padding-left: 30px; padding-top: 25px;" >출하지시서</h2>
<!-- : 출하지시서 상세보기: 생산팀에서작성한 출하지시서를 토대로 상품의 갯수가 넉넉하면 바로 출고로 등록하지만 갯수가 넉넉하지 않다면 '생산요청'을 눌러서 '생산요청서'로 이동한다. -->
<div style="background-color: white; margin: 30px; margin-right: 55px;">
	<table class="table">
		<thead id="documentbody">
			<tr>
				<th><spring:message code="delivery.deliv_no"/></th>
				<td>
					${delOrVO.board_no }
					<input type="hidden" name="deliv_no" value="${delOrVO.board_no }">
				</td>
				<th><spring:message code="writedate"/></th>
				<td>${delOrVO.write_date }</td>
			</tr>
			<tr>
				<th><spring:message code="id"/></th>
				<td>${delOrVO.emp_no }</td>
				<th><spring:message code="name"/></th>
				<td>${delOrVO.emp_name }</td>
			</tr>
			<tr>
				<th><spring:message code="delivery.deliv_schd"/></th>
				<td colspan="3">${delOrVO.out_date }</td>
			</tr>
			<tr>
				<th>책임자</th>
				<td>
					<input type="number" name="emp_no" value="${empty delOrVO.out_emp_no ? authUser.emp_no :  delOrVO.out_emp_no }" readonly="readonly">
				</td>
				<th>
					<spring:message code="shipment.endday"/>
				</th>
				<td>
					<input type="date" id="currentDay" readonly="readonly" name="prod_out_date">
				</td>
			</tr>
		</thead>
</table>
</div>

<h3 style="padding-left: 30px; padding-top: 25px;">출하 상품 목록</h3>
<div id="outform" style="background-color: white; margin: 30px; margin-right: 55px;">
	<table class="table" id="prodTable">
		<tr>
			<th>
				<spring:message code="prod.prod_name"/>
			</th>
			<th>
				<spring:message code="prod.prod_no"/>
			</th>
			<th>
				<spring:message code="delivery.orp_qty"/>
			</th>
			<th>
				<spring:message code="stock_size"/>
			</th>
			<th>
				<spring:message code="store.store_no"/>
			</th>
			<th>
				<spring:message code="sector.sector_no"/>
			</th>
			<th>
				창고저장수량 
			</th>
			<th>#</th>
		</tr>
		<c:if test="${not empty delOrVO}">
		<input type="hidden" value="${delOrVO.prod_out_no }" id="out_no"/>
			<c:forEach items="${delOrVO.order }" var="order">
				<c:if test="${not empty order.orderList }">
					<c:forEach items="${order.orderList }" var="orderList">
						<c:if test="${not empty orderList.prodList }">
							<c:forEach items="${orderList.prodList }" var="prodList">
								<tr>
									<td>${prodList.prod_name }</td> 
									<td class="prod_no">${prodList.prod_no }</td>
									<td>
										${orderList.orp_qty }
										<input type="hidden" name="prod_out_qty" value="${orderList.orp_qty }">
									</td>
									<td>${prodList.prod_stock_size }</td>
									<td>
										<select name="prod_store" class="dynamicElement storeSelect" data-source="${prodList.prod_no }" >
											<option value="">창고선택</option>
											<c:forEach items="${storeList }" var="store">
												<c:forEach items="${store}" var="zz">
													<option value="${zz.store_no }">${zz.store_no }</option>
												</c:forEach>
											</c:forEach>
										</select>
									</td>
									<td>
										<select name="prod_sector" class="dynamicElement sectorSelect" data-target="${prodList.prod_no }"
										 data-url="<c:url value='/ware/lprod/outPSectorList'/>">
										</select>
									</td>
									<td>
										<input type="number" class="prod_cnt" id="prod_cnt" readonly="readonly">
									</td>
									<td>
										<input type="hidden" id="orp_qty" value="${orderList.orp_qty }">
										<button type="button" id="orderBtn" class="btn btn-secondary" disabled="disabled" 
										onclick="opener.location.href='${cPath}/ware/outer/prod/pduct/insert/${prodList.prod_no }'">생산요청</button>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
		</c:if>
	</table>
	<input type="button" id="deliveryBtn" value="출고" class="btn btn-success" style="float: right">
</div>

<!-- 진행 완료 상태일때 보여주는 div -->
<main id="resultdiv" style="background-color: white; margin: 30px; margin-right: 55px;">
	<table class="table">
		<tr class="table-info">
			<th>
				<spring:message code="prod.prod_name"/>
			</th>
			<th>
				<spring:message code="prod.prod_no"/>
			</th>
			<th>
				<spring:message code="delivery.orp_qty"/>
			</th>
			<th>
				<spring:message code="stock_size"/>
			</th>
			<th>
				출고 창고
			</th>
			<th>
				출고 창고 구역
			</th>
		</tr>
		<c:if test="${not empty delOrVO}">
<%-- 		<input type="hidden" value="${delOrVO.prod_out_no }" id="out_no"/> --%>
			<c:forEach items="${delOrVO.order }" var="order">
				<c:if test="${not empty order.orderList }">
					<c:forEach items="${order.orderList }" var="orderList">
						<c:if test="${not empty orderList.prodList }">
							<c:forEach items="${orderList.prodList }" var="prodList">
								<tr>
									<td>${prodList.prod_name }</td> 
									<td>${prodList.prod_no }</td>
									<td>${orderList.orp_qty }</td>
									<td>${prodList.prod_stock_size }</td>
									<td>${prodList.store_no }</td>
									<td>${delOrVO.out_prod_sector }</td>
								</tr>
							</c:forEach>
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
		</c:if>
	</table>
		<!-- Footer -->
		<footer class="text-center mt-4">
		 <div class="btn-group btn-group-sm d-print-none"> <a href="javascript:window.print()" class="btn btn-light border text-black-50 shadow-none"><i class="fa fa-print"></i> 프린트</a></div>
		</footer>
	</main>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/dynamicSelect.js?time=${System.currentTimeMillis()}"></script>
<script type="text/javascript">
// 인쇄
	function onPrint() {
	    const html = document.querySelector('html');
	    const printContents = document.querySelector('.table').innerHTML;
	    const printDiv = document.createElement("DIV");
	    printDiv.className = "print-div";
	
	    html.appendChild(printDiv);
	    printDiv.innerHTML = printContents;
	    document.body.style.display = 'none';
	    window.print();
	    document.body.style.display = 'block';
	    printDiv.style.display = 'none';
	}

	console.log($("#storeno").val())

	$("#resultdiv").hide();

	var out_no = $("#out_no").val();
	if(out_no!=""){
		$("#outform").hide();
		$("#resultdiv").show();
	}
	
	//오늘 날짜 뿌려주기 
	$('#currentDay').val(new Date().toISOString().substring(0,10));

	// 상품이 저장된 창고와 창고 구역 불러오기 
	var optionPtrn = "<option value='%V' %S>%T</option>";
	var data_source = "";
	var store_Tag = $(".storeSelect").on("change",function(){
		
		data_source = $(this).attr("data-source");
		let store_no = $(this).val();
		let prod_no = $(this).parent().parent().find(".prod_no").text();
		
		let zz = $("select[data-target='"+data_source+"']");
		
		zz.trigger("renew",{
			store_no : store_no,
			prod_no : prod_no
		});
	
	});
	
	var sector_Tag = $(".sectorSelect").data("success", function(resp){
		var html = "<option value=''>구역선택</option>";
		$.each(resp, function(idx,sector){
			html += optionPtrn
						.replace("%V",sector.sector_no)
						.replace("%T",sector.sector_no)
						.replace("%S","data-cnt='"+sector.prod_cnt+"' class='prod_cnt'");
		});
		let sector_Tag_target = $("select[data-target='"+data_source+"']");
		sector_Tag_target.html(html);
		
	});
	
	$(".sectorSelect").on("change",function(){
		let cnt = $(this).children("option:selected").data("cnt");
		let aa = $(this).parent().parent().find("input[class=prod_cnt]");
		aa.val(cnt);
		
		let orp_qty = $(this).parent().parent().find("#orp_qty").val();
		// 창고에 저장량수량이 부족하면 생산버튼 활성화
		if(cnt < orp_qty){
			$(this).parent().parent().find("#orderBtn").attr("disabled",false);
			$(this).parent().parent().find("#deliveryBtn").attr("disabled",true);
		}
	});
	
	$(".dynamicElement").dynamicSelect();
	
	// 출고버튼 눌렀을 때 
	$("#deliveryBtn").on("click",function(){
		var $table = $("#prodTable");
		var trArr = $table.find("tbody tr");
// 		var subminform = [];
		
		let emp_no = $("#documentbody").find("input[name='emp_no']").val();
		let prod_out_date = $("#documentbody").find("input[name='prod_out_date']").val();		
		
		var deliveOr = new Object(); // 출하지시서 vo
		deliveOr.deliv_no="${delOrVO.board_no}"; // deliv_no : 출하지시서번호
		deliveOr.emp_no=emp_no;
		deliveOr.prod_out_date=prod_out_date; // 출고일자
		deliveOr.or_no="${delOrVO.or_no}"; // 주문서번호
		
		var prodList = new Array(); // prodlist
		
		
		$(trArr).each(function(){
			let prodVO = new Object();
		
			prodVO.prod_no = $(this).find("td").eq(1).text(); //상품 코드
			prodVO.prod_sector= $(this).find(".storeSelect option:selected").val();// 상품창고
			prodVO.sector_no = $(this).find(".sectorSelect").val(); // 상품창고구역
			prodVO.prod_out_qty =$(this).find("#prod_cnt").val(); // 출고수량
			
			prodList.push(prodVO);
		});
		
		prodList.shift();
		deliveOr.prodList=prodList; // 객체에 list 담기 
		
		console.log(JSON.stringify(deliveOr)); // JSON.stringify : json문자열로 변환할 값
		
		$.ajax({
			url : "${cPath}/ware/outer/doc",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(deliveOr),
			method : "post",
			dataType : "text",
			success : function(resp){
				console.log("resp >> "+resp);
				let res = resp;
				if(res="ok"){
					alert("상품 출고완료");
					window.close();
					
					if(!socket){
			            socket = new SockJS( "<c:url value="/socket"/>" );
			         }
			            let socketMsg = "영업부서 출하지시서 " + deliveOr.board_no + " 상품출하 완료 ";
			            console.log("msgmsg : " + socketMsg);
			            socket.send(socketMsg);
			 		
				}else{
					alert("상품출고 실패");
				}
		 		
			},
			error : function(errorResp){
				console.log(errorResp.status + ":"+ errorResp.responseText);
			}
		});
	});
	
	// 생산요청 버튼을 누르면 부모창 전환 및 popup종료
	$("#orderBtn").on("click",function(){
		window.close();
	});
	
</script>