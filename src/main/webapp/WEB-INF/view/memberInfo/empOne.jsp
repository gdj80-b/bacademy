<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<title>직원상세보기</title>
	<style>
		body {
			padding-top: 56px;
		}
		
		#container {
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
			height: 100%;
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
	</style>
	<script type="text/javascript">
	    $(document).ready(function() {
	    	if(${!empty msgType}) {
	     		$("#messageType").attr("class", "modal-content panel-warning");    
	    		$("#myMessage").modal("show");
	    	}
	    });
 </script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="container-fluid p-0 d-flex">
		<jsp:include page="../include/sideBar.jsp"/>
		<div class="row">
		    <section>
		    	<div class="col-md-5 area1">
					<div style="display: flex; justify-content: center; flex-direction: column; align-items: center;">
						<a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
							<img class="rounded-circle me-2" src="https://storage.googleapis.com/bacademy/${empOneInfo.profileImg}" alt="profile-img">
						</a>
						<p class="mt-2"><string>${empOneInfo.name}<string></p>
						<input type="button" class="btn btn-primary btn-sm mt-2" value="사진 수정" />
					</div>
				</div>
		    	<div class="col-md-5 area1">
					<div class="panel panel-default">
						<div class="panel-heading">강사 정보</div>
						<div class="panel-body">
							<table class="table table-bordered table-hover">
								<tr>
									<td>이메일</td>
									<td>${empOneInfo.email}</td>
								</tr>
								<tr>
									<td>연락처</td>
									<td>${empOneInfo.phoneNum}</td>
								</tr>			          
							</table>
						</div>
					</div>	
				</div>
			</section>
		</div>
		<!--
			ex) session.getAttribute(grade)
			grade = 2 (강사) 강의 목록 YES
			grade = 3 (관리자) 강의 목록 NO
		-->
		<div class="row">
			<div class="col-md-2"></div>
			<section>
				<div class="col-md-10 area1">
					<div class="panel panel-default">
						<div class="panel-heading">강의 목록</div>
						<div class="panel-body">
							<table class="table table-bordered table-hover">
								<tr>
									<td>강의이름</td>
									<td>기간</td>
									<td>요일</td>
									<td>강의료</td>
									<td>상태</td>
								</tr>
								<c:forEach var="lecture" items="${lectureList}">
									<tr>
										<td><a href="lectureOne?lectureNo=${lecture.lectureNo}">${lecture.lectureName}</a></td>
										<td>${lecture.startDate} ~ ${lecture.endDate}</td>
										<td>${lecture.lectureDay}</td>
										<td>${lecture.lecturePrice}</td>
										<td>${lecture.lectureStatus}</td>
									</tr>
								</c:forEach>
							</table>    
						</div>
						<div class="panel-footer">Bacademy</div>
					</div>	
				</div>
			</section>
		</div>
	</div>
	
	<!-- 실패 메세지를 출력(modal) -->
	<div id="myMessage" class="modal fade" role="dialog" >
		<div class="modal-dialog">
		    <!-- Modal content-->
			<div id="messageType" class="modal-content panel-info">
				<div class="modal-header panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">${msgType}</h4>
				</div>
				<div class="modal-body">
					<p>${msg}</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>	
		</div>
	</div>  
</body>
</html>