<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>강사등록 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	// 아이디 중복 확인 검사
	function idCheck() {
		var id = $("#id").val();
		$.ajax({
			url : "checkId",
			type : "get",
			data : {"id" : id},
			success : function(result) {
				if (result == 1) {
					alert("사용할 수 있는 아이디입니다.");
				} else {
					alert("사용할 수 없는 아이디입니다.");
				}
			},
			error : function() {
				alert("error");
			}
		});
	}

	// 비밀번호 확인 검사
	function passwordCheck() {
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		if (pw != pwCheck) {
			$("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
		} else {
			$("#passMessage").html("비밀번호가 일치합니다.");
			$("#password").val(pw);
		}   	
	}

	$(document).ready(function() {
		// 연도 셀렉트 박스 생성
		for (var i = 1940; i <= 2022; i++) {
			$('#birth-year').append($('<option>', {
				value: i, text: i
			}));
		}

		// 월 셀렉트 박스 생성
		for (var i = 1; i <= 12; i++) {
			$('#birth-month').append($('<option>', {
				value: i, text: i
			}));
		}

		// 일 셀렉트 박스 생성
		for (var i = 1; i <= 31; i++) {
			$('#birth-day').append($('<option>', {
				value: i, text: i
			}));
		}

		var formData = {
			'birth-year': $('#birth-year').val(),
			'birth-month': $('#birth-month').val(),
			'birth-day': $('#birth-day').val()
		};
	});
</script>
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="card-header">강사등록</div>
			<div class="card-body">
				<form action="addTeacher" method="post" enctype="multipart/form-data">
					<input type="hidden" id="password" name="password" value=""/>
					<table class="table table-bordered table-hover">
						<tr>
							<td>프로필이미지</td>
							<!-- <td colspan="2"><input type="file" name="profileImg"></td> -->
							<td colspan="2"><input type="text" name="profileImg"></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" id="id" name="id" placeholder="아이디를 입력하세요."></td>
							<td><button type="button" class="btn btn-primary btn-sm" onclick="idCheck()">중복확인</button></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td colspan="2"><input type="password" id="pw" name="pw" onkeyup="passwordCheck()" placeholder="비밀번호를 입력하세요."></td>
						</tr>
						<tr>
							<td>비밀번호확인</td>
							<td colspan="2"><input type="password" id="pwCheck" name="pwCheck" onkeyup="passwordCheck()" placeholder="비밀번호를 확인하세요."></td>
						</tr>
						<tr>
							<td>이름</td>
							<td colspan="2"><input type="text" name="name" placeholder="이름을 입력하세요."></td>
						</tr>
						<tr>
							<td>성별</td>
							<td colspan="2">
								<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
									<input class="btn-check" type="radio" name="gender" id="male" autocomplete="off" value="남자" checked/>
									<label class="btn btn-primary btn-sm" for="male">남자</label>
									<input class="btn-check" type="radio" name="gender" id="female" autocomplete="off" value="여자"/>
									<label class="btn btn-primary btn-sm" for="female">여자</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td colspan="2">
								<select id="birth-year" name="birth-year"><option>YYYY</option></select>
								<select id="birth-month" name="birth-month"><option>MM</option></select>
								<select id="birth-day" name="birth-day"><option>DD</option></select>
							</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td colspan="2"><input type="text" name="phoneNum" placeholder="번호만 입력하세요."></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td colspan="2"><input type="text" name="email" placeholder="이메일을 입력하세요."></td>
						</tr>
						<tr>
							<td colspan="3">
								<div class="d-md-flex justify-content-md-end" style="text-align: left;">
									<span id="passMessage" style="color: red;"></span>
									<button type="button" class="btn btn-primary btn-sm">등록</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>