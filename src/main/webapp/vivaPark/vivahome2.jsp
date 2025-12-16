<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>

<!-- 공지 가져오기 -->
<!-- 2024 경주월드 -->
<script src="https://www.gjw.co.kr/inc/gjw_2024/js/14jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.js?ver=1763706557">
<link rel="stylesheet"
	href="https://www.gjw.co.kr/css/gjw_2024/reset.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/css/gjw_2024/sub.css?ver=1763706557">
<style>
.subWrap {
	padding: 0;
}
</style>

<link rel="stylesheet" type="text/css"
   href="http://192.168.10.73/html_prj/practice/vivatemplet.css" />
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
</style>
<script type="text/javascript">
	$(function() {
		
		
		$("#mainMenu>li").mouseover(function() {
			$(".opensubMenu").slideDown(200);
			$("#subBar").slideDown(200);
			$(".subItems").slideDown(200);
		});

		$(".container").mouseover(function() {

			$(".opensubMenu").slideUp(200);
			$("#subBar").slideUp(200);
			$(".subItems").slideUp(200);
		});
		$(".header-btns").mouseover(function() {

			$(".subItems").slideUp(200);
			$(".opensubMenu").slideUp(200);
			$("#subBar").slideUp(200);
		});
		$(".close").mouseover(function() {

			$(".subItems").slideUp(200);
			$(".opensubMenu").slideUp(200);
			$("#subBar").slideUp(200);
		});

		$('.hamburger-toggle').on('click', function() {
			// 햄버거 버튼 클릭 시 메뉴 목록에 'is-open' 클래스를 토글합니다.
			$('.hamburger-list').toggleClass('is-open');
			$('.container').toggleClass('isClose');
			// 아이콘 모양을 바꾸려면 버튼에도 클래스를 토글할 수 있습니다.
			$(this).toggleClass('active');
			
		});
	});
</script>
</head>
<body>
<div class="wrap">
	<!-- 헤더 -->
	<div class="close" style="width:100%; position:fixed;top:0;left:0; height : 10px;"></div>
	<div id="header" >
	<div class="close"></div>
		<div id="mainBar">
			<div class="logo">
				<img src="http://192.168.10.73/html_prj/practice/images/vivaLog.png"
					alt="VIVA PARK Logo" id="logImg" />
			</div>
			<button class="hamburger-toggle" style="background-color:#fff; border : 0px;"><img src="http://192.168.10.73/html_prj/practice/images/hamburger_menu.png"/></button>
			<div id="nav">
				<ul id="mainMenu" class="">
					<li>
						<div class="liDiv">
							즐길거리
							<div class="subItems">
								<ul>
									<li><a href="#void">어트랙션</a></li>
									<li><a href="#void">푸드코트</a></li>
									<li><a href="#void">기프트샵</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="liDiv">
							행사
							<div class="subItems">
								<ul>
									<li><a href="#void">공연</a></li>
									<li><a href="#void">퍼레이드</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="liDiv">
							요금/예매
							<div class="subItems">
								<ul>
									<li><a href="ticketPrice.jsp">티켓 요금</a></li>
									<li><a href="reserve.jsp">할인/예매</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="liDiv">
							이용정보
							<div class="subItems">
								<ul>
									<li><a href="#void">오시는 길</a></li>
									<li><a href="#void">영업 시간</a></li>
									<li><a href="#void">파크 이용 안내</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="liDiv">
							소통 서비스
							<div class="subItems">
								<ul>
									<li><a href="#void">공지</a></li>
									<li><a href="#void">FAQ</a></li>
									<li><a href="#void">문의</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>

			<div class="header-btns">
				<button class="btn" style="color: #FF6124; border: 1.5px solid #FF6124; ">예약하기</button>
				<button class="btn" style="color: #000; border: 1.5px solid #000;">로그인</button>
			</div>
		</div>
		<div id=subBar>
		<div class="close"></div>
		<div class="close" style="position:fixed; top:100px; right: 0px; height:200px;"></div>
		</div>
		<div class="close"></div>
		<hr style="margin:0px !important">
	</div>
			<!-- 햄버거 메뉴 시작 -->
			<div class="hamburger-list">

				<div class="login-box">
					<span >로그인해 주세요</span> <span>〉</span>
				</div>

				<div class="reservation-box">
					<div>예매하기</div>
					<div>|</div>
					<div>티켓등록</div>
				</div>

				<div class="menu-section">
					<div class="menu-title">즐길거리</div>
					<div class="menu-list">
						<div>
							<a href="#void">어트랙션</a><br><a href="#void">푸드코트</a>
						</div>
						<div style="margin-right : 100px">
							 <a href="#void">기프트샵</a>
						</div>
					</div>

					<div class="menu-title">행사</div>
					<div class="menu-list">
						<div>
							<a href="#void">공연</a>
						</div>
						<div style="margin-right : 100px">
						 	<a href="#void">퍼레이드</a>
						 </div>
					</div>

					<div class="menu-title">요금/예매</div>
					<div class="menu-list">
						<div>
							<a href="#void">티켓 요금</a><br>
							
						</div>
						<div style="margin-right : 100px">
							<a href="#void">할인/예매</a>
						</div>
					</div>

					<div class="menu-title">이용정보</div>
					<div class="menu-list">
						<div>
							<a href="#void">오시는 길</a><br><a href="#void">영업 시간</a> 
						</div>
						<div style="margin-right : 100px">
							<a href="#void">파크 이용안내</a>
						</div>
					</div>
					
					<div class="menu-title">소통 서비스</div>
					<div class="menu-list">
						<div>
							<a href="#void">공지</a><br><a href="#void">FAQ</a> 
						</div>
						<div style="margin-right : 100px">
							<a href="#void">문의</a>
						</div>
					</div>

				</div>
			</div>
			<!-- 햄버거 메뉴 끝 -->

	<!-- 메인 공간(비어있는 흰 배경 영역) -->
	<div class="container">
				
	</div>
	<!-- container 끝 -->

	<!-- 푸터 -->
	<div id="footer"  >
		<div class="footer-inner">

			<div class="footer-top">
				<img src="http://192.168.10.73/html_prj/practice/images/vivaLog.png"
					alt="VIVA PARK Logo" style="height: 50px;" />

				<div class="footer-menu">
					<span>비바파크 어트랙션 소개</span> <span>비바파크 소개</span> <span>ESG</span> <span>이용약관</span>
					<span style="color: #6A35FF">개인정보처리방침</span> <span>영상정보처리기기
						운영/관리방침</span> <span>이메일무단수집거부</span> <span>채용안내</span> <span>사업문의</span>
					<span>언제사용</span> <span>사이트맵</span>
				</div>
			</div>

			<div class="footer-bottom">
				비바파크 어트랙션<br> 사업장소재지: 충남 아산시 송악면 외암로 200 비바파크 아산랜드 | 대표자: 박정호<br>
				사업자등록번호: 219-85-00014 | 통신판매업신고번호: 아산 제 1532호 | 전화: 1605-2000
			</div>

			<div class="footer-icons"></div>

		</div>
	</div>
</div>
</body>
</html>
