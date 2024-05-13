<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("loginId", "student");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>ȯ�ҳ���</title>
	
</head>
<body class="container">
	<h2> ȯ���ϱ�</h2>
	<form action="">
		<input type="hidden" name="id" value="student">
		<input type="number" name="price">
		<button type="submit"> ȯ���ϱ� </button>
	 </form>
	 <hr>
	<h2> �� ȯ�� ����</h2>
	<table class="table table-bordered table-hover table-striped">
		<tr>
			<th>����</th>
			<th>�ݾ�</th>
			<th>��¥</th>
		</tr>
		<c:forEach var="vo" items="${myRefundList}">
			<tr>
				<td>${vo.state}</td>
				<td>${vo.refund_cash}</td>
				<td>${vo.request_date}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>