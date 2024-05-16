<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<form action="cashCharge" id="cashForm" method="post">
	    <input type="hidden" name="id" value="<%=session.getAttribute("loginId")%>" >
	    <input type="number" id="cashInput" name="cash" min="0" step="50000" placeholder="50,000�� ������ �Է����ּ���" style="width:300px;">
	    <button type="button" onclick="confirmCharge()"> �����ϱ� </button>
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
				<td style="text-align:right;"><fmt:formatNumber value="${vo.chargeCash}" pattern="#,##0"/>��</td>
			</tr>
		</c:forEach>
	</table>
	<a href="myCashRefundForm" class="btn btn-secondary">ȯ�ҳ��� ����</a>
	
	<script>
    function confirmCharge() {
        var cash = document.getElementById("cashInput").value;
        if (cash === "") {
            alert("�ݾ��� �Է����ּ���.");
            return;
        }
        if (cash % 50000 !== 0) {
            alert("50000�� ������ �Է����ּ���.");
            return;
        }
        if (confirm(cash + " ���� �����Ͻðڽ��ϱ�?")) {
            document.getElementById("cashForm").submit();
            alert("�����Ǿ����ϴ�."); // �����Ǿ����� �˸��� �˶�ǥ��
        }
    }
	</script>
</body>
</html>
