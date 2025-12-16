<%@page import="day1216.ApiExplorer"%>
<%@page import="day1216.RssDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../fragments/siteProperty.jsp" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>RSS Parsing</title>
<link rel="shortcut icon" href="http://192.168.10.79/jsp_prj/common/images/favicon.ico">

<script src="http://192.168.10.79/jsp_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.79/jsp_prj/common/css/carousel.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: #0000001a;
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em #0000001a, inset 0 .125em .5em #00000026
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh
}

.bi {
	vertical-align: -.125em;
	fill: currentColor
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8
}

.bd-mode-toggle {
	z-index: 1500
}

.bd-mode-toggle .bi {
	width: 1em;
	height: 1em
}

.bd-mode-toggle .dropdown-menu .active .bi {
	display: block !important
}
</style>
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	
});//ready

function requestRss( url, title ) {
	if ( confirm(title+" 기사를 보시겠습니까?")) {
		$.ajax({
			url: url+".xml",
			type:"GET",
			dataType: "XML",
			error: function( xhr ){
				alert(title+" 기사를 가져올 수 없습니다.");
				console.log( xhr.status );
			},
			success: function( xmlDoc ){
				alert( xmlDoc );
				var output="";
				
				output+="<h2>"+title+"</h2>";
			
				var itemNodes=$(xmlDoc).find("item");
				output+="기사 : <strong> " + itemNodes.length +"</strong>건<br>";
				
				
				var itemTitle="";
				var description="";

				$.each( itemNodes, function(ind, itemNode) {
					itemTitle=$(itemNode).find("title").text();
					if(itemTitle.length > 40 ){
						itemTitle.length=itemTitle.substring(0,40)+"...";
					}//end if
					
					description=$(itemNode).find("description").text();
					if(description.length > 100) {
						description=description.substring(0,99)+"...";
					}//end if
					
					output+="<div>";
					output+="<table class='table table-hover'>";
					output+="<tr><th>제목<th><td><a href='"+
					$(itemNode).find("link").text()
					+"' title='뉴스 읽기' target='blank'>"+ 
					itemTitle
					+"</a></td><th>작성일</th><td>"+
					$(itemNode).find("pubDate").text()
					+"</td></tr><tr><th>설명</th><td colspan='4'>"+
					description
					+"</td></tr>";
					
					output+="</table>";
					output+="</div>";
					
				});
				
				
				$("#output").html(output);
			}
			
		}); //ajax
		
	}//end if
}//end if


</script>




</head>
<body>
	<header data-bs-theme="dark">
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">메인</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
						<li class="nav-item"><a class="nav-link disabled"
							aria-disabled="true">Disabled</a></li>
					</ul>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<main>
		<div id="myCarousel" class="carousel slide mb-6"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<svg aria-hidden="true" class="bd-placeholder-img " height="100%"
						preserveAspectRatio="xMidYMid slice" width="100%"
						xmlns="http://www.w3.org/2000/svg">
						<rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
					<div class="container">
						<div class="carousel-caption text-start">
							<h1>Example headline.</h1>
							<p class="opacity-75">Some representative placeholder content
								for the first slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg aria-hidden="true" class="bd-placeholder-img " height="100%"
						preserveAspectRatio="xMidYMid slice" width="100%"
						xmlns="http://www.w3.org/2000/svg">
						<rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
					<div class="container">
						<div class="carousel-caption">
							<h1>Another example headline.</h1>
							<p>Some representative placeholder content for the second
								slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg aria-hidden="true" class="bd-placeholder-img " height="100%"
						preserveAspectRatio="xMidYMid slice" width="100%"
						xmlns="http://www.w3.org/2000/svg">
						<rect width="100%" height="100%" fill="var(--bs-secondary-color)"></rect></svg>
					<div class="container">
						<div class="carousel-caption text-end">
							<h1>One more for good measure.</h1>
							<p>Some representative placeholder content for the third
								slide of this carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Browse gallery</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- Three columns of text below the carousel -->
			<!-- /.row -->
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
			
			<%
			List<RssDTO> list=new ArrayList<RssDTO>();
			list.add(new RssDTO("newsflesh","속보","newsflesh"));							
			list.add(new RssDTO("issue","이슈 Top10","issue"));							
			list.add(new RssDTO("section/politics","정치","politics"));							
			list.add(new RssDTO("section/economy","경제","economy"));							
			list.add(new RssDTO("section/society","사회","society"));							
			list.add(new RssDTO("section/international","국제","international"));							
			list.add(new RssDTO("section/culture","문화","culture"));							
			list.add(new RssDTO("section/entertainment","연예","entertainment"));							
			list.add(new RssDTO("section/sports","스포츠","sports"));							
			list.add(new RssDTO("section/weather","날씨","weather"));

			ApiExplorer ae=new ApiExplorer();
			
			//CORS 이슈로 인하여 RSS를 java에서 읽어 들여 XML File로 생성
			for(RssDTO rDTO : list){
				ae.createRss(rDTO.getUrl(), rDTO.getEngTitle());
			}
			
			pageContext.setAttribute("rssList", list);
			
			%>

			<table class="table table-hover">
			<tr>
			<c:forEach var="news" items="${rssList}">
			<td><a href="javascript:requestRss('${CommonURL}/day1216/${news.engTitle}','${news.engTitle}')"><c:out value="${news.title}"/></a>
			</c:forEach>
			</tr>
			</table>

			<div id="output"></div>
			
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<p class="float-end">
				<a href="#">위로</a>
			</p>
			<p>
				&copy; SIST class2. &middot; <a href="#">개인정보호정책</a>
				&middot; 개인정보관리 책임자 님이셈
			</p>
		</footer>
	</main>
	
</body>
</html>