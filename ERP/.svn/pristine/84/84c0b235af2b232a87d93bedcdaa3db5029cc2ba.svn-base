<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${cPath }/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${cPath }/resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css">

<h2 style="padding-left: 30px; padding-top: 25px;">급여내역</h2>
<div class="table2">
<table id="myTable" class="table table-bordered table-hover text-left">
	<thead class="table-primary">
		<tr>
			
			<th>급여일</th>
			<th>소속</th>
			<th>직급</th>
			<th>사원ID</th>
			<th>성명</th>
		</tr>
	</thead>
</table>
</div>

<!-- 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">급여정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
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
		bPaginate: true,
		searching: true,
	    "destroy":true,
	    "responsive": true,
	    "autoWidth": false,
	    stateSave: true,
	    dom: 'lfrtBip',
	    buttons: [
	        'excel', 'print'
	    ],
	    ajax:{
	       url: "${cPath}/mypage/myInfo/salaryInfoList"
	       ,dataType:"json"
	    },
	    columns:[
	    
	    	{data:"sal_date"}
			,{data:"dep_no"}
			,{data:"pos_no"}
			,{data:"emp_no"}
			,{data:"emp_name"}
	    ],
	});
	
	
	//상세보기
	$('#myTable tbody').on('click', 'tr', function (e) {
		if($(e.target).hasClass("select-checkbox")) return;		//체크박스 부분에는 이벤트 제외
		var data = myDataTable.row(this).data();
		$.ajax({
			url : "${cPath}/emp/salary/salaryInfoList/view",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(data),
			method : "POST",
			dataType : "html",
			success : function(resp) {
				$("#exampleModal").find(".modal-body").html(resp);
				$('#exampleModal').modal("show");
			},
			error : function(errorResp) {
				console.log(errorResp.status + ":" + errorResp.responseText);
			}
		});
	});
	
	
	
	
</script>

















