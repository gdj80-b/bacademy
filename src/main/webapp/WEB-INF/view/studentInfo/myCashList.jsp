<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>내 캐쉬</title>
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
<c:set var="color" value=""></c:set>

<jsp:include page="../include/header.jsp"/>
<div class="container-fluid container-padding">
  <div class="row">
    <div class="col-md-2">
      <jsp:include page="../include/studentSideBar.jsp"/>
    </div>
    <div class="col-md-10">
		<section class="container">
		    <div class="row">
		         <div class="col-md-12"> 
					<div class="panel panel-default">
					    <div class="panel-heading">내 캐쉬 내역</div>						
						<div class="panel-body">
							<form action="cashCharge" id="cashForm" method="post">
							    <input type="hidden" name="id" value="${loginId}" >
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
						</div>
					</div>
				</div>
			</div>
		</section>
    </div>
  </div>
</div>
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
