<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yullmaster-gram 회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">	
		<section class="mt-3 d-flex justify-content-center align-items-center">
			<div class="mr-3 my-3">
				<img src="/static/image/phone_instar.png" width=350px>
			</div>
			<div class="ml-3 p-4 border rounded">
				<h1><a href="/user/signin_view" class="text-dark nav-link">yullmaster-gram</a></h1>
				<div class="mt-3 text-secondary text-center">친구들의 사진과 동영상을 보려면
				<br>가입하세요.</div>
				<hr>
				<form id="signUpForm">
					<input type="text" class="form-control" placeholder="이메일" id="emailInput">
					<input type="text" class="form-control mt-3" placeholder="이름" id="nameInput">
					<div class="input-group mt-3">
						<input type="text" class="form-control" placeholder="아이디" id="loginIdInput">
						<button type="button" class="btn btn-info" id="isDuplicateBtn">중복확인</button>
					</div>
					<div id="duplicateDiv" class="d-none"><small class="text-danger">중복된 ID 입니다.</small></div>
					<div id="noneDuplicateDiv" class="d-none"><small class="text-success">사용 가능한 ID 입니다.</small></div>
					<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
					<input type="password" class="form-control mt-3" placeholder="비밀번호 확인" id="passwordConfirmInput">
					<small id="errorPassword" class="text-danger d-none">비밀번호가 일치하지 않습니다.</small>
					
					<div class="input-group mt-3">
						<input type="text" id="fileName" placeholder="프로필사진" class="form-control">
						<label class="btn btn-info">
							사진 추가<input type="file" style="display:none" id="uploadFile" name="uploadFile" onchange="javascript:document.getElementById('fileName').value=this.value">
						</label>
					</div>
					
					<button type="submit" class="btn btn-info btn-block mt-3" id="signUpBtn">가입하기</button>
				</form>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
		$(document).ready(function() {
			
			// 1. 중복확인을 눌렀는지 안눌렀는지의 변수
			// 2. 중복이 되었는지 안되었는지의 변수
			// 두 조건 모두 true 일 때 가입하기가 성립된다
			
			var isIdCheck = false;
			var isDuplicateId = true;
			
			// 아이디에 입력이 있을 경우, 중복 체크 상태를 초기화 한다
			$("#loginIdInput").on("input", function() {
				$("#duplicateDiv").addClass("d-none");
				$("#noneDuplicateDiv").addClass("d-none");
				isIdCheck = false;
				isDuplicateId = true;
			});
			
			$("#signUpForm").on("submit", function(e) {
				
				e.preventDefault();
				
				var email = $("#emailInput").val().trim();
				var name = $("#nameInput").val().trim();
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
				
				// 중복체크 했는지 확인
				if(isIdCheck == false) {
					alert("중복체크를 진행하세요");
					return;
				}
				
				// 중복이 되었는지 안되었는지?
				if(isDuplicate == true) {
					alert("아이디가 중복되었습니다.")
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"email":email, "name":name, "loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success") {
							alert("회원가입 완료"
									+ "\n이름: " + name
									+ "\n아이디: " + loginId);
							location.href = "/user/signin_view";
						} else {
							alert("회원가입 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
				});
				
			});
			
			$("#isDuplicateBtn").on("click", function() {
				var loginId = $("#loginIdInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/user/is_duplicate_id",
					data:{"loginId":loginId},
					success:function(data) {
						isIdCheck = true;
						
						if(data.is_duplicate) {
							isDuplicate = true;
							$("#duplicateDiv").removeClass("d-none");
							$("#noneDuplicateDiv").addClass("d-none");
						} else {
							isDuplicate = false;
							$("#duplicateDiv").addClass("d-none");
							$("#noneDuplicateDiv").removeClass("d-none");
						}
						// isDuplicate = data.is_duplicate;
					},
					error:function(e){
						alert("중복확인 실패");
					}
				});
			});
		});
	</script>
</body>
</html>