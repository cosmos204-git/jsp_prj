<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%
//악의적인 목적의 사용자
String[] blockIp={"192.168.10.76",
		"192.168.10.78","192.168.10.96",
		"192.168.10.85","192.168.10.83",
		"192.168.10.73","192.168.10.90"};

String ip=request.getRemoteAddr(); //접속자의 ip

boolean blockFlag=false;

for(int i=0; i< blockIp.length; i++){
	if( blockFlag= ip.equals(blockIp[i])){
		break;
	}//end if
}//end if

if (blockFlag){
	response.sendRedirect("https://www.police.go.kr/index.do");
	return;
}


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

	정상적인 사용자
	
	
	</div>
	</div>
	<div id="footer"></div>

</div>

</body>
</html>    