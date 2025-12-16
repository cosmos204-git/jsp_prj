<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<style>
.subWrap {
	padding: 0;
}

<!-- 미니 메뉴 버튼 건드리지 말것 -->
#inner {
	width: 70%;
	margin: 0px auto
}

#title {
	background-color: #00FF00;
	height: 120px;
	font-size: 60px;
	text-align: center;
	padding: 20px;
}

#miniMenu, .miniMenuSub {
	display: flex;
}
#miniMenu, .miniMenuSub, .nav-link-mini {
	font-family: 'NotoSansKR', sans-serif !important;
	text-decoration: none !important;
	color: gray;
}

.container {
	height: auto;
	margin-top: 100px;
}

.nav-link:hover {
	color: gray;
}

.nav-item.dropdown {
	margin-left: 10px;
}

#miniHome {
	height: 30px;
}

.nav-item {
	list-style: none;
}
</style>
	
<style>
.subWrap {
	padding: 0;
}

.container {
	margin-top: 100px;
	overflow: hidden;
}

</style>	
	
	
			<!-- 미니 메뉴바 시작 -->
			<div id="inner">
				<!-- 페이지 상단 여백 -->
				<div style="height: 50px"></div>
				<!-- 미니 버튼 -->
				<div id="miniMenu" style="margin: 0px auto; height: 30px">
					<div>
						<a href="#void"><img
							src="http://192.168.10.72/html_prj/common/images/minihome.png"
							id="miniHome"></a> |&nbsp;
					</div>
					<div class="miniMenuSub">
						<ul style="display:flex">
						<li class="nav-item dropdown"><a
							class="nav-link-mini dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"
							style="font-weight: normal;"> 이용정보 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">즐길거리</a></li>
								<li><a class="dropdown-item" href="#">행사</a></li>
								<li><a class="dropdown-item" href="#">요금/예매</a></li>
								<li><a class="dropdown-item" href="#">소통서비스</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link-mini dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> <span
								style="font-weight: bold; color: black">티켓/요금</span>
						</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">오시는길</a></li>
								<li><a class="dropdown-item" href="#">파크 이용 안내</a></li>
							</ul></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 미니 메뉴바 끝 -->
