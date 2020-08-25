<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<style type="text/css">
#edit,#add,#valid,#more{
box-sizing: content-box
}
.column {
    width: 205px;
    float: left;
    padding-bottom: 100px;
  }
  .portlet {
    margin: 0 1em 1em 0;
    padding: 0.3em;
  }
  .portlet-header {
    padding: 0.2em 0.3em;
    margin-bottom: 0.5em;
    position: relative;
  }
  .portlet-toggle {
    position: absolute;
    top: 50%;
    right: 0;
    margin-top: -8px;
  }
  .portlet-content {
    padding: 0.4em;
  }
  .portlet-placeholder {
    border: 1px dotted black;
    margin: 0 1em 1em 0;
    height: 50px;
  }

</style>

<link rel="stylesheet" href="${cPath }/resources/js/jquery-ui-1.12.1/jquery-ui.min.css" />
<link rel="stylesheet" href="${cPath }/resources/css/frappe-gantt.css" />
<script type="text/javascript" src="${cPath }/resources/js/frappe-gantt.js"></script>
<script type="text/javascript" src = "${cPath }/resources/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
</head>

<body>
생산일정관리

<div class = "main" style="margin-left: 50px">
<div class = "row">
 <div class = "col-11">
  <div  class = "shadow-sm">
  <div class="gantt-target"></div>
  
  </div>
 </div>
 
</div>

<div class="row mt-5">

<div class = "col-5 mr-5 shadow-sm" style="background: white;">
생산진행전
<div class = "p-3">
	<div class="column">
 
  <div class="portlet">
    <div class="portlet-header">dddddddddddd</div>
    <div class="portlet-content">생산품 운동화 진행도 50% 프로젝트명 2018하반기 하이브리드 슈즈 생성</div>
  </div>
 
  <div class="portlet">
    <div class="portlet-header">0002</div>
    <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
  <div class="portlet">
    <div class="portlet-header">0003</div>
    <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
  <div class="portlet">
    <div class="portlet-header">0004</div>
    <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
 
</div>
<div class = "column"></div>
<div class = "column"></div>

</div>
</div>
<div class = "col-5 shadow-sm" style="background: white;">
생산진행중
 <div class = "p-3">
	<div class="column">
 
  <div class="portlet">
    <div class="portlet-header">0001</div>
    <div class="portlet-content">생산품 운동화 진행도 50% 프로젝트명 2018하반기 하이브리드 슈즈 생성</div>
  </div>
 
  <div class="portlet">
    <div class="portlet-header">0002</div>
    <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
  <div class="portlet">
    <div class="portlet-header">0003</div>
    <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
  <div class="portlet">
    <div class="portlet-header">0004</div>
    <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
  </div>
</div>
 <div class = "column"></div>
<div class = "column"></div>
 
	
	
 </div>
</div>

</div>
</div>
<script>

var BeforeList = [
		<c:forEach var="order" items="${order }" varStatus="i">
		{	porder_no : "${order.porder_no}",
		emp_name : "${order.emp_name}",
		prod_name : "${order.prod_name}",
		porder_date : "${order.porder_date}"},
     <c:if test="${i.last}">
     {	porder_no : "${order.porder_no}",
 		emp_name : "${order.emp_name}",
 		prod_name : "${order.prod_name}",
 		porder_date : "${order.porder_date}" }
     </c:if>
		</c:forEach>
]



$( function() {
  $( "#sortable1, #sortable2" ).sortable({
    connectWith: ".connectedSortable",
    	beforeStop: function( event, ui ){
    		console.log(ui)
    		console.log(event)
    	}
  }).disableSelection();
  
  $( ".column" ).sortable({
      connectWith: ".column",
      handle: ".portlet-header",
      cancel: ".portlet-toggle",
      placeholder: "portlet-placeholder ui-corner-all"
    });
 
    $( ".portlet" )
      .addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
      .find( ".portlet-header" )
        .addClass( "ui-widget-header ui-corner-all" )
        .prepend( "<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");
 
    $( ".portlet-toggle" ).on( "click", function() {
      var icon = $( this );
      icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
      icon.closest( ".portlet" ).find( ".portlet-content" ).toggle();
    });
  
  
} );


		var tasks = [
			{
				start: '2020-08-01',
				end: '2020-08-08',
				name: 'Redesign website',
				id: "Task 0",
				progress: 91
			}
			
		]
		
		function getFormatDate(date){
		    var year = date.getFullYear();              //yyyy
		    var month = (1 + date.getMonth());          //M
		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		    var day = date.getDate();                   //d
		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}
		
		var gantt_chart = new Gantt(".gantt-target", tasks, {
			on_click: function (task) {
				console.log(task);
			},
			on_date_change: function(task, start, end) {
				
				let startDate =  getFormatDate(start) 
				let endDate =  getFormatDate(end) 
				task.start = startDate
				task.end = endDate
				console.log(task)
				
				
			},
			on_progress_change: function(task, progress) {
				console.log(task, progress);
				
			},
			on_view_change: function(mode) {
				console.log(mode);
			},
			view_mode: 'Day',
			language: 'en'
		});
		console.log(gantt_chart);
		
		$("#test").on("click",function(){
			
			console.log(gantt_chart.tasks)
		})
	</script>

</body>
</html>