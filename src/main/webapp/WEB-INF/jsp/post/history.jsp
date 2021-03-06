<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yullmaster-gram 히스토리</title>
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
		<section class="d-flex justify-content-center mt-3">
			<article class="col-6 border rounded">
				<div class="d-flex align-items-center m-3">
					<div class="rounded-circle profile-image">
						<a href="/post/history"> <!-- 내 피드로 이동 -->
							<img src="/static/image/profile.jpg" class="profile">
							<!-- 프로필 사진은 초기 회원가입 시 등록 또는 수정 등록 가능 -->
						</a>
					</div>
					<ul class="ml-3 list-unstyled">
						<li><a href="/post/history" class="nav-link text-dark p-0"><b>${userName }</b></a></li>
						<li><a href="/post/history" class="nav-link text-dark p-0 mt-1"><b>${userLoginId }</b></a> <!-- 게시글 작성자 피드로 이동 --></li>
					</ul>					
				</div>
				<div>
					<a href="#" class="btn btn-light btn-block">프로필 편집</a>
				</div>
					<div class="mt-3">
						<c:forEach var="postDetail" items="${postList }">
							<c:when test="${userId eq postDetail.post.userId }">
								<div>
									<img src="${postDetail.post.imagePath }">
								</div>
							</c:when>
						</c:forEach>
					</div>
			</article>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>