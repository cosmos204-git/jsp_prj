<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.73/html_prj/practice/vivatemplet.css" />

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

<jsp:include page="include/vivatemplet_css.jsp"></jsp:include>
<!-- 미니 메뉴 버튼 건드리지 말것 -->


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



<title>티켓 요금</title>
<style>
    /* CSS 스타일은 JSTL 버전과 동일합니다. (레이아웃, 디자인 담당) */
    .ticket-container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 50px 20px;
        font-family: sans-serif; 
        color: #333;
    }

    .page-title { text-align: center; margin-bottom: 40px; }
    .page-title h1 { font-size: 36px; font-weight: bold; margin-bottom: 10px; }
    .page-title h3 { font-size: 20px; font-weight: normal; margin-bottom: 20px; }
    
    .title-divider {
        width: 100%;
        height: 3px;
        background-color: #ff6b00; 
        margin-bottom: 60px;
        border: none;
    }

    .ticket-cards-wrapper {
        display: flex;
        justify-content: center;
        gap: 40px; 
        flex-wrap: wrap; 
    }

    .ticket-card {
        flex: 1;
        max-width: 450px;
        min-width: 300px;
        border: 1px solid #e0e0e0;
        border-radius: 15px; 
        padding: 40px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.05); 
        background-color: #fff;
    }

    .card-title { text-align: center; font-size: 24px; font-weight: bold; margin-bottom: 40px; }

    .price-list { list-style: none; padding: 0; margin: 0; }

    .price-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 0;
        border-bottom: 1px solid #f0f0f0; 
        font-size: 18px;
    }

    .price-item:last-child { border-bottom: none; }
    .label { font-weight: 500; color: #555; }
    .price { font-weight: bold; color: #000; }

    @media (max-width: 768px) {
        .ticket-cards-wrapper { flex-direction: column; align-items: center; }
        .ticket-card { width: 100%; }
    }
</style>
</head>
<body>
<div class="wrap">
    <div id="closetop"></div>
    <div id="header">
        <jsp:include page="include/header.jsp"></jsp:include>
    </div>
    <jsp:include page="include/hamberger.jsp"></jsp:include>

    <div class="container">

		<!-- 메인 공간(비어있는 흰 배경 영역) -->
		<div class="container">
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



    <div class="ticket-container">
        <div class="page-title">
            <h1>티켓요금</h1>
            <h3>이용권</h3>
        </div>
        
        <hr class="title-divider">

        <div class="ticket-cards-wrapper">
            
            <div class="ticket-card">
                <div class="card-title">1일 이용권</div>
                <ul class="price-list">
                    <li class="price-item">
                        <span class="label">어른</span>
                        <span class="price">
                            ${dailyAdultPrice}원 
                        </span>
                    </li>
                    <li class="price-item">
                        <span class="label">청소년</span>
                        <span class="price">
                            ${dailyTeenPrice}원
                        </span>
                    </li>
                    <li class="price-item">
                        <span class="label">어린이</span>
                        <span class="price">
                            ${dailyChildPrice}원
                        </span>
                    </li>
                </ul>
            </div>

            <div class="ticket-card">
                <div class="card-title">연간 이용권</div>
                <ul class="price-list">
                    <li class="price-item">
                        <span class="label">어른</span>
                        <span class="price">
                            ${annualAdultPrice}원
                        </span>
                    </li>
                    <li class="price-item">
                        <span class="label">청소년</span>
                        <span class="price">
                            ${annualTeenPrice}원
                        </span>
                    </li>
                    <li class="price-item">
                        <span class="label">어린이</span>
                        <span class="price">
                            ${annualChildPrice}원
                        </span>
                    </li>
                </ul>
            </div>

        </div>
    </div>

	<div id="footer">
			<div class="footer-inner">

				<div class="footer-top">
					<img
						src="http://192.168.10.73/html_prj/practice/images/vivaLog.png"
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

</div>
</div>
</body>
</html>