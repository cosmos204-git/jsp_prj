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
	$("#btn").click(function(){
		chkNull();
	});
	
	$("#name").keydown(function( evt ){
		//엔터가 눌려졌을 때만 null 유효성 검증
		if( evt.which==13 ){
			chkNull();
		}//end if
	}); //keydown
	
	
});//ready


function chkNull(){
	var name=$("#name").val();
	if( name.replace(/ /g,"")==""){
		alert("이름은 필수 입력!!");
		$("#name").focus();
		return;
	}//end if
	$("#frm").submit();
}//chkNull



</script>

</head>
<body>
<%@ page session="false" %>
<%-- <%=session %>  --%>

<% // session="false" 이면 세션 객체를 얻어서 사용할 수 있다. %>
<% HttpSession session=request.getSession(); %>
<%=session %>

	<form name="frm" id="frm" action="request_b.jsp">
	<label for="name">이름</label>
	<input type="text" name="name" id="name"/>
	<input type="text" style="display:none"/>
	<input type="button" value="입력" id="btn" class="btn btn-info"/>
	</form>
	
	<div>
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.1343016256246!2d127.05059697648413!3d37.50475047205478!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca1c32408f9b7%3A0x4e3761a4f356d1eb!2z7IyN7Jqp6rWQ7Jyh7IS87YSw!5e0!3m2!1sko!2skr!4v1764141438936!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	
	</div>
	
</body>
</html>    