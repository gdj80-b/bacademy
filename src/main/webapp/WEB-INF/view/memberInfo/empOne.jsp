<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원상세보기</title>
	<script>
		document.getElementById('uploadImg').addEventListener('click', function() {
	        document.getElementById('fileInput').click();
	    });
	
	    document.getElementById('fileInput').addEventListener('change', function(event) {
	        const file = event.target.files[0];
	        if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('uploadImg').src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
	    });
	</script>
	<style>
		body {
			padding-top: 56px;
		}
		
		.col {
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.card {
			width: 200px;
		}
		
		.profile-img {
			max-width: 200px;
			max-height: 200px;
			object-fit: cover;
			border-radius: 50%;
		}
		
		img:hover {
			cursor: pointer;
		}
	</style>
</head>
<body>
	<!--
		ex) session.getAttribute(grade)
			grade = 2 (강사) 강의 목록 YES
			grade = 3 (관리자) 강의 목록 NO
	-->
	<jsp:include page="../include/header.jsp"/>
	<div class="container-fluid p-0 d-flex">
		<jsp:include page="../include/sideBar.jsp"/>
		<div class="container-fluid d-flex flex-column justify-content-center p-4">
			<div class="col d-flex align-items-center">
				<table class="table table-bordered table-hover text-center w-25">
					<tr>
						<th>프로필정보</th>
					</tr>
					<tr>
						<td>
							<div class="d-flex justify-content-center">
								<img id="uploadImg" src="https://storage.googleapis.com/bacademy/${empOneInfo.profileImg}" class="profile-img" alt="profile-img">
								<input type="file" id="fileInput" style="display:none;" accept="image/*">
							</div>
						</td>
					</tr>
					<tr>
						<td>${empOneInfo.name}</td>
					</tr>
					<tr>
						<td>${empOneInfo.email}</td>
					</tr>
					<tr>
						<td>${empOneInfo.phoneNum}</td>
					</tr>
				</table>
			</div>
			<div class="col d-flex align-items-start">
				<table class="table table-bordered table-hover">
					<tr class="text-center">
						<th colspan="5">강의목록</th>
					</tr>
					<tr>
						<th>강의이름</th>
						<th>기간</th>
						<th>요일</th>
						<th>강의료</th>
						<th>상태</th>
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