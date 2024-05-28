<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>내 관심강의</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function(){
	    	if(${!empty msgType}){
	     		$("#messageType").attr("class", "modal-content panel-warning");    
	    		$("#myMessage").modal("show");
	    	}
	    });
	    function handleSelectChange(selectedValue) {
	    	window.location.href = "/studentMainPage?lectureStatus="+selectedValue;
	    }
	 </script>
<style>
	.wishItem {
	    margin: 0 auto; /* 가운데 정렬 */
	    width: 70%; /* 테이블 너비 설정 */
	    border:1px solid;
	}
	
	.wishItem td, .wishItem th {
	    padding: 10px; /* 셀 패딩 추가 */
	}
	
	.wishItem td:first-child, .wishItem th:first-child {
	    padding-left: 20px; /* 첫 번째 열 왼쪽 패딩 추가 */
	}
	
	.wishItems td:last-child, .wishItema th:last-child {
	    padding-right: 20px; /* 마지막 열 오른쪽 패딩 추가 */
	}
	
	.wishItem td:nth-child(2), .wishItem th:nth-child(2) {
	    border-right: 1px solid #dee2e6; /* 두 번째 열과 세 번째 열 사이에 세로줄 추가 */
	}
	/* 체크박스 크기 조정 */
	.wishItem input[type="checkbox"] {
	    width: 20px;
	    height: 20px;
	}
	* { padding: 0; margin: 0; }
	
	html, body {
	  height: 100%;
	  background: #ffffff;
	}
	
	#loginBox {
	  width: 300px;
	  text-align: center;
	  background-color: #ffffff;
	  transform: scale(1.2);
	}
	.input-form-box {
	  border: 0px solid #ff0000;
	  display: flex;
	  margin-bottom: 5px;
	}
	.input-form-box > span {
	  display: block;
	  text-align: left;
	  padding-top: 5px;
	  min-width: 65px;
	}
	.button-login-box {
	  margin: 10px 0;
	}
	#loginBoxTitle {
	  color:#000000;
	  font-weight: bold;
	  font-size: 32px;
	  text-transform: uppercase;
	  padding: 5px;
	  margin-bottom: 20px;
	  background: linear-gradient(to right, #270a09, #8ca6ce);
	  -webkit-background-clip: text;
	  -webkit-text-fill-color: transparent;
	}
	#inputBox {
	  margin: 10px;
	}
	#inputBox button {
	  padding: 3px 5px;
	}
	.container-fluid {
	  padding-left: 0;
	}
	.col-md-2 {
	  width: 100%;
	  padding-left: 0;
	}
	.div {
	  display: flex;
	  flex-direction: row;
	}
	.div a {
	  text-align: center;
	  flex: 1;
	}
	.flex-container {
	   display: flex;
	   align-items: center;
	   justify-content: space-between;
	}
	.panel.panel-default {
	  text-align: center;
	}
</style>
</head>
<body>
<jsp:include page="./include/header.jsp"/>
<div class="container-fluid container-padding">
  <div class="row">
    <div class="col-md-2">
      <jsp:include page="./include/studentSideBar.jsp"/>
    </div>
    <div class="col-md-10">
		<section class="container">
		    <div class="row">
		         <div class="col-md-12"> 
					<div class="panel panel-default">
					<div class="panel-heading">내 관심 강의</div>
					<div class="panel-body">
						<form id="selectWish" action ="#" method="post">
							<input type="hidden" name="id" value="<%=session.getAttribute("loginId")%>">
							<c:forEach var="vo" items="${myWishList}">
							<br>
							<div id="lecture">
							<table class="wishItem"> <!-- 테이블 클래스 추가 -->
								<tr>
									<td>
										<input type="checkbox" name="lectureNo[]" value="${vo.lectureNo}" onchange="updateTotalPrice(this)">
									</td>
									<td>${vo.lectureName}</td>
									<td style="text-align: right;" rowspan="3">
										<fmt:formatNumber value="${vo.lecturePrice}" pattern="#,##0"/>원					
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>${vo.teacherName}</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td style="text-align: right;">
										${vo.startDate} ~ ${vo.endDate}  ${vo.lectureDay}반
									</td>
								</tr>			
							</table>
							</div>
							</c:forEach>
						<div>총 수강 금액 : <span id="totalPrice">0원</span></div>
						<input type="hidden" name="cash">
						<button type="button" onclick="submitForm('attend')">수강하기</button>
						
						<button type="button" onclick="submitForm('delete')">찜 삭제</button>	
						</form>
						</div>
					</div>
				</div>
			</div>
		</section>
    </div>
  </div>
</div>

<script>
function updateTotalPrice(checkbox) {
    var totalPriceElement = document.getElementById("totalPrice");
    var totalPrice = 0; // 총 가격 초기화

    // 체크된 각 체크박스에 대해 가격을 합산
    var checkedCheckboxes = document.querySelectorAll('input[name="lectureNo[]"]:checked');
    for (var i = 0; i < checkedCheckboxes.length; i++) {
        var row = checkedCheckboxes[i].parentNode.parentNode; // 현재 체크박스가 속한 행 가져오기
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
	    	var myCash = ${myCash}; // 세션에서 가져온 잔액
	        var totalPriceText = document.getElementById("totalPrice").innerText;
	        var totalPrice = parseInt(totalPriceText.replace(/[^\d]/g, ''));

            if (confirm("수강하시겠습니까?")) { // 수강을 확인하는 다이얼로그 표시
            	 if (myCash < totalPrice) {
     	            alert("잔액이 부족합니다!"); // 잔액이 부족함을 알리는 알람표시
     	            return false; // 폼 제출을 막음
     	        } else{            	
	                form.action = '/addApplication'; // 수강하기 페이지로 이동
	                form.submit();
	                alert("수강에 성공하였습니다."); // 수강완료되었음을 알리는 알람표시
	        	}
            } else {
                return false; // 취소를 클릭하면 폼 제출을 막음
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