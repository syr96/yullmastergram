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
		<section class="mt-3 d-flex justify-content-center">
			<!-- 글쓰기 start -->
			<article class="col-6">
				<div class="border rounded">
					<div class="m-3">
						<textarea class="form-control border-0 non-resize w-100" rows="5" id="contentInput"></textarea>
						<div class="d-flex justify-content-between m-3">
							<span class="img-icon"><i class="bi bi-image" id="imgBtn"></i></span>
							<input type="file" id="fileInput" class="d-none">
							
							<!--
							사진 등록시 내가 불러온 이미지 미리보기 기능 
							<img src="" id="imgSection" class="w-100">
							<script>
								const reader = new FileReader();
								
								reader.onload = (readerEvent) => {
									document.querySelector("#imgSection").setAttribute("src", readerEvent.target.result);
								};
								document.querySelector("#profileImage").addEventListener("change", (changeEvent) => {
									const imgFile = changeEvent.target.files[0];
									reader.readAsDataURL(imgFile);
								});
							</script>
						 	-->
							
							<button type="button" class="d-none" id="uploadBtn">업로드하기</button>
							<span class="img-icon"><i class="bi bi-upload" id="uploadBtnIcon"></i></span>
						</div>
					</div>
				</div>
			<!-- 글쓰기 end -->
			
			<c:forEach var="postDetail" items="${postList }">
			<!-- 피드 start -->
				<div class="border rounded mt-5">
					<div class="m-3">
					
						<!-- 프로필 사진, 계정, 삭제 start -->
						<div class="d-flex justify-content-between align-items-center">
							<!-- 프로필 사진, 작성자 계정 -->
							<div class="d-flex align-items-center">
								<div class="rounded-circle profile-image">
									<a href="/post/history"> <!-- 게시글 작성자 피드로 이동 -->
										<img src="/static/image/profile.jpg" class="profile">
										<!-- 프로필 사진은 초기 회원가입 시 등록 또는 수정 등록 가능 -->
									</a>
								</div>
								<div class="mr-3 nav">
									<a href="/post/history" class="nav-link text-dark">${postDetail.post.userLoginId }</a> <!-- 게시글 작성자 피드로 이동 -->
								</div>
							</div>
							
							<!-- 삭제 -->
							<c:choose>
								<c:when test="${userId eq postDetail.post.userId }">
									<div>
										<a href="#" class="text-dark nav-link img-icon moreBtn" data-post-id="${postDetail.post.id }" data-toggle="modal" data-target="#exampleModalCenter">
											<i class="bi bi-three-dots-vertical"></i>
										</a>
										<!-- Modal -->
										<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered" role="document">
										    	<div class="modal-content">
										      		<div class="modal-body text-center">
											        	<a href="#" id="deleteBtn" class="nav-link text-dark">삭제하기</a>
											      	</div>
										    	</div>
										  	</div>
										</div>
									</div>
								</c:when>
							</c:choose>
						</div>
						<!-- 프로필 사진, 계정, 삭제 end -->
						
						<!-- 업로드한 사진 -->
						<div class="text-center mt-3">
							<img src="${postDetail.post.imagePath }" class="rounded w-100">
						</div>
						
						<!-- 좋아요 -->
						<div class="d-flex align-items-center nav">
							<a href="#" class="likeBtn nav-link" data-post-id="${postDetail.post.id }">
								<c:choose>
									<c:when test="${postDetail.like }"> <!-- 이거 자체가 true 다 -->
											<i class="bi bi-heart-fill likeIcon text-danger"></i>
									</c:when>
									<c:otherwise>
											<i class="bi bi-heart text-dark likeIcon"></i>
									</c:otherwise>
								</c:choose>
							</a>
							<span class="nav-link">좋아요 ${postDetail.likeCount }개</span>
						</div>
						
						<!-- 계정, content -->
						<div class="m-2">
							<div><b>${postDetail.post.userLoginId }</b> ${postDetail.post.content }</div>
						</div>
						
						<!-- 댓글 start -->
						<hr>
						<div class="m-2">
							<c:forEach var="comment" items="${postDetail.commentList }">
								<div class="mt-2">							
									<b>${comment.userLoginId }</b> ${comment.comment }
								</div>
							</c:forEach>
						</div>
						<!-- 댓글 end -->
						
						<!-- 댓글 쓰기 start -->
						<div class="m-2 d-flex align-items-center">
							<c:choose>
								<c:when test="${not empty userId }">
									<b>${userLoginId }</b>
									<input type="text" class="form-control border-0 bg-light mx-2" id="commentInput${postDetail.post.id }">
									<button class="btn btn-light commentBtn" data-post-id="${postDetail.post.id }">댓글쓰기</button>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>							
						</div>
						<!-- 댓글 쓰기 end -->
					</div>
				</div>
			<!-- 피드 end -->
			</c:forEach>
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
			
			$(".commentBtn").on("click", function() {
				// postId, comment
				let postId = $(this).data("post-id");
				
				// "commentInput5"
				let comment = $("#commentInput" + postId).val();
				
				if(comment == "") {
					alert("댓글을 입력해주세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "comment":comment},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 작성 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
				});
			});
			
			// 좋아요, 좋아요 취소 기능을 하나로 합침
			$(".likeBtn").on("click", function(e) {
				// a 태그의 # 이 가지고있는 고유의 기능을 없애준다
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data) {
						location.reload();
					},
					error:function() {
						alert("좋아요 에러");
					}
				});
			});
			
			/* 좋아요, 좋아요 취소 기능을 나눔
			$(".likeBtn").on("click", function(e) {
				// a 태그의 # 이 가지고있는 고유의 기능을 없애준다
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					},
					error:function() {
						alert("좋아요 에러");
					}
				});
			});
			
			$(".unlikeBtn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/unlike",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "fail") {
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
					},
					error:function() {
						alert("좋아요 취소 에러");
					}
				});
			}); */
			
			$(".moreBtn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				// postId 를 모달의 삭제하기 버튼에 값을 부여한다.
				$("#deleteBtn").data("post-id", postId);
				
			});
			
			$("#deleteBtn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					},
					error:function() {
						alert("삭제 에러");
					}
				});
			});
		});
	</script>
</body>
</html>