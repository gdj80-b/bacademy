<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	session.setAttribute("loginId", "student");
	String color = "";
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
	<form action="cashCharge" id="cashForm" method="post">
	    <input type="hidden" name="id" value="<%=session.getAttribute("loginId")%>" >
	    <input type="number" id="cashInput" name="cash" min="0" step="50000" placeholder="50,000원 단위로 입력해주세요" style="width:300px;">
	    <button type="button" onclick="confirmCharge()"> 충전하기 </button>
	</form>	 
	<hr>
	<table class="table table-bordered table-hover table-striped">
		<tr>
			<th>종류</th>
			<th>날짜</th>
			<th>정보</th>
			<th>금액</th>
			<th>잔액</th>
		</tr>
		<c:forEach var="vo" items="${myCashList}">
		    <tr>
		        <td>${vo.state}</td>
		        <td>${vo.date}</td>
		        <td>${vo.info}</td>
				<c:choose>
		            <c:when test="${vo.chargeCash < 0}">
		                <c:set var="color" value="color:red"/>
		            </c:when>
		            <c:otherwise>
		                <c:set var="color" value="color:blue"/>
		            </c:otherwise>
		        </c:choose>
		        <td style="text-align:right; ${color};"><fmt:formatNumber value="${vo.chargeCash}" pattern="#,##0"/>원</td>
		        <td style="text-align:right;"><fmt:formatNumber value="${vo.balance}" pattern="#,##0"/>원</td>
		    </tr>
		</c:forEach>


	</table>
	<a href="myCashRefundForm" class="btn btn-secondary">환불내역 보기</a>
	
	<script>
    function confirmCharge() {
        var cash = document.getElementById("cashInput").value;
        if (cash === "") {
            alert("금액을 입력해주세요.");
            return;
        }
        if (cash % 50000 !== 0) {
            alert("50000원 단위로 입력해주세요.");
            return;
        }
        if (confirm(cash + " 원을 충전하시겠습니까?")) {
            document.getElementById("cashForm").submit();
            alert("충전되었습니다."); // 충전되었음을 알리는 알람표시
        }
    }
	</script>
</body>
</html>
