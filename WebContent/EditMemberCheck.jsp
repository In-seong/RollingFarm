<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet" href="./resource/css/EditMemberCheck.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="MenuBar.jsp" %>
	<div class="container-wrapper">
		<div class="Check-wrapper">
			<form method="post" action="EditCheck.do" class="passwordCheck-Form">
			<h2>비밀번호를 입력해주세요.</h2>
			<input type="password" name="userPassword">
			<%
				String passError = request.getParameter("passError");
				if (passError != null) {
			%>
				<h4 class="error">잘못된 비밀번호 입니다.</h4>
			<% } %>
			<input type="submit" value="확인">
			</form>
		</div>
	</div>
</body>
</html>