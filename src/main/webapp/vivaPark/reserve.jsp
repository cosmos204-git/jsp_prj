<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String tabParam = request.getParameter("tab");
    if(tabParam == null || tabParam.trim().length() == 0){
        tabParam = "daily"; // 기본 탭: 1일 이용권
    }
    pageContext.setAttribute("currentTab", tabParam);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>

<script src="https://www.gjw.co.kr/inc/gjw_2024/js/14jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css?ver=1763706557">
<link rel="stylesheet" href="https://www.gjw.co.kr/css/gjw_2024/reset.css?ver=1763706557">
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/css/gjw_2024/sub.css?ver=1763706557">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>



<style>
    .reserve-container {
        width: 100%;
        max-width: 800px;
        margin: 0 auto;
        padding: 0px 20px;
        font-family: sans-serif;
        color: #333;
    }
    .info-bar {
        background-color: #f8f8f8;
        padding: 15px;
        border-radius: 10px;
        margin-bottom: 30px;
        display: flex;
        justify-content: space-around;
        align-items: center;
        font-size: 14px;
        color: #555;
    }
    .info-item {
        display: flex;
        align-items: center;
    }
    .info-item .icon {
        margin-right: 8px;
        color: #888;
    }
    .date-selector input[type="date"] {
        border: none;
        background: transparent;
        padding: 0 5px;
        font-size: 14px;
        color: #333;
        cursor: pointer;
        font-weight: bold;
    }
    #displayDay {
        font-weight: bold;
    }
    .tab-buttons {
        margin-bottom: 20px;
        display: flex;
        gap: 10px;
    }
    .tab-img {
        cursor: pointer;
        height: 40px;
        width: auto;
        transition: transform 0.1s;
    }
    .tab-img:hover {
        transform: scale(1.02);
    }
    .discount-card {
        border: 1px solid #eee;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        display: flex;
        align-items: center;
        position: relative;
        background-color: #fff;
        transition: border 0.2s, background-color 0.2s;
        cursor: pointer;
    }
    .discount-card.active {
        border: 2px solid #9966ff;
        background-color: #fbf8ff;
    }
    .card-logo {
        flex-shrink: 0;
        width: 80px;
        text-align: center;
        margin-right: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .logo-img {
        max-width: 100%;
        max-height: 50px;
        object-fit: contain;
    }
    .card-content {
        flex-grow: 1;
    }
    .card-content h6 {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 5px;
    }
    .card-content p {
        font-size: 14px;
        color: #777;
        line-height: 1.4;
    }
    .badge {
        position: absolute;
        top: 10px;
        right: 130px;
        background-color: #e6e6ff;
        color: #6600cc;
        padding: 3px 8px;
        border-radius: 5px;
        font-size: 12px;
        font-weight: bold;
    }
    .card-actions {
        flex-shrink: 0;
        text-align: right;
        margin-left: 20px;
    }
    .card-actions .price {
        font-size: 20px;
        font-weight: bold;
        color: #ff6b00;
        margin-bottom: 10px;
    }
    .card-actions button {
        border: none;
        padding: 5px 12px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 13px;
        margin-top: 5px;
    }
    .card-actions .detail-btn {
        background-color: #fff;
        border: 1px solid #ccc;
        color: #555;
    }
    .card-actions .reserve-btn {
        background-color: #fff;
        border: 1px solid #9966ff;
        color: #9966ff;
    }
    .subWrap { padding: 0; }
    #inner { width: 70%; margin: 0px auto }
    #title { background-color: #00FF00; height: 120px; font-size: 60px; text-align: center; padding: 20px; }
    #miniMenu, .miniMenuSub { display: flex; }
    #miniMenu, .miniMenuSub, .nav-link-mini { font-family: 'NotoSansKR', sans-serif !important; text-decoration: none !important; color: gray; }
    .container { height: auto; margin-top: 100px; }
    .nav-link:hover { color: gray; }
    .nav-item.dropdown { margin-left: 10px; }
    #miniHome { height: 30px; }
    .nav-item { list-style: none; }
    
    
</style>
<jsp:include page="include/vivatemplet_css.jsp"></jsp:include>

<script>
    function changeTab(tabName) {
        location.href = "?tab=" + tabName;
    }

    $(document).ready(function() {
        $(".discount-card").click(function() {
            $(".discount-card").removeClass("active");
            $(this).addClass("active");
        });
    });
</script>

</head>
<body>
<div class="wrap">
    <div id="closetop"></div>
    <div id="header">
        <jsp:include page="include/header.jsp"></jsp:include>
    </div>
    <jsp:include page="include/hamberger.jsp"></jsp:include>

    <div class="container">

    <div class="reserve-container">
        <jsp:include page="include/page_navi.jsp"></jsp:include>

        <div class="info-bar">
            <div class="info-item date-selector">
                <span class="icon">📅</span>
                <span>방문 예정일</span>
                <input type="date" id="visitDateInput" value="${rawDateValue}" onchange="updateDayAndFormat(this.value)">
                <span id="displayDay">(${visitDay})</span>
            </div>
            <div class="info-item">
                <span class="icon">⏱️</span>
                <span>운영 시간: <strong>${operationTime}</strong></span>
            </div>
        </div>
    </div>

    <div class="reserve-container">

        <!-- 탭 버튼 -->
        <div class="tab-buttons">
            <img 
                src="./images/ticket_daily_${currentTab eq 'daily' ? 'on' : 'off'}.png" 
                alt="1일 이용권" 
                class="tab-img"
                onclick="changeTab('daily')"
            >
            <img 
                src="./images/ticket_annual_${currentTab eq 'annual' ? 'on' : 'off'}.png" 
                alt="연간 이용권" 
                class="tab-img"
                onclick="changeTab('annual')"
            >
        </div>

        <!-- 비씨카드 -->
        <div class="discount-card ${currentTab eq 'daily' ? 'active' : ''}">
            <div class="card-logo">
                <img src="./images/bc_logo.png" alt="비씨카드" class="logo-img"> 
            </div>
            <div class="card-content">
                <c:choose>
                    <c:when test="${currentTab eq 'daily'}">
                        <h6>[1Day] 비씨카드</h6>
                        <p>본인 52% + 동반 1인 30% 할인, 비씨카드 제휴 실적 충족 회원. 본인 포함 30% 할인 (최대 10명).</p>
                    </c:when>
                    <c:otherwise>
                        <h6>[연간] 비씨카드</h6>
                        <p>연간 이용권 구매 시 비씨카드로 결제하면 연간권 결제 금액의 20% 상시 할인 혜택이 제공됩니다.</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:choose>
                <c:when test="${currentTab eq 'daily'}">
                    <span class="badge">1일 이용권 프로모션</span>
                </c:when>
                <c:otherwise>
                    <span class="badge">연간 회원권 프로모션</span>
                </c:otherwise>
            </c:choose>
            
            <div class="card-actions">
                <div class="price">
                    <c:choose>
                        <c:when test="${currentTab eq 'daily'}">
                            1인 <strong>30,500원</strong>~
                        </c:when>
                        <c:otherwise>
                            1인 <strong>???원</strong>~
                        </c:otherwise>
                    </c:choose>
                </div>
                <button class="detail-btn">상세보기</button>
		        <!-- 여기: 비씨카드 예매하기 -->
		        <button class="reserve-btn"
		                onclick="location.href='reserveProcess.jsp?ticketType=${currentTab}'">
		            예매하기
		        </button>
        </div>
        </div>
        
        <!-- 삼성카드 -->
        <div class="discount-card ${currentTab eq 'daily' ? '' : ''}">
            <div class="card-logo">
                <img src="./images/samsung_logo.png" alt="삼성카드" class="logo-img">
            </div>
            <div class="card-content">
                <c:choose>
                    <c:when test="${currentTab eq 'daily'}">
                        <h6>[1Day] 삼성카드</h6>
                        <p>본인 52% + 동반 1인 30% 할인, 삼성카드 제휴 실적 충족 회원. 본인 포함 30% 할인 (최대 10명).</p>
                    </c:when>
                    <c:otherwise>
                        <h6>[연간] 삼성카드</h6>
                        <p>연간 이용권 구매 시 삼성카드로 결제하면 연간권 금액의 25%를 특별 할인받을 수 있습니다.</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:choose>
                <c:when test="${currentTab eq 'daily'}">
                    <span class="badge">1일 이용권 스페셜</span>
                </c:when>
                <c:otherwise>
                    <span class="badge">연간 회원권 스페셜</span>
                </c:otherwise>
            </c:choose>

            <div class="card-actions">
                <div class="price">
                    <c:choose>
                        <c:when test="${currentTab eq 'daily'}">
                            1인 <strong>30,500원</strong>~
                        </c:when>
                        <c:otherwise>
                            1인 <strong>???원</strong>~
                        </c:otherwise>
                    </c:choose>
                </div>
                <button class="detail-btn">상세보기</button>
		       <!-- 여기: 삼성카드 예매하기 -->
		        <button class="reserve-btn"
		                onclick="location.href='reserveProcess.jsp?ticketType=${currentTab}'">
		            예매하기
		        </button>
            </div>
        </div>

        <!-- 일반 신용카드 (할인 없음) -->
        <div class="discount-card">
            <div class="card-logo">
                <span>일반 신용 카드</span>
            </div>
            <div class="card-content">
                <c:choose>
                    <c:when test="${currentTab eq 'daily'}">
                        <h6>[1Day] 일반 신용 카드</h6>
                        <p>할인 없이 정상가로 결제 가능합니다. 모든 신용카드/체크카드 사용 가능.</p>
                    </c:when>
                    <c:otherwise>
                        <h6>[연간] 일반 신용 카드</h6>
                        <p>할인 없이 연간 이용권 정상가로 결제 가능합니다. 모든 신용카드/체크카드 사용 가능.</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="card-actions">
                <div class="price">
                    <c:choose>
                        <c:when test="${currentTab eq 'daily'}">
                            1인 <strong>64,000원</strong>~
                        </c:when>
                        <c:otherwise>
                            1인 <strong>???원</strong>~
                        </c:otherwise>
                    </c:choose>
                </div>
                <button class="detail-btn">상세보기</button>
		        <!-- 여기: 일반카드 예매하기 -->
		        <button class="reserve-btn"
		                onclick="location.href='reserveProcess.jsp?ticketType=${currentTab}'">
		            예매하기
		        </button>
            </div>
        </div>

    </div>
	</div>
    <div id="footer">
        <jsp:include page="include/footer.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
