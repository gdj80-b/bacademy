<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����ȣ</title>
</head>
<body>
	<h1>���ǵ��</h1>
	<form>
		<div>	
			���� : 
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
			���Ǹ� : 
			<input type="text" name="lectureName" required="required">
		</div>
		<div>
			����� : 
			<input type="text" name="id" required="required">
		</div>
		<div>
			���ǽ� : 
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
			������ : 
			<input type="date" name="startDate" required="required">
		</div>
		<div>
			������ : 
			<input type="date" name="endDate" required="required">
		</div>
		<div>
			���ǽð� : 
			<input type="radio" name="lectureTime" value="9��~17��" required="required"> 9��~17��
			<input type="radio" name="lectureTime" value="9��~18��" required="required"> 9��~18��
		</div>
		<div>
			������ : 
			<input type="radio" name="lectureDay" value="����" required="required"> ����
			<input type="radio" name="lectureDay" value="ȭ��" required="required"> ȭ��
			<input type="radio" name="lectureDay" value="��" required="required"> ��
		</div>
		<div>
			���Ƿ� : 
			<input type="number" name="lecturePrice" required="required">��
		</div>
		<button type="submit" id="addLecture">����ϱ�</button>
	</form>
</body>
</html>