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
	<form action="refundRequest" id="refundForm" method="post">
		<input type="hidden" name="id" value="<%=session.getAttribute("loginId")%>">
		<input type="number" id="cashInput" name="refundCash" min="0" step="50000" placeholder="50,000�� ������ �Է����ּ���" style="width:300px;">
 	    <button type="button" onclick="confirmRefund()"> ȯ�ҿ�û </button> 
<!-- 	    <button type="submit"> ȯ�ҿ�û </button>     -->
	    
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
				<td>${vo.refundCash}</td>
				<td>${vo.date}</td>
			</tr>
		</c:forEach>
	</table>
	<script>
	    function confirmRefund() {
	        var cash = document.getElementById("cashInput").value;
	        if (cash === "") {
	            alert("�ݾ��� �Է����ּ���.");
	            return;
	        }
	        if (cash % 50000 !== 0) {
	            alert("50000�� ������ �Է����ּ���.");
	            return;
	        }
	        if (confirm(cash + " ���� ȯ���Ͻðڽ��ϱ�?")) {
	            document.getElementById("refundForm").submit();
	            alert("ȯ�ҿ�û�Ǿ����ϴ�."); // ȯ�ҿ�û�� �Ϸ�Ǿ����� �˸��� �˶�ǥ��
	        }
	    }
	</script>
</body>
</html>