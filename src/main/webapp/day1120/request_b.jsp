<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.getColor{ color: #0000FF }
.postColor{ color: #FF0000 }
</style>


<title>Insert title here</title>
</head>
<body>

<%
String requestColorCss="getColor";
if("POST".equals(request.getMethod())){
	requestColorCss="postColor";
}
%>
<strong><span class="<%= requestColorCss %>"><%=request.getMethod() %></span></strong>
<br>

<div id="wrap">
	<!-- 사이트 로고, 주력서비스,  네비게이션 바   -->  
	<div id="header"> </div>
	<div id="container">
	<div>

	<strong><%= request.getMethod() %></strong> 방식의 요청
	<br>
	<a href="javascript:history.back();">뒤로</a>
	</div>
		
	</div>
	<div id="footer"></div>

</div>

</body>
</html>    