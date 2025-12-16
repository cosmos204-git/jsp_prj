<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<!-- 내장 객체는 scriptlet이나 expression에서 사용가능 하다. -->

<div id="wrap">
	<!-- 사이트 로고, 주력서비스,  네비게이션 바   -->  
	<div id="header"> </div>
	<div id="container">
	<div>
	<strong>요청 정보</strong>
	<ul>
	<li>요청방식: <%= request.getMethod() %></li>
	<li>요청URL: <%= request.getRequestURL() %></li>
	<li>요청URI: <%= request.getRequestURI() %></li>
	<li>요청QueryString: <%= request.getQueryString() %></li>
	<li>요청프로토콜: <%= request.getProtocol() %></li>
	<li>요청서버명: <%= request.getServerName() %></li>
	<li>요청서버포트: <%= request.getServerPort() %></li>
	<li>요청파라메터값: <%= request.getParameter("nick") %></li>
	<li>요청파라메터값: <%= request.getParameter("age") %></li>
	<li>
	파라메터명이 같음. (웹은 이름이 같으면 배열) <br>
	<%
	String[] ageArr=request.getParameterValues("age");
	if ( ageArr != null ){
		for (int i=0; i< ageArr.length ;i++ ){
			out.print( ageArr[i] );
			out.print( " ");
		} //end for 
	}//end if
	%>
	</li>
	 <li>접속자 ip address: <%= request.getRemoteAddr() %></li>
	 <li>접속자 port: <%= request.getRemotePort() %></li>
	 <li>

	 <%
	 Enumeration<String> en=request.getHeaderNames();
	 String headerName="";
	 String value="";
	 while(en.hasMoreElements()){
		 headerName=en.nextElement();
	 %>
	 이름 : <%=headerName %>, 값 : <%=request.getHeader(headerName) %><br> 
	 <%
	 }//end while
	 %>	 
	 </li>
	</ul>
	
	</div>
	
	<div>
	<a href="useRequest.jsp?nick=min&age=20"></a><br>
	<!-- form 태그에 action 속성을 사용하지 않으면 기본적으로 자신 페이지를 요청한다. -->
	<form method="get" action="useRequest.jsp" enctype="mulipart/form-data">
	<input type="hidden" name="nick" value="lee"/>
	<input type="hidden" name="age" value="21"/>
	<input type="hidden" name="age" value="23"/>
	<button>요청</button>
	</form>
	<!-- POST 방식에는 QueryString이 존재하지 않는다. -->
	<form method="post" action="useRequest.jsp" enctype="mulipart/form-data">
	<input type="hidden" name="nick" value="park"/>
	<input type="hidden" name="age" value="22"/>
	<input type="hidden" name="age" value="24"/>
	<button>요청</button>
	</form>
	
	</div>
	
	</div>
	<div id="footer"></div>

</div>

</body>
</html>    