<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="로그인을 사용하여 회원의 스케줄 리스트를 제공"%>
<!-- 다른 JSP에 구현된 기능을 사용하는 페이지 -->
<%@ include file="include_b.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../fragments/loginChk.jsp" %>

<%@ include file="../fragments/siteProperty.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= sessionId %>님 안녕하세요?</title>
<!--  내가 만든 CSS  -->
<link rel="shortcut icon" href="http://192.168.10.79/jsp_prj/common/images/favicon.ico">  
<link rel="stylesheet" type="text/css" href="http://192.168.10.79/jsp_prj/common/css/main_v251031-2.css"/>

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
	alert("<%= msg %>");
	
});//ready

</script>

</head>
<body>

<div id="wrap">
	<!-- 사이트 로고, 주력서비스,  네비게이션 바   -->  
	<div id="header"> </div>
	<div id="container">
	<!-- 다른 JSP의 구현된 기능을 사용하는 페이지 -->
	<a href="mimeType.jsp">줘!</a><br>
	다른 JSP의 구현된 기능을 사용하는 페이지
	
	</div>
	<div><%= msg %></div>
	<div id="footer"></div>

</div>

</body>
</html>    