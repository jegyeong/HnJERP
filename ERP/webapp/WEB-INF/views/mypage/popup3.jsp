<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- jQuery -->
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<meta charset="UTF-8">
<style type="text/css">
	#aTag {color:black; text-decoration: none;}
	#aTag a.visited{color:black; text-decoration: none;}
	#aTag a.hover{color:black; text-decoration: none;}
</style>

</head>
<body>
	<div>
		<img src="${cPath}/resources/img/korona.png" style="width: 100%; height: 90%;">
	</div>
	<!-- popup -->
	<form name=pop>
		<p align="center"><br>
		<a href="javascript:history.onclick=closeWin()" id="aTag">
			<input type=checkbox name="Notice3" value="" id="chkBox">
			<span id="text">다음부터 공지창 띄우지 않음</span> &nbsp;|&nbsp;[닫기]</a>
	</form>
</body>
<script type="text/javascript">

$("#text").on("click",function(){
	$("#chkBox").prop("checked",true);
	$("#aTag").click();
});

function setCookie( name, value, expiredays )
{
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function closeWin()
{
	if ( document.pop.Notice3.checked )
	setCookie( "Notice3", "done" , 1);//1은 하루동안 새창을 열지 않게 합니다.
	self.close();
}

</script>
</html>
