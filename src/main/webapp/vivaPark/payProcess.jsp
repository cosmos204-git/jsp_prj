<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");   // POST 한글 인코딩
%>
<jsp:include page="include/vivatemplet_css.jsp"></jsp:include>
<%@ include file="../fragments/siteProperty.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.util.List" %>
<%@ page import="vivaParkDAO.PromotionDAO" %>
<%@ page import="vivaParkDTO.PromotionDTO" %>

<%
    String ticketType = request.getParameter("ticketType");
    int qtyAdult  = Integer.parseInt(request.getParameter("qtyAdult"));
    int qtyTeen   = Integer.parseInt(request.getParameter("qtyTeen"));
    int qtyChild  = Integer.parseInt(request.getParameter("qtyChild"));
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
    String totalDesc = request.getParameter("totalDesc");

    // reservProcess.jsp 에서 넘어온 날짜들
    String visitDate  = request.getParameter("visitDate");   // 1일권 방문 예정일
    String payDate    = request.getParameter("payDate");     // 연간권 결제일
    String expireDate = request.getParameter("expireDate");  // 연간권 만료일

    String ticketName = "1일 이용권";
    if("annual".equals(ticketType)){
        ticketName = "연간 이용권";
    }

    // promotion 테이블에서 카드사 목록 조회
    PromotionDAO pDao = PromotionDAO.getInstance();
    List<PromotionDTO> promList = pDao.selectAllPromotion();
    request.setAttribute("promList", promList);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VIVA PARK - 결제하기</title>
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css">
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

    <!-- 상단 예약 정보 -->
    <table class="table-summary">
        <tr>
            <th>예정 방문일<br>(유효 기간)</th>
            <td>
                <%
                    if("daily".equals(ticketType)){
                        // 1일권: 방문 예정일
                        out.print(visitDate != null ? visitDate : "");
                    }else{
                        // 연간권: 결제일 ~ 만료일
                        if(payDate != null && expireDate != null){
                            out.print(payDate + " ~ " + expireDate);
                        }
                    }
                %>
            </td>
            <th>인원수</th>
            <td><%= qtyAdult + qtyTeen + qtyChild %>명</td>
        </tr>
        <tr>
            <th>예매 일시</th>
            <td><%= new java.text.SimpleDateFormat("yyyy.MM.dd")
                        .format(new java.util.Date()) %></td>
            <th>결제 수단</th>
            <td>신용카드</td>
        </tr>
        <tr>
            <th>상품 정보</th>
            <td colspan="3"><%= ticketName %> / <%= totalDesc %></td>
        </tr>
        <tr>
            <th>총 금액</th>
            <td colspan="3"><%= String.format("%,d", totalPrice) %>원</td>
        </tr>
    </table>

    <!-- 카드 정보 입력 영역 -->
    <form action="cardPayProcess.jsp" method="post" class="card-pay-box">
        <!-- 기본 정보 hidden -->
        <input type="hidden" name="ticketType" value="<%= ticketType %>">
        <input type="hidden" name="qtyAdult"  value="<%= qtyAdult %>">
        <input type="hidden" name="qtyTeen"   value="<%= qtyTeen %>">
        <input type="hidden" name="qtyChild"  value="<%= qtyChild %>">
        <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
        <input type="hidden" name="totalDesc"  value="<%= totalDesc %>">
        <!-- 날짜 정보도 전달 -->
        <input type="hidden" name="visitDate"  value="<%= visitDate %>">
        <input type="hidden" name="payDate"    value="<%= payDate %>">
        <input type="hidden" name="expireDate" value="<%= expireDate %>">

        <!-- 카드사 선택: promotion 테이블 기반 -->
        <div class="card-field">
            <label class="card-label">카드사</label>
            <select class="card-input" name="cardCompany" required>
                <option value="">선택하세요</option>
                <c:forEach var="p" items="${promList}">
                    <option value="${p.promPayAgency}">
                        ${p.promPayAgency}카드
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="card-field">
            <label class="card-label">카드 번호</label>
            <input type="text" class="card-input" name="cardNo"
                   placeholder="0000 - 0000 - 0000 - 0000">
        </div>

        <div class="card-field card-row">
            <div class="card-col">
                <label class="card-label">유효 기간 (MM/YY)</label>
                <input type="text" class="card-input" name="exp" placeholder="MM/YY">
            </div>
            <div class="card-col">
                <label class="card-label">CVC</label>
                <input type="password" class="card-input" name="cvc"
                       maxlength="3" placeholder="카드 뒷면 3자리 숫자">
            </div>
        </div>

        <div class="card-field">
            <label class="card-label">카드 비밀번호</label>
            <input type="password" class="card-input" name="cardPwd"
                   maxlength="2" placeholder="비밀번호 앞 2자리">
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
            <button type="button" class="btn btn-outline-secondary"
                    onclick="history.back();">확인</button>
        </div>
    </form>
</div> <!-- pay-box 끝 -->

    </div>
</div>

<div id="footer">
    <jsp:include page="include/footer.jsp"></jsp:include>
</div>

</body>
</html>
