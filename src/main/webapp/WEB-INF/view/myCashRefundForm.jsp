<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//session.setAttribute("loginId", "student");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>환불내역</title>
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
							<div class="panel-heading">내 환불내역 </div>						
							<div class="panel-body">
								<form action="refundRequest" id="refundForm" method="post">
									<input type="hidden" name="id" value="${loginId}">
									<input type="number" id="cashInput" name="refundCash" min="0" step="50000" placeholder="50,000원 단위로 입력해주세요" style="width:300px;">
									<button type="button" onclick="confirmRefund()"> 환불요청 </button>					    
								 </form><hr>
								<table class="table table-bordered table-hover table-striped">
									<tr>
										<th>상태</th>
										<th>금액</th>
										<th>날짜</th>
									</tr>
									<c:forEach var="vo" items="${myRefundList}">
										<tr>
											<td>${vo.state}</td>
										<td>${vo.refundCash}</td>
										<td>${vo.date}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
	    </div>
	</div>
</div>
<script>
    function confirmRefund() {
        var cash = document.getElementById("cashInput").value;
        if (cash === "") {
            alert("금액을 입력해주세요.");
            return;
        }
        if (cash % 50000 !== 0) {
            alert("50000원 단위로 입력해주세요.");
            return;
        }
        if (confirm(cash + " 원을 환불하시겠습니까?")) {
            document.getElementById("refundForm").submit();
            alert("환불요청되었습니다."); // 환불요청이 완료되었음을 알리는 알람표시
        }
    }
</script>
</body>
</html>