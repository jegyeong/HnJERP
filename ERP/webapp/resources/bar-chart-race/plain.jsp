<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://d3js.org/d3.v5.min.js"></script>
  <script src="https://d3js.org/d3-array.v2.min.js"></script>
  <meta charset="utf-8">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>HnJ ERP</title>
  <!-- jQuery -->
  <script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- IonIcons -->
  <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap-4.5.0-dist/js/bootstrap.bundle.min.js"></script>
<title>Bar Chart Race</title>
<link rel="stylesheet" type="text/css" href="./inspector.css">
<body>
<h1>상품별매출현황</h1><br>
<table>
	<tfoot>
		<tr>
			<td colspan="8">
				<div class="d-block d-md-flex align-items-center d-print-none">
				<div class="form-inline d-flex ml-md-auto d-print-none" id="searchUI">
					<text>년도</text>
					<select name="dataChange" class="form-control mr-2">
					</select>
					<input class="btn btn-success mr-2" type="button" value="검색" id="searchBtn">
				</div>
				</div>
			</td>
		</tr>
	</tfoot>
</table>
  
  <body>
    <div id='renderingArea'></div>
    <script type="module">
      import {makeChart} from "./plain.js"
      const fileAttachments = new Map([["sample1",new URL("/ERP/account/pm/product/"+2020,import.meta.url)], 
      ["sample2",new URL("./files/sample2.csv",import.meta.url)]]);
	
      let dataChange = function(event){
        makeChart(new URL("/ERP/account/pm/product/"+event.target.value,import.meta.url), '#renderingArea');
      }
      document.getElementsByName("dataChange").forEach(function(element){
        element.onchange=dataChange;
      });
      document.getElementsByName("dataChange")[0].dispatchEvent(new Event("change"))

  var today = new Date();
	for(var i = today.getFullYear(); i >= ${year}; i--){
		$("#standard").append($("<option>").text(i).val(i));
	}
    </script>
  </body>
</html>