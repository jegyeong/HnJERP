/**
 * <pre>
 * 견적서 목록 조회 후, 클릭한 값을 input태그에 입력되게 함
 * </pre>
 * @author 이제경
 * @since 2020. 8. 14
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	수정일         수정자       	수정내용
 * --------     --------    ----------------------
 * 2020. 8. 14     이제경       	최초작성
 * Copyright (c) 2020 by DDIT All right reserved
 * </pre>
 */ 

//$.modalView = function(objParam){
function modalView(objParam){
	const noText = $(objParam.noText);		//사원 클릭 시, 입력될 태그 지정
	const nameText = $(objParam.nameText);	//사원 클릭 시, 입력될 태그 지정
	const clickBtn = $(objParam.clickBtn);				//모달창을 띄울 버튼 지정
	const urlPath = objParam.urlPath;				//"${cPath}/buy/document/empModal"/
	const title = objParam.title;					//모달 제목
	const buyerNoText = $(objParam.buyerNoText);
	const buyerNameText = $(objParam.buyerNameText);
	const empNoText = $(objParam.empNoText);
	const empNameText = $(objParam.empNameText);
	const orderTableText = $(objParam.orderTableText);
	const tranTableText = $(objParam.tranTableText);
	const listBodyText = orderTableText.find("#listBody");
	const listBodyText2 = tranTableText.find("#listBody");
	const tranDateText = $(objParam.tranDateText);
	const ship_p_dateText = $(objParam.ship_p_dateText);
	//prod 어케 넣어야하지
	
	
	var typeTable;
	if(urlPath.search("est")>0){
		typeTable="#estTable";
	}else if(urlPath.search("buyer")>0){
		typeTable='#buyerTable';
	}else{
		typeTable="#tranTable";
	}
	
	//견적서 모달창
	function loadModalView(){
		$("#exampleModalLabel").text(title);
		$.ajax({
			url : urlPath,
			dataType : "html",
			success : function(resp) {
				exampleModal.find(".modal-body").html(resp);
				exampleModal.modal("show");
			},
			error : function(errorResp) {
				console.log(errorResp.status + ":" + errorResp.responseText);
			}
		});
		$(document).on("click", typeTable+" tr", function(){
			let no;
			let name;
			if(urlPath.search("est")>0){
				console.log($(this).find(".buyer_no").val());
				no = $(this).find(".est_no").text();
				buyerNo = $(this).find(".buyer_no").val();
				buyerNo2 = $(this).find(".buyer_no").text();
				buyerName = $(this).find(".buyer_name").text();
				empNo = $(this).find(".emp_no").val();
				empName = $(this).find(".emp_name").text();
				orderTable = $(this).find(".prodDiv").children().html();
			}else{
				no = $(this).find(".ship_no").text();
				buyerNo = $(this).find(".buyer_no").val();
				buyerNo2 = $(this).find(".buyer_no").text();
				buyerName = $(this).find(".buyer_name").text();
				empNo = $(this).find(".emp_no").val();
				empName = $(this).find(".emp_name").text();
				tranTable = $(this).find(".prodDiv").children().html();
			}
			exampleModal.modal("hide");
			
			noText.val(no);
			buyerNoText.val(buyerNo);
			buyerNameText.val(buyerName);
			empNoText.val(empNo);
			empNameText.val(empName);
			if(urlPath.search("est")>0){
				listBodyText.append(orderTable);
			}else if(urlPath.search("buyer")>0){
				noText.val(buyerNo2);
				nameText.val(buyerName);
			}else{
				listBodyText2.append(tranTable);
			}
			
		}).css({ cursor:"pointer" });
	}
	clickBtn.on("click", function(){
		loadModalView();
	});
	
}



