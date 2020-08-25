<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images/favicon.png" rel="icon" />
<title>${invoice }의뢰서</title>
<meta name="author" content="harnishdesign.net">

<!-- Web Fonts
======================= -->
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900'
	type='text/css'>

<!-- Stylesheet
======================= -->
<link rel="stylesheet" type="text/css"
	href="${cPath }/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${cPath }/resources/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="${cPath }/resources/css/stylesheet.css" />
<link rel='stylesheet'
	href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'
	type='text/css'>
</head>
<body>
	<!-- Container -->
	<div class="container-fluid invoice-container">
		<!-- Header -->
		<header>
			<div class="row align-items-center">
				<div class="col-sm-7 text-center text-sm-left mb-3 mb-sm-0">
					<img src="/ERP/resources/img/logo.png" alt="ERP"
						class="brand-image img-circle elevation-3" style="opacity: .8">
				</div>
				<div class="col-sm-5 text-center text-sm-right">
					<h4 class="text-7 mb-0">생산의뢰서</h4>
				</div>
			</div>
			<hr>
		</header>

		<!-- Main Content -->
		<main>
			<div class="row">
				<div class="col-sm-6">
					<strong>Date:</strong> 10/08/2020
				</div>
				<div class="col-sm-6 text-sm-right">
					<strong>의뢰 번호:</strong>${invoice }
				</div>

			</div>
			<hr>
			<div class="row">
				<div class="col-sm-4 mb-3 mb-sm-0">
					<span class="text-black-50 text-uppercase">신청부서</span><br> <span
						class="font-weight-500 text-3"></span>자재팀
				</div>
				<div class="col-sm-4 mb-3 mb-sm-0">
					<span class="text-black-50 text-uppercase"></span><br> <span
						class="font-weight-500 text-3"></span>
				</div>
				
			</div>
			<hr class="my-4">

			<div class="row">
				<div class="col-sm-2 mb-3 mb-sm-0">
					<span class="text-black-50 text-uppercase">직책</span><br> <span
						class="font-weight-500 text-3">
						<c:choose>
						<c:when test="${pductlist.empVO.pos_no eq 'MA' }">부장</c:when>
						<c:when test="${pductlist.empVO.pos_no eq 'GM' }">과장</c:when>
						<c:when test="${pductlist.empVO.pos_no eq 'AM' }">대리</c:when>
						<c:when test="${pductlist.empVO.pos_no eq 'EM' }">사원</c:when>
						</c:choose>
						</span>
				</div>
				<div class="col-sm-2 mb-3 mb-sm-0">
					<span class="text-black-50 text-uppercase">이름</span><br> <span
						class="font-weight-500 text-3">${pductlist.empVO.emp_name }</span>
				</div>
				<div class="col-sm-3 mb-3 mb-sm-0">
					<span class="text-black-50 text-uppercase">연락처</span><br> <span
						class="font-weight-500 text-3">${pductlist.empVO.emp_phone }</span>
				</div>
				<div class="col-sm-4">
					<span class="text-black-50 text-uppercase">메일</span><br> <span
						class="font-weight-500 text-3">${pductlist.empVO.emp_email }</span>
				</div>
			</div>
			<hr class="my-4">


			
			
			<div class="card">
      <div class="card-header py-0">
        <table class="table mb-0">
          <thead>
            <tr>
              <td class="col-6 border-0"><strong>생산제품</strong></td>
              <td class="col-10 text-right border-0" style="
    word-break: keep-all;
"><strong>개수</strong></td>
              <td class="col-2 text-right border-0"><strong style="
    word-break: keep-all;
">사이즈</strong></td>
            </tr>
          </thead>
        </table>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table">
            <tbody>
              <tr>
                <td class="col-6 border-0">${pductlist.prod_name }</td>
                <td class="col-4 text-right border-0">${pductlist.pduct_cnt }</td>
                <td class="col-2 text-right border-0">개</td>
              </tr>
              <tr>
                <td><i class="fa fa-angle-double-right" style="
    margin-left: 10px;
"></i> BOM<br></td>
                <td class="text-right"></td>
                <td class="text-right"></td>
              </tr>
              <tr>
                <td><i class="fa" style="
    margin-left: 20px;"></i>원자재<br>
	<c:forEach var="mater" items="${pductlist.materiallist }">
	<span class="text-1" style="margin-left: 25px;">${mater.mat_name }</span><br>
	</c:forEach>   
   </td>
    
                <td class="text-right" style="
    word-break: keep-all;">개수 <br>
    <c:forEach var="mater" items="${pductlist.materiallist }">
    <span class="text-1">${mater.mat_cnt }</span><br>
	</c:forEach>   
   
    </td>
                <td class="text-right" style="word-break: keep-all">단위 <br>
                <c:forEach var="mater" items="${pductlist.materiallist }">
                <span class="text-1">${mater.mat_stock_size }</span><br>
                
	</c:forEach>   
                
                </td>
              </tr>
             
             
              <tr>
                <td colspan="2" class="bg-light-2 text-right"><strong>총 생산</strong></td>
                <td class="bg-light-2 text-right" style="word-break: keep-all">${pductlist.pduct_cnt }개</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
			
			
		</main>
		<!-- Footer -->
		<footer class="text-center mt-4">
			<p><strong>대덕 Inc.</strong><br>
   대전광역시 중구 대흥동 500-5 <br>
    대표자  김대덕</p>
			<div class="btn-group btn-group-sm d-print-none">
				<a href="javascript:window.print()"
					class="btn btn-light border text-black-50 shadow-none"><i
					class="fa fa-print"></i> 프린트/PDF 저장</a> <a href="#" onclick="submit(event)"
					class="btn btn-light border text-black-50 shadow-none"><i
					class="fa fa-check"></i> 의뢰 확정</a>
			</div>
		</footer>
	</div>
</body>

<script>
  

	var formorder = "${invoice}"
	

	function submit(event) {
		event.preventDefault()

		$.ajax({

			url : "${cPath }/product/confirm",
			async : false,
			data : {
				porder_no : formorder
			},
			method : "post",
			dataType : "text", // Accept,text/html , Content-Type:text/html accept와 
			success : function(resp) {
				alert(resp)
				window.opener.closeWindow();
			},
			error : function(error) {

				alert(error)
				console.log(error.status + " : " + error.responseText);
			}

		})
	}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</html>