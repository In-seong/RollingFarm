<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resource/css/AddMember.css" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<script type="text/javascript" src="./resource/js/AddMember.js"></script>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="MenuBar.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="AddMember-wrapper">
			<h2>Rolling Farm</h2>
			<form method="post" action="AddMember.do" id="AddMember-form" encType="multipart/form-data" onsubmit="return onSubmit()">
				<label>아이디</label>
				<input type="text" name="userId" placeholder="ID">
				<label for="passwordInput">비밀번호</label>
				<input type="password" name="userPassword" id="passwordInput" placeholder="Password">
				<label>비밀번호 확인</label>
				<input type="password" name="userPasswordCheck">
				<%
					String passCheck = request.getParameter("addPassCheck");
					if (passCheck != null) {
				%>
					<h4 class="addPassCheck" style="color:red">비밀번호가 일치하지 않습니다.</h4>
				<%
					}
				%>
				<label>이름</label>
				<input type="text" name="userName" placeholder="Name">
				<label>전화번호</label>
				<input type="text" name="userTel" placeholder="숫자만 입력하세요.">
				<label>이메일</label><br>
				<input type="text" name="userEmail" placeholder="@ E-mail" style="width: 70%;">
				<select name="emailDomain">
					<option value="">직접입력</option>
					<option value="@naver.com">naver.com</option>
					<option value="@daum.net">daum.net</option>
					<option value="@gmail.com">gmail.com</option>
				</select>
				<br><input type="submit" value="가입하기" onsubmit="return onSubmit()">
			</form>
		</div>
	</div>
</body>
</html>