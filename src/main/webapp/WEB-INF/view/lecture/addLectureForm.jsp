<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>강의 등록 폼</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		/* 사이드바 */
		.sidenav {
			background-color: #f1f1f1;
			position: fixed;
			width: 188px;
			height: 100%;
			margin-left: -20px;
			margin-top: -20px
		}
		/* 본문 */
		.page {
			margin-top: 50px;
			margin-left: 250px;
		}
		
		td, th{
			text-align: center;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
    	if(${!empty msgType}){
     		$("#messageType").attr("class", "modal-content panel-warning");
    		$("#myMessage").modal("show");
    	}
    });
    function lectureConfirm(){
    	
    	var startDate=$("#startDate").val();
    	var endDate=$("#endDate").val();
		var lectureDay=$("input[name='lectureDay']:checked").val();
    	var roomNum=$("#roomNum").val();
    	var id=$("#id").val();
    	$.ajax({
    		url : "${contextPath}/lectureConfirm",
    		type : "get",
    		data : { "startDate" : startDate, "endDate" : endDate, "lectureDay" : lectureDay, "roomNum" : roomNum, "id" : id},
    		success : function(result){
    		   // 중복유무 출력(result=1 : 등록 가능한 강의, 0 : 등록할 수 없는 강의)
    			if(result==1){
    				alert("등록 가능한 강의입니다.");
    				$("#checkMessage").html("등록 가능한 강의입니다.");
    				$("#checkType").attr("class","modal-content panel-success");
    			}else{
    				alert("등록할 수 없는 강의입니다.");
    				$("#checkMessage").html("등록할 수 없는 강의입니다."); 
    				$("#checkType").attr("class","modal-content panel-warning");
    			}
    			$("#myModal").modal("show");
			},    	   
			error : function(){ alert("작성되지 않은 항목이 있습니다."); }
    	});    	
    }  
	</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${contextPath}/">Bacademy</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${contextPath}/">Home</a></li>
					<li><a href="boardMain.do">게시판</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${contextPath}/memLoginForm.do"><span
							class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
					<li><a href="${contextPath}/memJoin.do"><span
							class="glyphicon glyphicon-user"></span> 회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<!-- 사이드바 -->
		<nav class="col-sm-3 sidenav">
			<a href="#"
				class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
				id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
				<img src="https://github.com/mdo.png" alt="" width="32" height="32"
				class="rounded-circle me-2"> <strong>mdo</strong>
			</a>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="${contextPath}/noticeList">공지사항</a></li>
				<li><a href="${contextPath}/boardList">게시판</a></li>
				<li><a href="#">강의목록</a></li>
				<li><a href="#">직원목록</a></li>
			</ul>
		</nav>
		<!-- 사이드바 끝 -->
		<!-- 본문 -->
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">강의등록</div>
					<!-- <div class="col-sm-9 page">  -->
					<div class="panel-body">
						<form action="/lecture/addLecture" method="post">
							<table class="table table-bordered table-hover">
								<tr>
									<th>과목</th>
									<td>
										<select name="categoryNo">
											<option value="1">HTML/CSS</option>
											<option value="2">JAVA</option>
											<option value="3">Spring</option>
											<option value="4">JavaScript</option>
											<option value="5">React</option>
											<option value="6">Node.js</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>강의명</th>
									<td><input type="text" name="lectureName" required="required" size="50px"></td>
								</tr>
								<tr>
									<th>강사</th>
									<td>
										<select name="id" id="id">
											<option value="blue">송은택</option>
											<option value="green">장동준</option>
											<option value="navy">류성완</option>
											<option value="orange">김태균</option>
											<option value="purple">윤혜정</option>
											<option value="red">박민아</option>
											<option value="teacher">강사</option>
											<option value="white">최유리</option>
											<option value="yellow">김예리</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>시작일</th>
									<td><input type="date" id="startDate" name="startDate" required="required"></td>
								</tr>
								<tr>
									<th>종료일</th>
									<td><input type="date" id="endDate" name="endDate" required="required"></td>
								</tr>
								<tr>
									<th>강의요일</th>
									<td>
										<input type="radio" id="lectureDay" name="lectureDay" value="월수" required="required"> 월수
										<input type="radio" id="lectureDay" name="lectureDay" value="화목" required="required"> 화목
										<input type="radio" id="lectureDay" name="lectureDay" value="금" required="required"> 금
									</td>
								</tr>
								<tr>
									<th>강의시간</th>
									<td>
										<input type="radio" name="lectureTime" value="9시-17시" required="required"> 9시-17시
										<input type="radio" name="lectureTime" value="9시-18시" required="required"> 9시-18시
									</td>
								</tr>
								<tr>
									<th>강의실</th>
									<td>
										<select name="roomNum" id="roomNum">
											<option value="101">101</option>
											<option value="102">102</option>
											<option value="103">103</option>
											<option value="104">104</option>
											<option value="105">105</option>
											<option value="106">106</option>
											<option value="107">107</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>강의료</th>
									<td><input type="number" name="lecturePrice" required="required">원</td>
								</tr>
							</table>
							<button type="button" class="btn btn-primary" onclick="lectureConfirm()">등록확인</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</form>
					</div>
				</div>
			</div>
	</div>
</body>
</html>