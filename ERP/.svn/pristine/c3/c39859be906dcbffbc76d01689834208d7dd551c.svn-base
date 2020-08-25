<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
    
    <link href="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.css" rel="stylesheet">
	<link href="${cPath }/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="${cPath }/resources/css/timelinestyle.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.6.0/holder.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.js"></script>
<script
  src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"
  integrity="sha256-DI6NdAhhFRnO2k51mumYeDShet3I8AKCQf/tf7ARNhI="
  crossorigin="anonymous"></script>
 <script src="${cPath }/resources/js/jquery.mtz.monthpicker.js"></script>


  <html>
    <div class="row">
        <div class="col-6" style="margin-left: 50px; padding: 50px">
   <iframe src="${cPath}/ware/warehouse/shape" style="width: 100%; height: 750px; border: 1px solid black; " id = "storeBox">
   </iframe>
        </div>
        <div class = "col-md-5"  style="margin-top: 50px">
   <h4>창고 현황</h4>
   <table
  id="table"
  data-toggle = "table"
  data-height="770"
  data-show-header="true"
  data-classes="table table-hover table-no-bordered"
  data-row-attributes="rowAttributes"
  data-sort-order="desc"
   data-search="true"
  >
  <thead>
    <tr>
      <th data-field="image" data-formatter="imageFormatter" data-title="사진">사진</th>
      <th data-field="stuff_name">제품이름</th>
      <th data-field="stuff_cnt" data-sortable="true">제품개수</th>
      <th data-field="stuff_no" data-sortable="true">제품 고유번호</th>
    </tr>
  </thead>
</table>
   </div>
    </div>
    <div class = "row" style="margin-left: 100px">
 <select id = "Lwarelist"  class="dynamicElement form-control col-md-2" data-url = "${cPath }/ware/warehouse/lwarelist" name = "search.searchType">
 <option>창고 종류선택</option>
 </select>
<select id = "wareList"  class="dynamicElement form-control col-md-2" data-url = "${cPath }/ware/warehouse/warelist" name = "store_no">
<option>창고선택</option>
</select>
    </div>


   <hr>
   <div class = "row">
   
<div class = "col-5" style="margin-left: 50px;">
       <h4>섹터 현황</h4>
       <table
  id="sectortable"
  data-toggle = "table"
  data-height="500"
  data-show-header="true"
  data-classes="table table-hover table-no-bordered"
  data-sort-order="desc"
  data-click-to-select="true"
  data-single-select="true"
  >
  <thead>
    <tr>
      <th data-field="state" data-checkbox="true"></th>
      <th data-field="image" data-formatter="imageFormatter" data-title="사진">사진</th>
      <th data-field="stuff_name">제품이름</th>
      <th data-field="stuff_cnt" data-sortable="true">제품개수</th>
      <th data-field="stuff_no" data-sortable="true">제품 고유번호</th>
    </tr>
  </thead>
</table>
       </div> 
       
       
       <div class = "col-5" style="margin-left: 110px;">
       <h4 style="margin-left: 150px;">입출고 타임라인</h4>
       <div class = "wrap">
       <div style="margin-left: auto;margin-right: auto;display: table;height: 50px;" >
       <a><i class="fa fa-calendar fa-2x" aria-hidden="true" style="margin-right: 5px; margin-top: 5px;"></i></a>
       <input type = "text" id = "monthPicker" name = "monthPicker" />
       </div>
       </div>
       <div class = "overflow-auto" style=" height: 500px">
       <div class="container">
      <div class="timeline" id = "timeline">
        <div></div>
        
        </div>
      </div>
    </div>
    
        </div>
       </div>
   
   <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원 정보 상세 조회</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id = "modalbody">
      
      </div>
      <div class="modal-footer">
      
        
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
   
   <script type="text/javascript" src="${cPath}/resources/js/dynamicSelect.js"></script>
   <script type="text/javascript">
   
   	   
//    	%N R인지 L인지   %D 입고 출고   %C 갯수  %P 상품이름   %T 날짜  %F 무슨 icon 
   	   
	   var timeline = '<div class="row no-gutters justify-content-end justify-content-md-around align-items-start %N">'
		   timeline += '<div class="col-10 col-md-3 order-3 order-md-1 timeline-content">'
           timeline += '<h3 class=" text-light">%D</h3><p> %C </p><p> %P </p></div>'
           timeline += '<div class="col-2 col-sm-1  order-2 timeline-image text-md-center" style="padding: 0"><a class="img-fluid" alt="img" style="position: relative;z-index: 1;">'
           timeline += '<i class = "fa %F fa-3x"></i></a></div><div class="col-10 col-md-5 order-1 order-md-3 py-3 timeline-date"><time>%T</time></div></div>'
   $(function(){
	   var options = {
			   pattern : 'yyyy-mm',
			   monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	   }
	   
	   $("#monthPicker").monthpicker(options)
	   
   })
   
   
   var optionPtrn = "<option value='%V'>%T</option>";
	var prod_lguTag = $("#Lwarelist").data("success", function(resp){
		var html = "";
		$.each(resp, function(idx, lprod){
			html += optionPtrn.replace("%V", lprod.lstore_no).replace("%T", lprod.lstore_name);			
		});
		prod_lguTag.append(html);
	}).on("change", function(){
		let prod_lgu = $(this).val();

		prod_buyerTag.trigger("renew", {
			LwareHouse_no : prod_lgu
		});
	});
	var trPtrn = "<tr data-toggle = 'modal' data-target = '#viewModal' data-remote='${cPath }/ware/warehouse/sectorlist?store_no=%T&stuff_name=%V'>"
	var prod_buyerTag = $("#wareList").data("success", function(resp){
		var html = "<option value>창고 선택</option>";
		$.each(resp, function(idx, buyer){
			html += optionPtrn.replace("%V", buyer.store_no).replace("%T", buyer.store_name);
		});
		prod_buyerTag.html(html);
	}).on("change", function(){ // 창고가 선택이 되었을 때
		let store_no = $("#wareList").val()
		let searchType = $("#Lwarelist").val().trim()
		
		let path = "${cPath}/ware/warehouse/callware"
		let setvalue = {searchType : searchType,store_no : store_no}
		$.ajax({url : path,data : setvalue,method : "post",dataType : "json", 
			success : function(resp) {
					// resp가 mat인지 prod인지 식별 가능해야한다.
					let trArr = []
					console.log(resp)
					console.log(searchType)
					let matlength = $(resp.matList).length
					
					if( searchType == "WH02" ){
						let matdata = matlist(resp) 
						extendTable(  matdata )
					}else{
						
						let proddata = prodlist(resp)
						extendTable ( proddata )
// 						$.each(resp,function(idx, ele){
// 							let tr = trPtrn.replace("%T", ele.store_no).replace("%V",ele.prodList[0].prod_name)
// 							let trElement = $(tr).append(
// 									$("<td>").text(ele.prodList[0].prod_name),
// 									$("<td>").text(ele.prodList[0].prod_cnt),
// 									$("<td>").text(ele.prodList[0].prod_stock_size)
// 							)
// 							trArr.push(trElement)
// 						})
					}
			}
		})
				let Store_no = $("#wareList").val()
				$('#storeBox')[0].contentWindow.changeJsonPath(Store_no)
	})
	
	$(".dynamicElement").dynamicSelect();
   
	function matlist(resp){
		let trArr = []
		
		$.each(resp,function(idx, ele){
			trArr.push({
				stuff_no : ele.matList[0].mat_no,
				store_no : ele.store_no,
				stuff_name : ele.matList[0].mat_name,
				mat_stock_size : ele.matList[0].mat_stock_size,
				stuff_cnt : ele.matList[0].mat_cnt + "" + ele.matList[0].mat_stock_size
			})
		})
		
		return trArr
	}
	
	function prodlist(resp){
		
let trArr = []
		
		$.each(resp,function(idx, ele){
			trArr.push({
				stuff_no : ele.prodList[0].prod_no,
				store_no : ele.store_no,
				stuff_name : ele.prodList[0].prod_name,
				stuff_cnt : ele.prodList[0].prod_cnt + "" + ele.prodList[0].prod_stock_size
			})
		})
		
		return trArr
		
	}
	
	
	
	var $table = $('#table')
	var $sector = $("#sectortable")

	function extendTable(resp){
	    $table.bootstrapTable('load',resp )
	    let tabletr =  $table.find("tr")
	}
	
	function extendSector(resp){
		$sector.bootstrapTable('load',resp )
	}
	

	  function imageFormatter(value ,row) {
		  
		  let files = new Image;
	    	let filesrc = "${cPath}/resources/prodImg/"+ row.stuff_no +".jpg"
	    	files.src = filesrc
	    		
	    	let failimg = "'${cPath}/resources/images/100x150.svg'"
	    	
	    	let imgEle = '<img src="%T" style = "height : 100px" onerror = "this.src = %Y">';
	    	imgEle = imgEle.replace("%T",filesrc).replace("%Y",failimg)
			
	    return imgEle
	  }

	  function actionFormatter() {
	    return '<i class="glyphicon glyphicon-heart"></i> <i class="glyphicon glyphicon-remove"></i>'
	  }
	
   
	function selectGrid(sector_no){
		let path = "${cPath}/ware/warehouse/callsector"
		
		$.ajax({

			url : path,
			data : {sector_no : sector_no},
			method : "post",
			dataType : "json", // Accept,text/html , Content-Type:text/html accept와 
			success : function(resp) {
				extendSector(resp)
			},
			error : function(error) {

				console.log(error.status + " : " + error.responseText);
			}
		})
	}
   
	 function rowAttributes(row, index) {
		let tr =  '${cPath }/ware/warehouse/sectorlist?store_no=%T&stuff_name=%V'  
		let remote = tr.replace("%T", row.store_no).replace("%V",row.stuff_name)
		 return {
		      'data-toggle': 'modal',
		      'data-target': '#viewModal',
		      'data-remote': remote
		     
		    }
		  }
   
   $("#table").on("click","tr", function(){
	   
		var modal = $(this); 
		var modalbody = $(".modal-body")
		
		modalbody.load(modal.data("remote"));

	}).css({
			cursor:"pointer"
		});
   
   var parentDiv = $("#timeline")
   
   $("#monthPicker").on("change",function(){
   	let check = $("#Lwarelist").val()
   	let month = $("#monthPicker").val()
   	check = check.trim()
   	let reurl = "${cPath}/ware/warehouse/timeLine/%T/%N/%F"
   	let url = reurl.replace("%T",check).replace("%F",date).replace("%N",month)
   console.log(url)
   	$.ajax({
   		url  : url,
   		method : "GET",
   		success : function(resp){
   			console.log(resp)
   			let timediv = []
   			$.each(resp,function(idx,item){
   			
   				var stuff_date = item.stuff_data
   				$.each(item.stuffList, function(index,stuff){
   					if(stuff.stuff_check == "IN"){
   						let timereplace = timeline.replace("%N","timeline-Lnodes")
   						.replace("%D","입고").replace("%C",stuff.stuff_cnt).replace("%P",stuff.stuff_name)
   						.replace("%T",stuff_date).replace("%F","fa-sign-in green")
   						
   						timediv.push(timereplace)
   					}else{
   						let timereplace = timeline.replace("%N","timeline-Rnodes")
   						.replace("%D","출고").replace("%C",stuff.stuff_cnt).replace("%P",stuff.stuff_name)
   						.replace("%T",stuff_date).replace("%F","fa-sign-out red")
   						
   						timediv.push(timereplace)
   					}
   				})
   			})
				   			
   			parentDiv.html(timediv)
   			
   		}
   	})
   })
   
   var date
   
    $("#sectortable").on("click","tr",function(){
    	date = $(this).find("td").eq(4).text()
    })
   
//    $.ajax({

// 		url : "${cPath}/warehouse ",
// 		method : "GET",
// 		dataType : "JSON", // Accept,text/html , Content-Type:text/html accept와 
// 		success : function(resp) {
			
// 			console.log(resp)
// 			let optionhtml = "<option>창고선택</option>"
			
// 			$.each(resp, function(idx, wareHouse){
				
// 				optionhtml += optionPtrn.replace("%V", wareHouse.store_no).replace("%T",wareHouse.store_name)
// 			})
// 			$("#wareList").html(optionhtml)
// 		},
// 		error : function(error) {

// 			console.log(error.status + " : " + error.responseText);
// 		}
// 	})

   </script>
   
   
   </html>