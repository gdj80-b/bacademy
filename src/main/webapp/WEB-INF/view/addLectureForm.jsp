<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>김형호</title>
</head>
<body>
	<h1>강의등록</h1>
	<form>
		<div>	
			과목 : 
			<select name="category">
				<option value="HTML/CSS">HTML/CSS</option>
				<option value="JAVA">JAVA</option>
				<option value="Spring">Spring</option>
				<option value="JavaScript">JavaScript</option>
				<option value="React">React</option>
				<option value="Node.Js">Node.js</option>
			</select>
		</div>
		<div>
			강의명 : 
			<input type="text" name="lectureName" required="required">
		</div>
		<div>
			등록자 : 
			<input type="text" name="id" required="required">
		</div>
		<div>
			강의실 : 
			<select name="roomNum">
				<option value="101">101</option>
				<option value="102">102</option>
				<option value="103">103</option>
				<option value="104">104</option>
				<option value="105">105</option>
				<option value="106">106</option>
				<option value="107">107</option>
			</select>
		</div>
		<div>
			시작일 : 
			<input type="date" name="startDate" required="required">
		</div>
		<div>
			종료일 : 
			<input type="date" name="endDate" required="required">
		</div>
		<div>
			강의시간 : 
			<input type="radio" name="lectureTime" value="9시~17시" required="required"> 9시~17시
			<input type="radio" name="lectureTime" value="9시~18시" required="required"> 9시~18시
		</div>
		<div>
			강의일 : 
			<input type="radio" name="lectureDay" value="월수" required="required"> 월수
			<input type="radio" name="lectureDay" value="화목" required="required"> 화목
			<input type="radio" name="lectureDay" value="금" required="required"> 금
		</div>
		<div>
			강의료 : 
			<input type="number" name="lecturePrice" required="required">원
		</div>
		<button type="submit" id="addLecture">등록하기</button>
	</form>
</body>
</html>