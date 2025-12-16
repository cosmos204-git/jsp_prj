<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../fragments/siteProperty.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date, javax.servlet.RequestDispatcher" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 결제 폼에서 넘어온 값
    String ticketType  = request.getParameter("ticketType");
    String ticketName  = "1Day 이용권 네이버페이";   // 예시
    String visitDate   = request.getParameter("visitDate"); // yyyy.MM.dd 형태로 세팅해서 넘긴 값
    int    totalPrice  = Integer.parseInt(request.getParameter("totalPrice"));

    // 결제 처리 후 생성된 값들 (예시)
    String payMethodName = "신용카드";
    String reserveNo     = "685412";
    String payNo         = "548414251";
    String reserveDate   = new SimpleDateFormat("yyyy.MM.dd")
                               .format(new Date());

    // 성공 페이지에서 사용할 속성 세팅
    request.setAttribute("ticketName",    ticketName);
    request.setAttribute("visitDate",     visitDate);
    request.setAttribute("reserveDate",   reserveDate);
    request.setAttribute("reserveNo",     reserveNo);
    request.setAttribute("payMethodName", payMethodName);
    request.setAttribute("payNo",         payNo);
    request.setAttribute("totalPrice",    totalPrice);

    // forward
    RequestDispatcher rd = request.getRequestDispatcher("paySuccess.jsp");
    rd.forward(request, response);
%>
