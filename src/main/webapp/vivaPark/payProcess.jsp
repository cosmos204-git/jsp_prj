<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="include/vivatemplet_css.jsp"></jsp:include>
<%@ include file="../fragments/siteProperty.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="vivaParkDAO.PromotionDAO" %>
<%@ page import="vivaParkDTO.PromotionDTO" %>

<%
    /* ================= 카드 고정 처리 ================= */
    String promPayAgency = request.getParameter("promPayAgency");
    String fixedCardCompany = "";

    if("비씨".equals(promPayAgency)){
        fixedCardCompany = "비씨카드";
    }else if("삼성".equals(promPayAgency)){
        fixedCardCompany = "삼성카드";
    }else{
        fixedCardCompany = "";
    }

    request.setAttribute("fixedCardCompany", fixedCardCompany);
    /* ================================================== */

    // 예약 정보 파라미터
    String ticketType = request.getParameter("ticketType");   // daily / annual
    int qtyAdult  = Integer.parseInt(request.getParameter("qtyAdult"));
    int qtyTeen   = Integer.parseInt(request.getParameter("qtyTeen"));
    int qtyKids   = Integer.parseInt(request.getParameter("qtyKids"));
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
    String totalDesc = request.getParameter("totalDesc");

    String visitDate  = request.getParameter("visitDate");
    String payDate    = request.getParameter("payDate");
    String expireDate = request.getParameter("expireDate");

    String ticketName = "1일 이용권";
    if("annual".equals(ticketType)){
        ticketName = "연간 이용권";
    }

    PromotionDAO pDao = PromotionDAO.getInstance();
    List<PromotionDTO> promList = pDao.selectAllPromotion();
    request.setAttribute("promList", promList);

    request.setAttribute("originTotalPrice", totalPrice);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VIVA PARK - 결제하기</title>
<link rel="stylesheet" type="text/css"
      href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
.pay-title{font-size:24px;font-weight:700;margin-bottom:25px;text-align:center;}
.table-summary{width:100%;border-collapse:collapse;margin-bottom:30px;}
.table-summary th, .table-summary td{border:1px solid #eee;padding:12px 16px;font-size:14px;}
.table-summary th{background:#fafafa;width:20%;}
.btn-orange{background:#ff7a00;color:#fff;border:none;padding:10px 30px;
            border-radius:4px;font-weight:600;}

.card-pay-box{
    max-width:520px;
    margin:20px auto 0;
    border:1px solid #d7d5ff;
    border-radius:8px;
    padding:25px 30px;
    background:#fff;
    box-sizing:border-box;
}
.card-field{margin-bottom:14px;}
.card-label{display:block;font-size:13px;color:#555;margin-bottom:6px;}
.card-input{
    width:100%;
    height:46px;
    border:1px solid #e4e4e4;
    border-radius:4px;
    padding:0 12px;
    font-size:14px;
    background-color:#fafafa;
}
.card-row{display:flex;gap:16px;}
.card-col{flex:1;}
.card-btn-wrap{text-align:center;margin-top:20px;margin-bottom:0;}

.container{padding-bottom:0 !important;}
.pay-box{
    max-width:900px;
    margin:40px auto 0;
    background:#fff;
    border-radius:10px;
    padding:30px 40px;
    box-shadow:0 0 15px rgba(0,0,0,0.15);
}
.card-btn-wrap{margin-bottom:0;}
#footer{margin-top:0 !important;}
</style>

<script>
function formatNumber(num){
    return num.toLocaleString('ko-KR');
}

function updateDiscount(){
    var originTotal = parseInt(document.getElementById('originTotalPrice').value) || 0;
    var sel = document.getElementById('cardCompanySelect');
    var discount = 0;

    if(sel && sel.value){
        var d = sel.options[sel.selectedIndex].getAttribute('data-discount');
        if(d){ discount = parseInt(d); }
    }

    var discounted = Math.floor(originTotal * (100 - discount) / 100);

    document.getElementById('showOriginPrice').innerText     = formatNumber(originTotal) + '원';
    document.getElementById('showDiscountRate').innerText    = discount + '%';
    document.getElementById('showDiscountedPrice').innerText = formatNumber(discounted) + '원';

    document.getElementById('finalPayAmount').value = discounted;
}
</script>
</head>

<body style="background:#f5f5f5;">

<div class="wrap">
		<!-- 헤더 -->
    <div id="closetop"></div>
    <div id="header">
    	<jsp:include page="include/vivatemplet_css.jsp"></jsp:include>
        <jsp:include page="include/header.jsp"></jsp:include>
    </div>
    <jsp:include page="include/hamberger.jsp"></jsp:include>


<div class="container">
<div class="pay-box">

<div class="pay-title">결제하기</div>

<table class="table-summary">
<tr>
<th>예정 방문일<br>(유효 기간)</th>
<td>
<%
if("daily".equals(ticketType)){
    out.print(visitDate != null ? visitDate : "");
}else{
    if(payDate != null && expireDate != null){
        out.print(payDate + " ~ " + expireDate);
    }
}
%>
</td>
<th>인원수</th>
<td><%= qtyAdult + qtyTeen + qtyKids %>명</td>
</tr>
<tr>
<th>예매 일시</th>
<td><%= new java.text.SimpleDateFormat("yyyy.MM.dd").format(new java.util.Date()) %></td>
<th>결제 수단</th>
<td>신용카드</td>
</tr>
<tr>
<th>상품 정보</th>
<td colspan="3"><%= ticketName %> / <%= totalDesc %></td>
</tr>
<tr>
<th>총 금액(할인 전)</th>
<td colspan="3">
<span id="showOriginPrice">
<fmt:formatNumber value="${originTotalPrice}" groupingUsed="true"/>원
</span>
</td>
</tr>
<tr>
<th>할인율 / 최종 금액</th>
<td colspan="3">
할인율: <span id="showDiscountRate">0%</span>,
최종 결제 금액:
<span id="showDiscountedPrice">
<fmt:formatNumber value="${originTotalPrice}" groupingUsed="true"/>원
</span>
</td>
</tr>
</table>

<form action="paySuccess.jsp" method="post" class="card-pay-box">

<input type="hidden" name="ticketType" value="<%= ticketType %>">
<input type="hidden" name="qtyAdult" value="<%= qtyAdult %>">
<input type="hidden" name="qtyTeen" value="<%= qtyTeen %>">
<input type="hidden" name="qtyKids" value="<%= qtyKids %>">
<input type="hidden" name="originTotalPrice" id="originTotalPrice" value="<%= totalPrice %>">
<input type="hidden" name="totalDesc" value="<%= totalDesc %>">
<input type="hidden" name="visitDate" value="<%= visitDate %>">
<input type="hidden" name="payDate" value="<%= payDate %>">
<input type="hidden" name="expireDate" value="<%= expireDate %>">
<input type="hidden" name="finalPayAmount" id="finalPayAmount" value="<%= totalPrice %>">
<input type="hidden" name="promPayAgency" value="<%= promPayAgency %>">

<div class="card-field">
<label class="card-label">카드사</label>
<select class="card-input" name="cardCompany" id="cardCompanySelect" required>
<option value="">선택하세요</option>
<c:forEach var="p" items="${promList}">
<option value="${p.promPayAgency}"
        data-discount="${p.discount}"
        <c:if test="${p.promPayAgency eq fixedCardCompany}">selected</c:if>>
${p.promPayAgency} (${p.discount}% 할인)
</option>
</c:forEach>
</select>
</div>

<div class="card-field">
<label class="card-label">카드 번호</label>
<input type="text" class="card-input" name="cardNo" placeholder="0000 - 0000 - 0000 - 0000">
</div>

<div class="card-field card-row">
<div class="card-col">
<label class="card-label">유효 기간 (MM/YY)</label>
<input type="text" class="card-input" name="exp" placeholder="MM/YY">
</div>
<div class="card-col">
<label class="card-label">CVC</label>
<input type="password" class="card-input" name="cvc" maxlength="3" placeholder="카드 뒷면 3자리 숫자">
</div>
</div>

<div class="card-field">
<label class="card-label">카드 비밀번호</label>
<input type="password" class="card-input" name="cardPwd" maxlength="2" placeholder="비밀번호 앞 2자리">
</div>

<div class="card-field">
<label class="card-label">할부</label>
<select class="card-input" name="installment">
<option value="일시불">일시불</option>
<option value="3">3개월</option>
<option value="6">6개월</option>
<option value="12">12개월</option>
</select>
</div>

<div class="card-btn-wrap">
<button type="submit" class="btn-orange">결제하기</button>
<button type="button" class="btn btn-outline-secondary" onclick="history.back();">확인</button>
</div>

</form>
</div>
</div>
</div>

<script>
$(function(){
    const cardSelect = document.getElementById('cardCompanySelect');

    cardSelect.addEventListener('mousedown', e => e.preventDefault());
    cardSelect.addEventListener('keydown', e => e.preventDefault());

    updateDiscount();
});
</script>

    <div id="footer">
        <jsp:include page="include/footer.jsp"></jsp:include>
    </div>

</body>
</html>
