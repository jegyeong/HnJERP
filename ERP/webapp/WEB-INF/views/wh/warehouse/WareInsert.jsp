 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/gridstick/bootstrap.min.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/gridstick/demo.css" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/gridstick/810-many-columns.css" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/buttonStyle.css" >

<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/gridstick/jquery-ui.min.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/gridstick/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/gridstick/gridstack.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/gridstick/gridstack.jQueryUI.js"></script>

<div>
<div >


<h2>창고 도식화</h2>

 <div class="container-fluid">
    <div class="middleDiv">
      
      
      <div class = "row">
      <div class = "col-md-1">
      
      <div class="buttonRounded green " data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-plus"></i><span>추가</span></div>
      <div class="buttonRounded lightpink sector-delete"><i class="fa fa-minus"></i><span>삭제</span></div>
      
      </div>
      
    <div class = "col-md-10 ">
    <div class="grid-stack" style="border: 1px solid black; width: 1000px"></div>
    </div>
    </div>
      </div>

  
  </div>
  
 <div style="padding: 40px; margin-left: 170px;" >
  <form action="${cPath }/ware/warehouse/manger" method="post" id = "wareform">
  
  <div class="form-group row">
    <label for="colFormLabelSm" class="col-sm-1 col-form-label col-form-label">창고이름</label>
    <div class="col-sm-1">
      <input type="email" class="form-control form-control"  name = "store_name" placeholder="창고 이름을 적어주십시오">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="colFormLabelSm" class="col-sm-1 col-form-label col-form-label">분류코드</label>
    <div class="col-sm-1">
      <select name = "lstore_no" id = "lstore" data-url = "${cPath }/ware/warehouse/lwarelist" class= "custom-select mr-sm-2">
  <option >창고 분류코드</option>
  </select>
    </div>
  </div>
  
  <div class="form-group row">
    <label for="colFormLabelSm" class="col-sm-1 col-form-label col-form-label">창고 상세사항</label>
    <div class="col-sm-5">
      <input type="email" class="form-control form-control" name ="store_def"  placeholder="창고 상세사항을 적어주십시오">
    </div>
  </div>
  
<!--   <input type="text" placeholder="창고 이름을 정하세요" name = "store_name"/> -->
  
<!--   <input type="text" placeholder="해당 창고의 해당사항을 적어주세요" name ="store_def"/> -->
  <input type="hidden" name = "store_json" id = "json"/>
  <input type="hidden" name = "count" id = "count">
  </form>
 </div>
  
  <button class = "btn btn-primary" style="margin-left: 200px" id = "CreateWare">창고 생성</button>
  <button class = "btn btn-primary">되돌아가기</button>
  
  
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p> 현재 창고에서 사용할 섹터의 갯수를 정해주세요.</p>
        <p> 섹터는 각자의 고유번호를 가지게 됩니다. 원치 않은 섹터 생성시 삭제를 하면 숫자의 뒷번호부터 지워지게 됩니다.</p>
       <input type="number" placeholder="추가할 섹터의 갯수를 적으세요" name = "sector_cnt">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary btn-sector-plus">섹터 추가하기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
  
  </div>
  </div>
  <br><br><br><br><br><br><br>

<script type="text/javascript" src="${cPath}/resources/js/dynamicSelect.js"></script>
<script type="text/javascript">


$('.grid-stack').on('contextmenu', function(e) {
	  var top = e.pageY - 10;
	  var left = e.pageX - 90;
	  $("#context-menu").css({
	    display: "block",
	    top: top,
	    left: left
	  }).addClass("show");
	  return false; //blocks default Webbrowser right click menu
	}).on("click", function() {
	  $("#context-menu").removeClass("show").hide();
	});

	$("#context-menu a").on("click", function() {
	  $(this).parent().removeClass("show").hide();
	});

function upAddgrid(){
 grid.addWidget('<div><div class="grid-stack-item-content "></div></div>', {x: 	$(".grid-stack").find(".select").parent().data("gsX") , y: $(".grid-stack").find(".select").parent().data("gsY"), width: 2 , height: 2 } );
}
// json파일을 읽고 해당된 파일을 읽어오는 역활



 plusNewWidget = function(sec_cnt){
 	 grid.addWidget('<div><div class="grid-stack-item-content ">'+sec_cnt+'</div></div>', {x: (sec_cnt*2+2)/30 >= 1? (sec_cnt*2+2)%30 : sec_cnt*2+1 , y: 0, width: 2 , height: 2, id:sec_cnt } );
 }

var options = {
		column: 30, // width값을 30개로 늘렸다라는 의미
	      cellHeight: 'auto',
	      float: true
	    };
var grid = GridStack.init(options);
		// 위에서 부터 시작하면 options이라는 grid 형태를 상태에 대한 것을 객체 형태로 적어 놓으면, 그것들이 적용된 grid가 형성된다.
		// 즉슨, grid의 뼈대가 되는 부분이다.
		
		// grid를 추가하는 명령어다.
	 
	    addNewWidget = function(item) {
	      grid.addWidget('<div><div class="grid-stack-item-content ">' + item.id + '</div></div>', {id: item.id, x: item.x , y: item.y, width: item.width , height: item.height });
	      grid.movable('.grid-stack-item', false);
	      grid.resizable('.grid-stack-item', false);
		 
	    };
	    
   	grid.addWidget('<div><div class="grid-stack-item-content " id = "delete"></div></div>', {x: 0 , y: 10, width: 1 , height: 1, id : 'delete'} );
    $("#delete").parent().remove()


$(document).on("click","div .grid-stack-item",function(){
	var select = $(".grid-stack-item")
	
	$("#box").val( $(this).data("gsId") )
	console.log($(this))
	
	// 자기 자신을 제외한 나머지 select 클래스 해제
	$(this).find(".grid-stack-item-content").addClass("select")
	select.not( $(this) ).find(".grid-stack-item-content").removeClass("select")
	})
	// 섹터 추가시 추가됨
	var sector_no = 0;
	
    // 추가
	$(".btn-sector-plus").on("click",function(){
		let sector_cnt =  $("input[name = sector_cnt]").val()
		for(var i = 0; i < sector_cnt; i++){
			sector_no += 1;
			plusNewWidget(sector_no);
		}
	})
	// 삭제
	$(".sector-delete").on("click",function(){
		var id = $(".grid-stack-item")
		$(id).each(function(idx,item){
			if( $(item).data("gsId") == sector_no){
				grid.removeWidget(item)
				sector_no -= 1
			}
		})
	})

	function saveGird(){
		  serializedData = [];
		    grid.engine.nodes.forEach(function(node) {
		    	if(node.id == "delete")return true
		      serializedData.push({
		        x: node.x,y: node.y, width: node.width, height: node.height, id: node.id});
		    });
		    $("#json").val( JSON.stringify(serializedData, null, '  ') )
		   // 히든파일에 val값이 전해지지 않음 
		   }
	
	
	$("#CreateWare").on("click",function(){
		saveGird()
		$("#count").val(sector_no)
		
		
		$("#wareform").submit()
	})
	
	var optionPtrn = "<option value='%V'>%T</option>";
	var prod_lguTag = $("#lstore").data("success", function(resp){
		var html = "";
		$.each(resp, function(idx, lprod){
			html += optionPtrn.replace("%V", lprod.lstore_no).replace("%T", lprod.lstore_name);			
		});
		prod_lguTag.append(html);
	})
	
	$("#lstore").dynamicSelect();
    
	    

</script>
