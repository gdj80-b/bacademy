<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	session.setAttribute("loginId", "student");
	session.setAttribute("cash", "12");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>내 관심강의</title>
</head>
<body>

<div class="container">
	<h1>내 관심강의</h1>
	<form id="selectWish" action ="#" method="post">
	<input type="hidden" name="id" value="<%=session.getAttribute("loginId")%>">
	<table class="table table-bordered table-hover table-striped">
		<tr>
			<th>강의명</th>
			<th>강사</th>
			<th>가격</th>			
			<th>강의실</th>			
			<th>강의시간</th>			
			<th>요일</th>			
			<th>기간</th>
			<th>선택</th>			
		</tr>
		<c:forEach var="vo" items="${myWishList}">
			<tr>
				<td>${vo.lectureName}</td>
				<td>${vo.teacherName}</td>
				<td>
		            <fmt:formatNumber value="${vo.lecturePrice}" pattern="#,##0"/>원
		        </td>
				<td>${vo.roomNum}</td>
				<td>${vo.lectureTime}</td>
				<td>${vo.lectureDay}</td>
				<td>${vo.startDate} ~ ${vo.endDate}</td>
				<td>				
					<input type="checkbox" name="lectureNo[]" value="${vo.lectureNo}" onchange="updateTotalPrice(this)">			
				</td>
			</tr>
		</c:forEach>
	</table>
	<div>총 수강 금액 : <span id="totalPrice">0원</span></div>
	<input type="hidden" name="cash">
	<button type="button" onclick="submitForm('attend')">수강하기</button>
	
	<button type="button" onclick="submitForm('delete')">찜 삭제</button>	
	</form>
</div>
<script>
	function updateTotalPrice(checkbox) {
	    var totalPriceElement = document.getElementById("totalPrice");
	    var totalPrice = 0; // 총 가격 초기화

	    // 체크된 각 체크박스에 대해 가격을 합산
	    var checkedCheckboxes = document.querySelectorAll('input[name="lectureNo[]"]:checked');
	    for (var i = 0; i < checkedCheckboxes.length; i++) {
	        var row = checkedCheckboxes[i].closest("tr"); // 현재 체크박스가 속한 행 가져오기
	        var lecturePriceText = row.querySelector("td:nth-child(3)").innerText; // 세 번째 열의 가격 가져오기
	        var lecturePrice = parseInt(lecturePriceText.replace(/[^\d]/g, '')); // 가격을 정수로 변환하고 숫자 이외의 문자 제거
	        totalPrice += lecturePrice;
	    }

	    totalPriceElement.innerText = totalPrice.toLocaleString() + "원"; // 총 가격 업데이트
	    
		 // hidden input의 값을 업데이트
        var cashInput = document.querySelector('input[name="cash"]');
        cashInput.value = -totalPrice; // totalPrice를 hidden input의 값으로 설정
	}
	
	function submitForm(action) {
	    var form = document.getElementById("selectWish");
	    var lectureNo = form.querySelectorAll('input[name="lectureNo[]"]:checked');
	    
	    // 선택된 체크박스의 값을 배열에 저장
	    var selectedValues = [];
	    for (var i = 0; i < lectureNo.length; i++) {
	        selectedValues.push(lectureNo[i].value);
	    }

	    // 선택된 값이 없는 경우에는 폼 제출을 막음
	    if (selectedValues.length === 0) {
	        alert("하나 이상의 아이템을 선택하세요.");
	        return false;
	    }

	    // 액션에 따라 폼의 액션을 설정
	    if (action === 'attend') {            
	        var money = parseInt("${session.getAttribute("cash")}"); // 세션에서 잔액을 가져옴
	        var totalPriceText = document.getElementById("totalPrice").innerText;
	        var totalPrice = parseInt(totalPriceText.replace(/[^\d]/g, ''));

	        if (money < totalPrice) {
	            alert("잔액이 부족합니다!"); // 잔액이 부족함을 알리는 알람표시
	            return false; // 폼 제출을 막음
	        } else {
	            if (confirm("수강하시겠습니까?")) { // 수강을 확인하는 다이얼로그 표시
	                form.action = '/addApplication'; // 수강하기 페이지로 이동
	                form.submit();
	                alert("수강에 성공하였습니다."); // 수강완료되었음을 알리는 알람표시
	            } else {
	                return false; // 취소를 클릭하면 폼 제출을 막음
	            }
	        }
	    } else if (action === 'delete') {
	        if (confirm("정말로 삭제하시겠습니까?")) { // 삭제를 확인하는 다이얼로그 표시
	            form.action = '/wishListDelete'; // 찜 삭제 페이지로 이동
	            form.submit();
	            alert("삭제되었습니다."); // 삭제되었음을 알리는 알람표시
	        } else {
	            return false; // 취소를 클릭하면 폼 제출을 막음
	        }
	    }
	}

</script>
</body>
</html>