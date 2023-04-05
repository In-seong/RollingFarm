<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet" href="./resource/css/EditMember.css" />
<script type="text/javascript" src="./resource/js/EditMember.js"></script>
<meta charset="UTF-8">
<title>내 정보 변경</title>
</head>
<body>
<jsp:include page="MenuBar.jsp"></jsp:include>
	<div class="container-wrapper">
		<div class="ProFile-wrapper">
		
			<div class="ProFile-header">
				<div class="ProFile-image"><img src="./upload/<%=session.getAttribute("fileName") %>" style="width:100%; height:100%; hidden; border-radius:50%;"></div>
				<div class="ProFile-name">
					<h2>${dto.getName() }</h2>
					<a>${dto.getId() }</a>
				</div>
			</div>
			
			<div class="ProFile-Content">
				<form method="post" action="Edit.do" class="ProFile-EditForm" encType="multipart/form-data"> 
					<label for="user-image" id="custom-file-upload"><img src="./resource/images/camera.png" style="width: 30px; height: 30px; vertical-align:middle; ">이미지 변경</label>
					<input id="user-image" type="file" name="userImage" multiple="multiple"><br>
					<label>변경할 비밀번호</label>
					<input type="password" name="newPassword" placeholder="변경할 시 입력">
					<label>비밀번호 확인</label>
					<input type="password" name="newPasswordCheck">
					<%
						String passCheck = request.getParameter("check");
						if (passCheck != null) {
					%>
					<h4 class="check" style="color:red">비밀번호가 일치하지 않습니다.</h4>
					<%
						}
					%>
					<label>이름</label>
					<input type="text" name="userName" value="${dto.getName() }">
					<label>전화번호</label>
					<input type="text" name="userTel" value="${dto.getTell() }">
					<label>이메일</label>
					<input type="email" name="userEmail" value="${dto.getEmail() }">
					<input type="submit" value="확인">
					<input type="button" value="취소" onclick="location.href='ProFile.jsp'">
				</form>
			</div>
			
		</div>
	</div>
</body>
</html>