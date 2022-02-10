<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yullmaster-gram 타임라인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="mt-3">
			<article class="d-flex justify-content-center">
				<div class="border rounded col-6">
					<textarea class="form-control mt-3 border-0 non-resize" rows="5" id="contentInput"></textarea>
					<div class="d-flex justify-content-between m-3">
						<span class="img-icon"><i class="bi bi-image" id="imgBtn"></i></span>
						<input type="file" id="fileInput" class="d-none">
						<button type="button" class="d-none" id="uploadBtn">업로드하기</button>
						<span class="img-icon"><i class="bi bi-upload" id="uploadBtnIcon"></i></span>
					</div>
				</div>
			</article>
			<article class="d-flex justify-content-center mt-5">
				<div class="border rounded col-6">
					<div class="d-flex justify-content-between m-3">
						<div class="d-flex align-items-center">
							<div style="width: 50px; height: 50px; overflow: hidden" class="mr-3 rounded-circle">
								<img src="/static/image/profile.jpg" style="width: 50px; height: auto;">
							</div>
							<div class="mr-3">${userName }<a href="#"></a></div>
						</div>
						<button type="button" class="d-none" id="deleteContentBtn">삭제</button>
						<span class="img-icon"><i class="bi bi-trash" id="deleteContentBtnIcon"></i></span>
					</div>
				</div>
			</article>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script>
		$(document).ready(function() {
			
			$("#imgBtn").on("click", function() {
				// fileInput 클릭 효과
				$("#fileInput").click();
				
			});
			
			$("#uploadBtnIcon").on("click", function() {
				// uploadBtn 클릭 효과
				$("#uploadBtn").click();
				
			});
			
			$("#deleteContentBtnIcon").on("click", function() {
				// deleteContentBtn 클릭 효과
				$("#deleteContentBtn").click();
			});
			
			$("#uploadBtn").on("click", function() {
				let content = $("#contentInput").val().trim();
				
				if(content == "") {
					alert("내용을 입력하세요");
					return;
				}
				
				// 파일 유효성 검사
				// 파일이 선택 되었는지 확인한다
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/post/create",
					data:formData,
					enctype:"mutipart/form-data", // 파일 업로드 필수
					processData:false, // 파일 업로드 필수
					contentType:false, // 파일 업로드 필수
					success:function(data) {
						if(data.result == "success") {
							location.reload(); // 새로고침하는 메소드
						} else {
							alert("업로드 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
				});
			});
		});
	</script>
</body>
</html>