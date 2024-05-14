<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("loginId", "student");
%>
<!-- session.invalidate(); // 세션 공간 초기화(포맷)	 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>내 캐쉬</title>
	
</head>
<body class="container">
	<h1> 내 캐쉬 내역</h1>
	<br>
	<form action="cashCharge" method="post">
		<input type="hidden" name="id" value="<%=session.getAttribute("loginId")%>" >
		<input type="number" name="cash">
		<button type="submit"> 충전하기 </button>
	 </form>	 
	<hr>
	<table class="table table-bordered table-hover table-striped">
		<tr>
			<th>종류</th>
			<th>날짜</th>
			<th>정보</th>
			<th>금액</th>
		</tr>
		<c:forEach var="vo" items="${myCashList}">
			<tr>
				<td>${vo.state}</td>
				<td>${vo.date}</td>
				<td>${vo.info}</td>
				<td>${vo.chargeCash}원</td>
			</tr>
		</c:forEach>
	</table>
	<a href="myCashRefundForm" class="btn btn-secondary">환불내역 보기</a>
</body>
</html>