<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사등록 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	//프로필 이미지 미리보기
	$(document).ready(function() {
		$("#profileImg").change(function() {
			var file = this.files[0];
			if (file) {
				var reader = new FileReader();
	            reader.onload = function(event){
	                var img = new Image();
	                img.src = event.target.result;
	                img.onload = function(){
	                    var canvas = document.createElement('canvas');
	                    var ctx = canvas.getContext('2d');
	                    var MAX_WIDTH = 400; // 원하는 최대 너비
	                    var MAX_HEIGHT = 300; // 원하는 최대 높이
	                    var width = img.width;
	                    var height = img.height;
	                    if (width > height) {
	                        if (width > MAX_WIDTH) {
	                            height *= MAX_WIDTH / width;
	                            width = MAX_WIDTH;
	                        }
	                    } else {
	                        if (height > MAX_HEIGHT) {
	                            width *= MAX_HEIGHT / height;
	                            height = MAX_HEIGHT;
	                        }
	                    }
	                    canvas.width = width;
	                    canvas.height = height;
	                    ctx.drawImage(img, 0, 0, width, height);
	                    $('#preview').html('<img src="' + canvas.toDataURL('image/jpeg') + '">');
	                }
	            }
				reader.readAsDataURL(file);
			}
		});
	});

	// 아이디 중복 확인 검사
	function idCheck() {
		var id = $("#id").val();
		$.ajax({
			url : "checkId",
			type : "GET",
			data : {"id" : id},
			success : function(result) {
				if (result == 1) {
					alert("사용할 수 있는 아이디입니다.");
				} else {
					alert("사용할 수 없는 아이디입니다.");
				}
			},
			error : function(e) {
				alert(e);
			}
		});
	}

	// 비밀번호 유효성(확인) 검사
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
	
	// 연락처 유효성 검사
	function oninputPhone(target) {
    	target.value = target.value
       	.replace(/[^0-9]/g, '')
       	.replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	
	// 생년월일 셀렉트 박스
	$(document).ready(function() {
		for (var i = 1970; i <= 2005; i++) { // 년 
			$('#birth-year').append($('<option>', {
				value: i, text: i
			}));
		}
	
		for (var i = 1; i <= 12; i++) { // 월
			$('#birth-month').append($('<option>', {
				value: i, text: i
			}));
		}
	
		for (var i = 1; i <= 31; i++) { // 일
			$('#birth-day').append($('<option>', {
				value: i, text: i
			}));
		}
	});
</script>
</head>
<body>
	<jsp:include page="include/header.jsp"/>
	<div class="container">
		<div class="card">
			<div class="card-header">강사등록</div>
			<div class="card-body">
				<form id="addTeacherForm" name="addTeacherForm" action="addTeacher" method="post" enctype="multipart/form-data">
					<input type="hidden" id="password" name="password" value=""/>
					<table class="table table-bordered table-hover">
						<tr>
							<td>프로필이미지</td>
							<td colspan="2">
								<div id="preview"></div><input id="profileImg" type="file" name="profileImg">
							</td>
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
							<td>비밀번호확인<div id="passMessage" style="color: red;"></div></td>
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
									<input class="btn-check" type="radio" name="gender" id="male" autocomplete="off" value="남" checked/>
									<label class="btn btn-primary btn-sm" for="male">남자</label>
									<input class="btn-check" type="radio" name="gender" id="female" autocomplete="off" value="여"/>
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
									<button type="submit" class="btn btn-primary btn-sm" onclick="imageUpload()">등록</button>
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