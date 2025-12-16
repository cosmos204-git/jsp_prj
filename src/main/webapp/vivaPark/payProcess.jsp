<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");   // ★ POST 한글 인코딩
%>
<jsp:include page="include/vivatemplet_css.jsp"></jsp:include>
<%@ include file="../fragments/siteProperty.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
    String ticketType = request.getParameter("ticketType");
    int qtyAdult  = Integer.parseInt(request.getParameter("qtyAdult"));
    int qtyTeen   = Integer.parseInt(request.getParameter("qtyTeen"));
    int qtyChild  = Integer.parseInt(request.getParameter("qtyChild"));
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
    String totalDesc = request.getParameter("totalDesc");

    String ticketName = "1일 이용권";
    if("annual".equals(ticketType)){
        ticketName = "연간 이용권";
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VIVA PARK - 결제하기</title>
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css">
<style>

/* 이미지에 맞게 간단 스타일 */
.pay-box{max-width:900px;margin:40px auto;background:#fff;border-radius:10px;
         padding:30px 40px;box-shadow:0 0 15px rgba(0,0,0,0.15);}
.pay-title{font-size:24px;font-weight:700;margin-bottom:25px;text-align:center;}
.table-summary{width:100%;border-collapse:collapse;margin-bottom:30px;}
.table-summary th, .table-summary td{border:1px solid #eee;padding:12px 16px;font-size:14px;}
.table-summary th{background:#fafafa;width:20%;}
.btn-orange{background:#ff7a00;color:#fff;border:none;padding:10px 30px;
            border-radius:4px;font-weight:600;}
            

/* 전체 박스(보라색 테두리 영역 느낌) */
/* 카드 정보 박스는 폭을 줄이고 가운데 배치 */
.card-pay-box{
    max-width:520px;         /* 원하는 폭 (예: 500~600px 사이) */
    margin:20px auto 0;      /* 위로는 여백, 좌우는 auto 로 가운데 정렬 */
    border:1px solid #d7d5ff;
    border-radius:8px;
    padding:25px 30px;
    background:#fff;
    box-sizing:border-box;
}
/* 각 라인 */
.card-field{
    margin-bottom:14px;
}

.card-label{
    display:block;
    font-size:13px;
    color:#555;
    margin-bottom:6px;
}

/* 인풋/셀렉트 공통 스타일 */
.card-input{
    width:100%;
    height:46px;
    border:1px solid #e4e4e4;
    border-radius:4px;
    padding:0 12px;
    font-size:14px;
    background-color:#fafafa;
}

/* 유효기간 / CVC 나란히 배치 */
.card-row{
    display:flex;
    gap:16px;
}
.card-col{
    flex:1;
}

/* 버튼 영역 중앙 정렬 */
.card-btn-wrap{
    text-align:center;
    margin-top:20px;
}




</style>
</head>
<body style="background:#f5f5f5;">

<body>

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
		            <th>예정 방문일</th>
		            <td><!-- 추후 실제 방문일 값 넣기 --></td>
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
		
		    <!-- 카드 정보 입력 영역 (이미지 참고해서 배치) -->
		    <!-- 카드사, 카드번호, 유효기간, CVC, 비밀번호, 할부 선택 등 form 구성 -->
		    <!-- 카드 정보 입력 영역 -->
    <!-- ★ 카드 정보 영역: 예약 정보 아래에 위치 -->
    <form action="cardPayProcess.jsp" method="post" class="card-pay-box">
        <input type="hidden" name="ticketType" value="<%= ticketType %>">
        <input type="hidden" name="qtyAdult"  value="<%= qtyAdult %>">
        <input type="hidden" name="qtyTeen"   value="<%= qtyTeen %>">
        <input type="hidden" name="qtyChild"  value="<%= qtyChild %>">
        <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
        <input type="hidden" name="totalDesc"  value="<%= totalDesc %>">

        <div class="card-field">
            <label class="card-label">카드사</label>
            <select class="card-input" name="cardCompany">
                <option value="">선택하세요</option>
                <option value="신한">신한카드</option>
                <option value="국민">국민카드</option>
                <option value="현대">현대카드</option>
                <option value="롯데">롯데카드</option>
                <option value="삼성">삼성카드</option>
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
    </div>
</div> <!-- pay-box 끝 -->
		
		</div>


		<div id="footer">
			<jsp:include page="include/footer.jsp"></jsp:include>
		</div>

</body>
</html>
