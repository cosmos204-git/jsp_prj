<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//POST 방식 일때의 한글 처리 ( GET 방식에는 영향을 주지 않는다. payload 부분에만 적용 )
request.setCharacterEncoding("UTF-8");
%>

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

	<strong><%= request.getMethod() %></strong> 방식 요청 <br>
	<%
	// web parameter의 이름이 같다면 배열로 처리된다.
	String[] lang=request.getParameterValues("language");
	//Form Control이 하나 일지라도 getParameterValues로 받을 수 있다.
	String[] license=request.getParameterValues("license");
	%>
	<strong>선택 언어</strong>
	<%
	// try{
	if ( lang!= null) {
	for(int i=0; i< lang.length; i++) {
		%>
		<%= lang[i] %>
		<%
	} //end for
	}else{
	//} catch(NullPointerException npe) {
	%>관심언어가 없습니다. <%
	//} // end catch
	} // end else
	%>
	
	<br>
	<strong>자격증 </strong>
	<%
	//자격증이 없습니다. : 정처기, SQLD, 리눅스마스터
	if (license.length==1 && license[0].trim().isEmpty()) {
	%> 자격증이 없습니다. <%	
	}//end if
	for(int i=0; i<license.length; i++ ){
	%>	
	<%= license[i] %>
	<%
	}
	%>
	</div>
	</div>
	<div id="footer"></div>

</div>

</body>
</html>    