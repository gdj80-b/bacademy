<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("loginId", "student");
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
				<td>${vo.lecturePrice}원</td>
				<td>${vo.roomNum}</td>
				<td>${vo.lectureTime}</td>
				<td>${vo.lectureDay}</td>
				<td>${vo.startDate} ~ ${vo.endDate}</td>
				<td>				
					<input type="checkbox"	name="lectureNo[]"  value="${vo.lectureNo}">			
				</td>
			</tr>
		</c:forEach>
	</table>
	<button type="button" onclick="submitForm('attend')">수강하기</button>
	
	<button type="button" onclick="submitForm('delete')">찜 삭제</button>	
	</form>
</div>
<script>
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
	        form.action = '/addApplication'; // 수강하기 페이지로 이동
	    } else if (action === 'delete') {
	    	if (confirm("정말로 삭제하시겠습니까?")) { // 삭제를 확인하는 다이얼로그 표시
                form.action = '/wishListDelete'; // 찜 삭제 페이지로 이동
                form.submit();
                alert("삭제되었습니다."); // 삭제되었음을 알리는 알람 표시
            }
	    }
		 // 폼 제출
	    form.submit();
	    
	}
</script>

</body>
</html>

<% System.out.println("디버깅"); %>