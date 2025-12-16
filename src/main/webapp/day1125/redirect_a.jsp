<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="정상적인 응답페이지-비정상적인 요청이 발생할 수도 있다." %>


<!DOCTYPE html>
<html>
<head>

<%
session.setAttribute("name","박진규");
if(new Random().nextBoolean() ){ //로그인 안된 경우. (세션이 존재하지 않는 경우)
	//비정상적인 요청이 발생한 경우
	%>
	<!--  5초 이후 이동하라. -->
	<meta http-equiv="refresh" content="5;redirect_b.jsp">
	
	<!--  <script type="text/javascript">
	location.href="redirect_b.jsp";
	</script> -->
	<%
	response.sendRedirect("redirect_b.jsp");
	return; //문제가 발생했을 때 아랫줄을 실행하지 못하도록 막아서 이동
}// end if
%>

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

	정상적인 응답<br>
	<img src="images/redirect.png" title="M탈모 리다이렉트의 시작입니다.">
	
	
	</div>
	</div>
	<div id="footer"></div>

</div>

</body>
</html>    