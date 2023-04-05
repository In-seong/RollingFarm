<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet" href="./resource/css/DeleteMember.css" />
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<jsp:include page="MenuBar.jsp"></jsp:include>
	<div class="container-wrapper">
		<div class="ProFile-wrapper">

			<div class="ProFile-header">
				<div class="ProFile-image"><img src="./upload/<%=session.getAttribute("fileName") %>" style="width: 100%; height: 100%; border-radius: 50%; overflow: hidden;"></div>
				<div class="ProFile-name">
					<h2>${dto.getName() }</h2>
					<a>${dto.getId() }</a>
				</div>
			</div>
			<div class="ProFile-Content">
				<form method="post" action="Delete.do" class="ProFile-DeleteForm">
					<h3>비밀번호 확인</h3>
					<input type="password" placeholder="Password" name="userPassword">
					<%
						String passError = request.getParameter("passError");
						if (passError != null) {
					%>
					<h4 class="error">잘못된 비밀번호 입니다.</h4>
					<%
						}
					%>
					<input type="submit" value="탈퇴하기">
				</form>
			</div>

		</div>
	</div>
</body>
</html>