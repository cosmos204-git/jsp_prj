<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");
%>

<%
    String ticketType = request.getParameter("ticketType"); // daily or annual
    if(ticketType == null || ticketType.trim().length() == 0){
        ticketType = "daily";
    }
    pageContext.setAttribute("ticketType", ticketType);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VIVA PARK - 예매</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
      href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    body {
        margin: 0;
        font-family: sans-serif;
        background-color: #f5f5f5;
    }
    /* 상단 전체를 덮는 어두운 영역 */
    .overlay-area {
        background-color: #2a2a2a;
        color: #000;
        min-height: 400px;
        padding-top: 40px;
    }
    /* 흰색 박스 (수량 선택 영역) */
    .reserve-box {
        max-width: 900px;
        margin: 0 auto 60px auto;
        background-color: #fff;
        border-radius: 10px 10px 0 0;
        padding: 30px 40px 40px 40px;
        box-shadow: 0 0 15px rgba(0,0,0,0.2);
    }
    .ticket-title {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 25px;
    }
    .person-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 15px 0;
        border-bottom: 1px solid #eee;
    }
    .person-label {
        width: 100px;
        font-size: 16px;
        font-weight: 600;
    }
    .qty-control {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .qty-btn {
        width: 32px;
        height: 32px;
        border-radius: 16px;
        border: 1px solid #ddd;
        background-color: #fff;
        cursor: pointer;
        font-size: 18px;
        line-height: 30px;
        text-align: center;
    }
    .qty-input {
        width: 50px;
        text-align: center;
        border: none;
        background-color: #f7f7f7;
        padding: 6px 0;
        border-radius: 6px;
    }
    .price-col {
        text-align: right;
        width: 200px;
        font-size: 15px;
    }
    .price-col del {
        color: #aaa;
        margin-right: 10px;
    }
    .price-col strong {
        font-weight: 700;
    }
    .summary-area {
        padding: 20px 0 0 0;
    }
    .summary-label {
        font-size: 18px;
        font-weight: 700;
    }
    .summary-price {
        font-size: 22px;
        font-weight: 800;
        color: #5c26ff;
        text-align: right;
    }
    .pay-button-wrap {
        margin-top: 15px;
        text-align: right;
    }
    .pay-button {
        padding: 12px 30px;
        border-radius: 8px;
        border: none;
        background-color: #5c26ff;
        color: #fff;
        font-size: 16px;
        font-weight: 700;
        cursor: pointer;
    }
    /* footer 영역은 기존과 동일하게 사용 */
    #footer {
        background-color: #fff;
        padding: 30px 0;
        border-top: 1px solid #ddd;
    }
</style>

<jsp:include page="include/vivatemplet_css.jsp"></jsp:include>

<script>
    // 1일 / 연간에 따라 기본 가격을 자바스크립트로 내려주기
    var basePrices = {
        daily:  { adult: 64000, teen: 56000, child: 48000 },
        annual: { adult: 320000, teen: 280000, child: 240000 }
    };
    var salePrices = {
        daily:  { adult: 40300, teen: 35850, child: 31200 },
        annual: { adult: 320000, teen: 280000, child: 240000 } // 연간은 할인 없음 예시
    };

    function formatNumber(num) {
        return num.toLocaleString('ko-KR');
    }

    function recalcTotal() {
        var type = document.getElementById("ticketType").value;

        var qtyAdult = parseInt(document.getElementById("qtyAdult").value) || 0;
        var qtyTeen  = parseInt(document.getElementById("qtyTeen").value)  || 0;
        var qtyChild = parseInt(document.getElementById("qtyChild").value) || 0;

        var priceAdult = salePrices[type].adult * qtyAdult;
        var priceTeen  = salePrices[type].teen  * qtyTeen;
        var priceChild = salePrices[type].child * qtyChild;

        document.getElementById("sumAdult").innerText = formatNumber(priceAdult) + "원";
        document.getElementById("sumTeen").innerText  = formatNumber(priceTeen)  + "원";
        document.getElementById("sumChild").innerText = formatNumber(priceChild) + "원";

        var total = priceAdult + priceTeen + priceChild;
        document.getElementById("totalPrice").innerText = formatNumber(total) + "원";

        var desc = [];
        if(qtyAdult  > 0) desc.push("어른 "   + qtyAdult  + "매");
        if(qtyTeen   > 0) desc.push("청소년 " + qtyTeen   + "매");
        if(qtyChild  > 0) desc.push("어린이 " + qtyChild  + "매");
        var descText = desc.join(" · ");
        document.getElementById("totalDesc").innerText = descText;

        // payProcess.jsp 로 넘길 값 설정
        document.getElementById("sendTicketType").value = type;
        document.getElementById("sendQtyAdult").value   = qtyAdult;
        document.getElementById("sendQtyTeen").value    = qtyTeen;
        document.getElementById("sendQtyChild").value   = qtyChild;
        document.getElementById("sendTotalPrice").value = total;   // 숫자만
        document.getElementById("sendTotalDesc").value  = descText;
    }

    // 총합 10매 제한
    function changeQty(id, delta){
        var input  = document.getElementById(id);
        var current = parseInt(input.value) || 0;

        var qtyAdult = parseInt(document.getElementById("qtyAdult").value) || 0;
        var qtyTeen  = parseInt(document.getElementById("qtyTeen").value)  || 0;
        var qtyChild = parseInt(document.getElementById("qtyChild").value) || 0;

        // 현재 합계
        var totalNow = qtyAdult + qtyTeen + qtyChild;

        if(delta > 0){
            if(totalNow >= 10){
                return;
            }
            current += 1;
        }else if(delta < 0){
            current -= 1;
            if(current < 0) current = 0;
        }

        input.value = current;
        recalcTotal();
    }

    $(function(){
        // 최초 계산
        recalcTotal();
    });
</script>
</head>
<body>

<!-- 결제 페이지로 넘기는 form : 위쪽 박스를 통째로 감싼다 -->
<form action="payProcess.jsp" method="post" id="payForm">

<div class="overlay-area">
    <div class="reserve-box">
        <!-- 티켓 종류 제목 -->
        <div class="ticket-title">
            <c:choose>
                <c:when test="${ticketType eq 'daily'}">
                    1일 이용권
                </c:when>
                <c:otherwise>
                    연간 이용권
                </c:otherwise>
            </c:choose>
        </div>

        <input type="hidden" id="ticketType" value="${ticketType}" />

        <!-- 어른 -->
        <div class="person-row">
            <div class="person-label">어른</div>
            <div class="qty-control">
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyAdult', -1)">－</button>
                <input type="text" id="qtyAdult" class="qty-input" value="1" readonly>
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyAdult', 1)">＋</button>
            </div>
            <div class="price-col">
                <c:choose>
                    <c:when test="${ticketType eq 'daily'}">
                        <del>64,000원</del>
                        <strong id="sumAdult">40,300원</strong>
                    </c:when>
                    <c:otherwise>
                        <strong id="sumAdult">320,000원</strong>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- 청소년 -->
        <div class="person-row">
            <div class="person-label">청소년</div>
            <div class="qty-control">
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyTeen', -1)">－</button>
                <input type="text" id="qtyTeen" class="qty-input" value="1" readonly>
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyTeen', 1)">＋</button>
            </div>
            <div class="price-col">
                <c:choose>
                    <c:when test="${ticketType eq 'daily'}">
                        <del>56,000원</del>
                        <strong id="sumTeen">35,850원</strong>
                    </c:when>
                    <c:otherwise>
                        <strong id="sumTeen">280,000원</strong>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- 어린이 -->
        <div class="person-row">
            <div class="person-label">어린이</div>
            <div class="qty-control">
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyChild', -1)">－</button>
                <input type="text" id="qtyChild" class="qty-input" value="1" readonly>
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyChild', 1)">＋</button>
            </div>
            <div class="price-col">
                <c:choose>
                    <c:when test="${ticketType eq 'daily'}">
                        <del>48,000원</del>
                        <strong id="sumChild">31,200원</strong>
                    </c:when>
                    <c:otherwise>
                        <strong id="sumChild">240,000원</strong>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- 합계 -->
        <div class="summary-area d-flex justify-content-between align-items-center">
            <div class="summary-label">
                총 결제금액 ( 모두 합하여 10매까지 구매 가능 )
                <div id="totalDesc"
                     style="font-size:13px; color:#777; margin-top:5px;">
                    어른 1매 · 청소년 1매 · 어린이 1매
                </div>
            </div>
            <div class="summary-price" id="totalPrice">
                107,350원
            </div>
        </div>

        <div class="pay-button-wrap">
            <button type="submit" class="pay-button">결제하기</button>
        </div>
    </div>
</div>

<!-- payProcess.jsp 로 넘길 숨김 필드들 -->
<input type="hidden" name="ticketType"  id="sendTicketType"  value="${ticketType}">
<input type="hidden" name="qtyAdult"    id="sendQtyAdult"    value="1">
<input type="hidden" name="qtyTeen"     id="sendQtyTeen"     value="1">
<input type="hidden" name="qtyChild"    id="sendQtyChild"    value="1">
<input type="hidden" name="totalPrice"  id="sendTotalPrice"  value="107350">
<input type="hidden" name="totalDesc"   id="sendTotalDesc"
       value="어른 1매 · 청소년 1매 · 어린이 1매">

</form>

<!-- 기존 footer 유지 -->
<div id="footer">
    <jsp:include page="include/footer.jsp"></jsp:include>
</div>

</body>
</html>
