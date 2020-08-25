<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet" href="${cPath }/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${cPath }/resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css">

<h2>원자재 단가 등록</h2>

<div style="margin: 30px 30px 10px 30px; margin-right: 55px;">
	<table id="myTable" class="table table-hover" style="background-color: white;">
		<thead class="table-primary">
			<tr>
				<th scope="col">#</th>
				<th scope="col">원자재코드</th>
				<th scope="col">원자재명</th>
				<th scope="col">분류명</th>
				<th scope="col">규격단위</th>
				<th scope="col">사용여부</th>
				<th scope="col">단가</th>
			</tr>
		</thead>
	</table>
</div>

<!-- DataTables -->
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
<script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js     "></script>

<script type="text/javascript">
	//dataTable 세팅
	var myDataTable= $("#myTable").DataTable({
        "language": {
            "emptyTable": "데이터가 존재하지 않습니다.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건 중",
            "infoEmpty": "데이터가 존재하지 않습니다.",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "검색:",
            "zeroRecords": "데이터가 존재하지 않습니다.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
            	"first" : "첫 페이지",
                "last" : "마지막 페이지",
                "next": "다음",
                "previous": "이전"
            }
        },
        bPaginate: true,
    	searching: true,
        "destroy":true,
        "responsive": true,
        "autoWidth": false,
        stateSave: true,
        "pageLength": 8, //기본 데이터건수
        dom: 'Bfrtip',
	    buttons: [ 'copy', 'excel', 'print' ],
	    ajax:{
	       url: "${cPath}/buy/incost"
	       ,dataType:"json"
	    },
	    columns:[
	          {data:"rnum"}
	          ,{data:"mat_no"}
	          ,{data:"mat_name"}
	          ,{data:"lprod_name"}
	          ,{data:"mat_stand_size"}
	          ,{data:"mat_use"}
	          ,{
	        	  	data:"mat_in_cost",
		    		render: function ( data, type, row ) {		//빈 td태그 만들기
		    			let tag = '<input type="number" name="mat_in_cost" class="costInput" value="'+data+'" readonly/>';
		    			tag += '<input type="button" value="수정" class="costBtn btn btn-primary" style="margin-left:5px;margin-top:-6px;height:32px;padding-top:2px;"/>';
		    			return tag;
		    		}
		    	}
	    	]
	});
	
	$(document).on("click", ".costBtn", function(){	//수정 버튼 클릭시
		$(this).parent().find(".costInput").removeAttr('readonly').focus();
		$(this).val("완료").removeClass("btn-primary").addClass("btn-success");
	});
	
	$(document).on("click", ".btn-success", function(){	//완료 버튼 클릭시
		let cost = $(this).parent().find(".costInput").val();
		let mat_no = $(this).parent().parent().find("td:nth(1)").text();	//tr안에 있는 td들 중 2번째 값을 가져옴
		let btn = $(this);
		$.ajax({
			url : "${cPath}/buy/incost",
			data : JSON.stringify({
				mat_no: mat_no,
				mat_in_cost: cost
			}),
			contentType:"application/json",
			method : "put",
			dataType : "text",
			success : function(resp) {
				alert(resp);
				btn.parent().find(".costInput").prop("readonly","readonly");
				btn.val("수정").removeClass("btn-success").addClass("btn-primary");
			},
			error : function(errorResp) {
				console.log(errorResp.status + ":" + errorResp.responseText);
			}
		});
	});
	
	
	
	
</script>







