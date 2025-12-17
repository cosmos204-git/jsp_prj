<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- 로그인폼 디자인 시작 -->
<style type="text/css">

/* 배경 영역 */
#loginBgWrap {
    position: relative;
    height: calc(100vh - 120px);
    overflow: hidden;
}

.bg-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* 로그인 카드 */
.loginFrm {
    width: 380px;
    background: #fff;
    padding: 45px 40px;
    border-radius: 22px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.15);

    position: absolute;
    top: 50%;
    right: 8%;
    transform: translateY(-50%);
}

/* 제목 */
.page_tit h2 {
    font-size: 26px;
    font-weight: 700;
    text-align: center;
    margin-bottom: 30px;
}

/* 입력창 */
.input_type {
    margin-bottom: 20px;
}

.input_type input {
    width: 100%;
    padding: 14px 15px;
    border: 1px solid #ddd;
    border-radius: 12px;

    font-size: 15px;
    background: #fafafa;
    transition: all .25s;
}

.input_type input:focus {
    background: #fff;
    border-color: #ff4b66;
    box-shadow: 0 0 0 4px rgba(255,75,102,0.15);
}

/* 메뉴 */
.find_joinLink {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.find_joinLink a {
    font-size: 13px;
    color: #888;
}

.find_joinLink a:hover {
    text-decoration: underline;
}

/* 버튼 */
.btn_red {
    width: 100%;
    padding: 14px 0;
    border-radius: 12px;
    border: none;

    background: #ff4b66;
    color: #fff;
    font-size: 17px;
    font-weight: 600;
    cursor: pointer;

    transition: all .25s;
}

.btn_red:hover {
    background: #ff2f52;
}

</style>
<!-- 로그인폼 디자인 끝 -->

<script type="text/javascript">
$(function(){
	$("#btn_login").click(function(){
		if($("#id").val() == ""){
			alert("아이디는 필수 입력!");
			return;
		}//end if
		if($("#password").val() == ""){
			alert("비밀번호는 필수 입력!");
			return;
		}//end if
		$("#loginFrm").submit();
	});
});//ready
</script>

		<!-- 로그인 창 -->
	    <div id="loginBgWrap">
	       <img src="../images/loginPg.png" class="bg-img" alt="로그인 배경">
	   		<form id="loginFrm" name="loginFrm" action="${ CommonURL }/login/loginFrmProcess.jsp" method="post">
	   
	       <div class="loginFrm">
	           <div class="page_tit">
	               <h2>로그인</h2>
	           </div>
	   
	           <div class="input_type">
	               <input type="text" id="inputId" placeholder="아이디 입력">
	           </div>
	   
	           <div class="input_type">
	               <input type="password" id="inputPw" placeholder="비밀번호 입력">
	           </div>
	   
	           <div class="find_joinLink">
	               <a href="#void">아이디 찾기</a>
	               <a href="#void">비밀번호 찾기</a>
	               <a href="#void">회원가입</a>
	           </div>
	   
	           <button type="submit" class="btn_red" id="btn_login">

	               로그인
	           </button>
	       </div>
	       </form>
	    </div>
	
	    <!-- 로그인창 끝 -->

	