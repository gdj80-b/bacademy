<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("loginId", "student");
%>
<!-- session.invalidate(); // ���� ���� �ʱ�ȭ(����)	 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>�� ĳ��</title>
	
</head>
<body class="container">
	<h1> �� ĳ�� ����</h1>
	<br>
	<form action="cashCharge" method="post">
		<input type="hidden" name="id" value="<%=session.getAttribute("loginId")%>" >
		<input type="number" name="cash">
		<button type="submit"> �����ϱ� </button>
	 </form>	 
	<hr>
	<table class="table table-bordered table-hover table-striped">
		<tr>
			<th>����</th>
			<th>��¥</th>
			<th>����</th>
			<th>�ݾ�</th>
		</tr>
		<c:forEach var="vo" items="${myCashList}">
			<tr>
				<td>${vo.state}</td>
				<td>${vo.date}</td>
				<td>${vo.info}</td>
				<td>${vo.chargeCash}��</td>
			</tr>
		</c:forEach>
	</table>
	<a href="myCashRefundForm" class="btn btn-secondary">ȯ�ҳ��� ����</a>
</body>
</html>