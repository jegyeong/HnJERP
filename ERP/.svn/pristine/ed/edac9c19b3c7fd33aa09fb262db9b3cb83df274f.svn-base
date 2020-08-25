<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="${cPath }/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${cPath }/resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.dataTables.min.css    ">
<h2>전표인쇄</h2>
<div class='middleDiv'>
<ul class="nav nav-pills nav-tabs">
	  <li class="nav-item" id="status_all">
	    <a class="nav-link active status" data-toggle="tab" href="#">전체</a>
	  </li>
	  <li class="nav-item" id="status_ing">
	    <a class="nav-link status" data-toggle="tab" href="#">요청</a>
	  </li>
	  <li class="nav-item" id="status_ok">
	    <a class="nav-link status" data-toggle="tab" href="#">승인</a>
	  </li>
</ul>
</div>
<div class='tableStyle'>
<div id="tablediv">
<table class="table table-bordered table-hover text-left" id="data-table"style='width : 100%'>
	<thead class="table-primary">
		<tr class="thead  center">
			<th></th>
			<th>전표코드</th>
			<th>전표일자</th>
			<th>매출/매입</th>
			<th>거래처명</th>
			<th>가액</th>
			<th>전표상태</th>
		</tr>
	</thead>
<!-- 	<tbody id="listBody"> -->

<!-- 	</tbody> -->
</table>
</div>
</div>
<div class='middleDiv'>
<button class="btn btn-success" id="print">인쇄</button> 
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">전표 상세내역</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button id='print2' type="button" class="btn btn-primary">인쇄</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<div id="printhtml"></div>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/paging.js"></script>

<script src="${cPath }/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${cPath }/resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${cPath }/resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${cPath }/resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>

<script src="https://cdn.datatables.net/buttons/1.6.2/js/dataTables.buttons.min.js   "></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.flash.min.js        "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js         "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js    "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js      "></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.html5.min.js        "></script>
<script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.print.min.js        "></script>
<!-- dynamicSelect -->
<script type="text/javascript" src="${cPath }/resources/js/dynamicSelect.js?time=${System.currentTimeMillis()}"></script>
<script type="text/javascript">
var listBody = $("#listBody").clone();

function search(){
	jQuery(function($){
		var table = $("#data-table").DataTable({
	    ajax: {
	    	url: "${cPath }/account/chit", 
   			dataSrc: '' 
	    },
		columns: [
	    	{ data: "check"}, 
			{ className:      'details-control',data: "chit_no" },
			{ className:      'details-control',data: "chit_date" },
			{ className:      'details-control',data: "buy_sell" },
			{ className:      'details-control',data: "buyer_name" },
			{ className:      'details-control',data: "pay" },
			{ className:      'details-control',data: "sign_status" }
		]
// 	    ,stateSave: true
	    ,order: [ [ 2, "desc" ],[1,"desc"] ]
	    ,columnDefs: [
			{ targets: 5 , render: $.fn.dataTable.render.number( ',' , '.' , 0 , '' , '원' ) }]
	    , dom: 'lfrtip',
// 	    dom : '<"top"Blf>rt<"bottom"ip>',
        buttons: [ 
           'excel', 'print'
        ],
        "language": {
            "emptyTable": "데이터가 없습니다.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
        	"search" : "검색 : ",
            "zeroRecords": "일치하는 데이터가 없습니다.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
                "next": "다음",
                "previous": "이전"
            },
        },
        responsive: true
	    });
	    clkfunc();
		clk(table);
		$('.status').on('click', function () {
			let text = this.text=='전체'?'':this.text;
			table.column(6).search(text).draw();
		});
	});

}
search();

clk = function(table){ $('#data-table tbody').on('click', 'td.details-control', function () {
	var tr = $(this).closest('tr');
	console.log(num = $(tr.children()[1]).text());
	$.ajax({
		url : "${cPath}/account/chit/"+num,
		dataType : "html", // Accept:application/json, Content-Type:application/json
		success : function(resp) {
			exampleModal.find(".modal-body").html(resp);
			exampleModal.modal("show");
		},
		error : function(errorResp) {
			console.log(errorResp.status + ":" + errorResp.responseText);
		}
	});
} )};

$("#print").on("click", function(){
	var no = [];
	let chk = true;
	$.each($("input"),function(idx, input){
		if($(input).is(":checked")) {
			var tr = $(this).closest('tr');
			no.push($(tr.children()[1]).text());
			chk = false;
		}
	});
	if(chk){
		alert("인쇄할 전표를 선택하지 않았습니다.")
		return;
	}
	printset(no);
// 	console.log();
// 	setTimeout(function(){objWin.print();objWin.close();}, 3000);
// 	console.log($("#exampleModal").find(".modal-body").html());
// 	print();
});

var print= function(){
	$("#printhtml").empty()
};
var printset = function(no){
	console.log(new Date());
			$.ajax({
				url : "${cPath}/account/chit/print/all"
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

var clkfunc = function(){$("#data-table").on("click", "tr", function(e){
		if($(e.target).hasClass("details-control")) return;
		var check = $(e.target).parent().find("input");
		if($(e.target).val()=='on') return;
		if($(this).attr("class")=="thead") return;
			if(!check.is(":checked")) {
				check.prop("checked",true);
			}
			else check.prop("checked",false);
}).css({cursor:"pointer"})};



var ajaxList = function(table){
	   $.ajax({
                  url: "${cPath }/account/chit" 
                  ,dataType:"json"
                  ,success: function(resp){
               	  let page = $("#data-table_paginate").find(".active").children().text();
                   table.clear();
                   table.rows.add(resp);
                   table.draw();
                   $($("#data-table_paginate").find("a")).each(function(idx, item){
               		if($(item).text() == page) {
               			$(item).click();
               		}
               	});
            }
         });
	}

	function Popup(data)
	{
	var mywindow = window.open('', 'print', 'height=400,width=600');
	mywindow.document.write(data);
	mywindow.document.write("<div class='page_break'></div>");
	mywindow.document.close(); // IE >= 10에 필요
	mywindow.focus(); // necessary for IE >= 10
	setTimeout(function(){mywindow.print();mywindow.close();}, 100);
	return true;
	}
$("#print2").on("click", function(){
	console.log($(".modal-body").html());
	Popup($(".modal-body").html().replace(/(^\s*)|(\s*$)/g, ""));

});
</script>