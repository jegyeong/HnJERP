<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<h2 style="padding-left: 30px; padding-top: 25px;">원자재반품출고관리</h2>
	
	<div class="card card-info">
       <div class="card-header">
         <h3 class="card-title">Line Chart</h3>

         <div class="card-tools">
           <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
           </button>
           <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
         </div>
       </div>
       <div class="card-body">
         <div class="chart"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
           <canvas id="lineChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 622px;" width="622" height="250" class="chartjs-render-monitor"></canvas>
         </div>
       </div>
       <!-- /.card-body -->
     </div>
     
<input type="button" value="테스트용" id="testbtn"/> 

<script type="text/javascript">

var areaChartData = {
	      labels  : ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
	      datasets: [
	        {
	          label               : 'Digital Goods',
	          backgroundColor     : 'rgba(60,141,188,0.9)',
	          borderColor         : 'rgba(60,141,188,0.8)',
	          pointRadius          : false,
	          pointColor          : '#3b8bba',
	          pointStrokeColor    : 'rgba(60,141,188,1)',
	          pointHighlightFill  : '#fff',
	          pointHighlightStroke: 'rgba(60,141,188,1)',
	          data                : [28, 48, 40, 19, 86, 27, 90]
	        },
	        {
	          label               : 'Electronics',
	          backgroundColor     : 'rgba(73, 117, 204, 1)',
	          borderColor         : 'rgba(73, 117, 204, 1)',
	          pointRadius         : false,
	          pointColor          : 'rgba(73, 117, 204, 1)',
	          pointStrokeColor    : '#4975cc',
	          pointHighlightFill  : '#fff',
	          pointHighlightStroke: 'rgba(100,100,100,1)',
	          data                : [65, 59, 80, 81, 56, 55, 40]
	        },
	        {
	          label               : 'Electronics',
	          backgroundColor     : 'rgba(210, 214, 222, 1)',
	          borderColor         : 'rgba(210, 214, 222, 1)',
	          pointRadius         : false,
	          pointColor          : 'rgba(210, 214, 222, 1)',
	          pointStrokeColor    : '#c1c7d1',
	          pointHighlightFill  : '#fff',
	          pointHighlightStroke: 'rgba(220,220,220,1)',
	          data                : [66, 10, 100, 90, 54, 50, 54]
	        }
	      ]
	    }
	    
var areaChartOptions = {
	      maintainAspectRatio : false,
	      responsive : true,
	      legend: {
	        display: false
	      },
	      scales: {
	        xAxes: [{
	          gridLines : {
	            display : false,
	          }
	        }],
	        yAxes: [{
	          gridLines : {
	            display : false,
	          }
	        }]
	      }
	    }

//-------------
//- LINE CHART -
//--------------
var lineChartCanvas = $('#lineChart').get(0).getContext('2d')
var lineChartOptions = jQuery.extend(true, {}, areaChartOptions)
var lineChartData = jQuery.extend(true, {}, areaChartData)
lineChartData.datasets[0].fill = false;
lineChartData.datasets[1].fill = false;
lineChartData.datasets[2].fill = false;
lineChartOptions.datasetFill = false

var lineChart = new Chart(lineChartCanvas, { 
  type: 'line',
  data: lineChartData, 
  options: lineChartOptions
})
</script>

