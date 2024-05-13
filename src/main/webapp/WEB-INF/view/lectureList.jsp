<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		td{
			text-align: center;
		}
	</style>
</head>
<body>
	<h1>���� ���</h1>
	<table border=1>
		<tr>
			<th>���Ǹ�</th>
			<th>�����</th>
			<th>���ǽ�</th>
			<th>������</th>
			<th>������</th>
			<th>���ǽð�</th>
			<th>������</th>
			<th>���Ƿ�</th>
			<th>������</th>
			<th>�����</th>
		</tr>
		<c:forEach var="vo" items="${lectureList}">
			<tr>
				<td>${vo.lectureName}</td>
				<td>${vo.id}</td>
				<td>${vo.roomNum}</td>
				<td>${vo.startDate}</td>
				<td>${vo.endDate}</td>
				<td>${vo.lectureTime}</td>
				<td>${vo.lectureDay}</td>
				<td>${vo.lecturePrice}</td>
				<td>${vo.updateDate}</td>
				<td>${vo.createDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>