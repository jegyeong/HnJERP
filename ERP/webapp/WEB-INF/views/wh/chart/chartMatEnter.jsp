<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<h2 style="padding-left: 30px; padding-top: 25px;">원자재반품출고관리</h2>
	<div class="card card-success">
        <div class="card-header">
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body">
          <div class="chart"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
            <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 572px;" width="572" height="250" class="chartjs-render-monitor"></canvas>
          </div>
        </div>
         <!-- /.card-body -->
	</div>

<input type="button" value="테스트용" id="testbtn"/> 

<script type="text/javascript">
	var matOutList = "";
	
	var nameArr = [];
	var cntArr = [];
	
		$.ajax({
			url : "${cPath}/ware/chart/outer",
// 			url:"${cPath}/ware/prod/search/matnamesearch",
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				matOutList = resp;
				
				$.each(matOutList, function(i){

					nameArr.push(matOutList[i].mat_name);
					cntArr.push(matOutList[i].cnt);

				});
				console.log("nameArr111111  "+nameArr);
				console.log("cnt1111  " + cntArr);		
				
				// Get context with jQuery - using jQuery's .get() method.
			    var areaChartCanvas = $('#barChart').get(0).getContext('2d')
			    var exArr = [];
				$.each(nameArr,function(i, item){
					exArr.push({
					  label               : item,
 			          backgroundColor     : 'rgba(60,141,188,0.9)',
 			          borderColor         : 'rgba(60,141,188,0.8)',
 			          pointRadius          : false,
 			          pointColor          : '#f25149',
 			          pointStrokeColor    : 'rgba(242,81,73,1)',
 			          pointHighlightFill  : '#fff',
 			          pointHighlightStroke: 'rgba(242,81,73,1)',
 			          data                : [cntArr[i]]	
					})
				})
				console.log("123123    "+exArr[1].data);
			    var areaChartData = {
// 			      labels  : ['입고량'],
			      labels  : nameArr,
// 			      datasets:exArr 
			      datasets: 
	[
			        {
			          label               : 'Digital Goods',
			          backgroundColor     : 'rgba(60,141,188,0.9)',
			          borderColor         : 'rgba(60,141,188,0.8)',
			          pointRadius          : false,
			          pointColor          : '#fa7770',
			          pointStrokeColor    : 'rgba(60,141,188,1)',
			          pointHighlightFill  : '#fff',
			          pointHighlightStroke: 'rgba(60,141,188,1)',
			          data                : cntArr
			        }
			      ]
			    }
				
				//-------------
			    //- BAR CHART -
			    //-------------
			    var barChartCanvas = $('#barChart').get(0).getContext('2d')
			    var barChartData = jQuery.extend(true, {}, areaChartData)
			    var temp0 = areaChartData.datasets[0]
// 			    var temp1 = areaChartData.datasets[1]
// 			    barChartData.datasets[0] = temp1
			    barChartData.datasets[0] = temp0

			    var barChartOptions = {
			      responsive              : true,
			      maintainAspectRatio     : false,
			      datasetFill             : false,
			      scales: {
			            yAxes: [{
			                ticks: {
			                    suggestedMin: 0,
			                    suggestedMax: 10
			                }
			            }]
			        }
			    }

			    var barChart = new Chart(barChartCanvas, {
			      type: 'bar', 
			      data: barChartData,
			      options: barChartOptions
			    })
			    //--------
				
			},
			error : function(errorResp) {
				console.log(errorResp.status + ":" + errorResp.responseText);
			}
		});
		

</script>
