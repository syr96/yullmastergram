<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yullmaster 회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
	
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
		<section class="d-flex justify-content-center align-items-center">
			<div class="mr-3 pt-3">
				<img src="/static/image/phone_instar.png" width=300px>
			</div>
			<div class="ml-3 bg-light p-3">
				<div class="text-secondary text-center">친구들의 사진과 동영상을 보려면
				<br>가입하세요.</div>
				<hr>
				<input type="text" class="form-control" placeholder="이메일" id="emailInput">
				<input type="text" class="form-control mt-3" placeholder="이름" id="nameInput">
				<div class="input-group mt-3">
					<input type="text" class="form-control" placeholder="아이디" id="loginIdInput">
					<button type="button" class="btn btn-info" id="doubleCheckLoginId">중복확인</button>
				</div>
				<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
				<input type="password" class="form-control mt-3" placeholder="비밀번호 확인" id="passwordConfirmInput">
				
				<button type="button" class="btn btn-info btn-block mt-3" id="joinBtn">가입하기</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#joinBtn").on("click", function() {
				var email = $("#emailInput").val();
				var name = $("#nameInput").val();
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				
				if(email == "") {
					alert("이메일을 입력하세요");
					return;
				}
				
				if(name == "") {
					alert("이름을 입력하세요");
					return;
				}
				
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지않습니다");
					return;
				}
				
				
			});
		});
	</script>
</body>
</html>