<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


  <style type="text/css">
  
  .stuffOK {
  border-left: 5px solid green;
      background: ghostwhite;
  
  }
  .stuffFAIL{
  border-left: 5px solid red;
      background: ghostwhite;
  }
  
  </style>


  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>HnJ ERP</title>
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/ERP/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- IonIcons -->
  <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/ERP/resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link href="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.css" rel="stylesheet">
  <script type="text/javascript" src="/ERP/resources/js/bootstrap-4.5.0-dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.js"></script>
  <script src="/ERP/resources/alert/bootbox.all.min.js"></script>
  <script src="/ERP/resources/alert/bootbox.locales.min.js"></script>
  <script src="/ERP/resources/alert/bootbox.min.js"></script>
  
  
  
  
</head>
<body>

<select id = "wareList"  class="dynamicElement form-control col-md-6" data-url = "${cPath }/ware/warehouse/warelist" name = "store_no">
<option>창고선택</option>
</select>

<div class = "row">
<div class = "col-8">
 <iframe src="${cPath}/ware/warehouse/shape" style="width: 100%; height: 750px" id = "storeBox">
   </iframe>
</div>

<div class = "col-4 overflow-auto" style="height: 750px" >
<a><i class= 'fa fa-archive fa-2x'></i>원자재 목록</a>
<div class = "col-4 cardlist">

 <div class="card" style="width: 18rem;">
  <div class="card-body stuffFAIL">
    <h3 class ="stuff_name" >설탕</h3>
    <p class="card-text stuff_cnt">5개</p>
    <div>
    <a href="#" class="btn btn-primary instuff">입고</a>
    <div class="counter" style="
    display: inline;
    position: absolute;

    right: 30px;
    ">
      <i class="fa fa-sort fa-2x" aria-hidden = "true"></i>
      <h2 class="timer count-title count-number" style="display: inline;">100</h2>
    </div>
    
    </div>
  </div>
</div>

</div>
</div>
</div>
<hr>


  <table
  id="table"
  data-toggle="table"
  data-height="300"
   >
  <thead>
    <tr>
      <th data-field="sector_no">구역번호</th>
      <th data-field="stuff_name">품명</th>
      <th data-field="stuff_date">입고일자</th>
      <th data-field="stuff_cnt">입고수량</th>
       <th data-field="operate" data-formatter="operateFormatter" data-events="operateEvents">취소</th>
      <th data-field="stuff_no"></th>
      <th data-field="stuff_count"></th>
    </tr>
  </thead>
</table>

<div class = "row text-center" style="width : 100%; padding: 10px">
<div style="width: 30%; float: none; margin: 0 auto" >
<a class = "btn btn-primary insertBtn" style="width: 100px; color: white">입고</a>
<a class = "btn btn-danger cancelBtn" style="width: 100px; color: white" onClick="window.close()">취소</a>
</div>
</div>



   <input type="hidden" value="${lstore_no }" name = "lstore_no">
   <input type="hidden" value="${code }" name = "code">


   <script type="text/javascript" src="${cPath}/resources/js/dynamicSelect.js"></script>
<script type="text/javascript">

var prod_lgu = "${lstore_no}"
var optionPtrn = "<option value='%V'>%T</option>";
var parentData = opener.parent.setRow()
var sector_no = null;
var stuff_count = 0;
var $table = $('#table')




$(".insertBtn").on("click",function(){
	
	let insertCheck = false
	$(".card-body").each(function(){
	
		if( $(this).hasClass("stuffFAIL") == true ){
			alert("모든 상품을 입고시켜주십시오")
			insertCheck = true;
		}
	})
	if(insertCheck == true){
		return;
	}
	
	let url = window.location.href;
	let data = JSON.stringify($("#table").bootstrapTable('getData'))
	
	console.log(data)
	
	$.ajax({
	    url: url ,
	    data: data,             
	    type: "post",                           
	    dataType: "text",
	    contentType : "application/json; charset=utf-8",
	    success : function(res){
	    	console.log(res)
	    	alert("입고가 완료되었습니다.")
	    	opener.parent.location.reload()
	    	window.close()
	    }
	})
	
	
})


$(function() {
	$("#table").bootstrapTable('hideColumn','stuff_no')
	$("#table").bootstrapTable('hideColumn','stuff_count')
})

//카드 생성
$.each(parentData.stufflist,function(index,item){
	
	stuff_count++;
	let card = $(".card").eq(0).clone()
	card.find(".card-body").data("stuff_count",stuff_count)
	card.find(".card-body").data("stuff_no",item.stuff_no)
	card.find(".stuff_name").text(item.stuff_name)
	card.find(".stuff_cnt").text(item.stuff_cnt + item.stuff_size)
	card.find(".count-number").text(item.stuff_cnt).attr("name",stuff_count)
	
	$(".cardlist").append(card)
	console.log(item)
})
$(".card").children().eq(0).remove()

// 버튼 클릭해서 insert되는 곳
$(".instuff").on("click",function(){
	if(sector_no == null){alert("섹터를 선택하세요");return;}
	
	let instuff = $(this)
	let count_parent = instuff.parent().parent()	
	let count_object = count_parent.find(".count-number");	
	let count_cnt = count_object.text()
	
	 if(count_cnt == 0)return
   if(count_parent.hasClass("stuffOK")){
	   count_parent.removeClass("stuffOK").addClass("stuffFAIL")
   }
   
	bootbox.prompt({
	    title: "해당 섹터에 입고 수량을 입력하세요", 
	    centerVertical: true,
	    inputType: 'number',
	    callback: function(result){ 
	    	if(result == null)return;
	    	let in_cnt = result
	    	console.log(result)
			let count_result = count_cnt - in_cnt
			if(count_result < 0){
				alert("입고 숫자에 맞춰주십시오")
			}else{
				if(count_result == 0){count_parent.removeClass("stuffFAIL").addClass("stuffOK")}
			    count_object.text(count_result)
			    let obj = {
			    	 sector : sector_no,
			    	 count : count_parent.data("stuff_count"),
			    	 stuff_no : count_parent.data("stuff_no"),
			    	 cnt : in_cnt,
			    	 stuff_name : count_parent.find(".stuff_name").text()
			    }
			    addTable(obj)
			    
			}
	    }
	});
})
// insert 종료

function addTable(obj){
	
	$table.bootstrapTable('insertRow', {
        index: 1,
        row: {
          sector_no: obj.sector,
          stuff_name: obj.stuff_name,
          stuff_cnt: obj.cnt,
          stuff_no : obj.stuff_no,
          stuff_count : obj.count
        }
      })
	
}



//카드 생성 종료
$.ajax({
	url : "${cPath }/ware/warehouse/warelist",
	data: {LwareHouse_no: prod_lgu},
	dataType : "json", // Accept:application/json, Content-Type:application/json
	success : function(resp){
		
		var html = "<option value>창고 선택</option>";
		$.each(resp, function(idx, buyer){
			html += optionPtrn.replace("%V", buyer.store_no).replace("%T", buyer.store_name);
		});
		prod_buyerTag.html(html);
		
	},
	error : function(errorResp) {
		console.log(errorResp.status + ":" + errorResp.responseText);
	}
});


var prod_buyerTag = $("#wareList").data("success", function(resp){
	var html = "<option value>창고 선택</option>";
	$.each(resp, function(idx, buyer){
		html += optionPtrn.replace("%V", buyer.store_no).replace("%T", buyer.store_name);
	});
	prod_buyerTag.html(html);
}).on("change", function(){
	
	console.log( parentData )
	let Store_no = $("#wareList").val()
	$('#storeBox')[0].contentWindow.changeJsonPath(Store_no)
	sector_no = null
})

function selectGrid(sector){
	sector_no = sector
	

	}
//

function operateFormatter(value, row, index) {
    return [
      '<a class="like" href="javascript:void(0)" title="Like">',
      '<i class="fa fa-times"></i>',
      '</a>  ',
     
    ].join('')
  }
  
  window.operateEvents = {
    'click .like': function (e, value, row, index) {
      $table.bootstrapTable('remove',{
    	field: '$index',
    	values: [index]
    	  
      })
      
      $(".card-body").each(function(idx,item){
    	 
    	 if( $(this).data("stuff_count") == row.stuff_count ){
    		 let num_count = $(this).find(".count-number") 
    		 num_count.text( Number(num_count.text()) +  Number(row.stuff_cnt) )
    		 $(this).removeClass("stuffOK").addClass("stuffFAIL")
    	 }
    	  
      })
    }
  }
	
	


</script>
  

</body>
</html>