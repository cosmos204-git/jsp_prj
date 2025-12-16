<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="비정상적인 사용자에게 제공할 내용을 가진 페이지"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  내가 만든 CSS  -->
<link rel="shortcut icon" href="http://192.168.10.79/html_prj/common/images/favicon.ico">  
<link rel="stylesheet" type="text/css" href="http://192.168.10.79/html_prj/common/css/main_v251031-2.css"/>

<!--  bootstrap CDN  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!--  bootstrap CDN  --> 

<style type="text/css">
#wrap { margin: 100px auto; width: 900px; height: 1000px; }
#header { height: 150px;  }
#container{ height: 700px; }
#footer{ height: 150px; }
</style>

<!-- jQuery CDN 시작  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){

	
});//ready

</script>

</head>
<body>

<div id="wrap">
	<!-- 사이트 로고, 주력서비스,  네비게이션 바   -->  
	<div id="header"> </div>
	<div id="container">
	<div>

	세션값: <%= session.getAttribute("name") %>
	<a href="../login/login.html">로그인 하러 가기</a>
	
	</div>
	</div>
	<div id="footer"></div>

</div>

</body>
</html>    