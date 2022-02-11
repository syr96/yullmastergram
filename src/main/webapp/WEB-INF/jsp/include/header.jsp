<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header class="d-flex justify-content-between bg-light">
		<h1 class="nav"><a href="/post/timeline" class="ml-3 text-dark nav-link">yullmaster-gram</a></h1>
		<div class="d-flex align-items-center">
			<c:choose>
				<c:when test="${not empty userId }">
					<div class="nav">
						<a href="/user/sign_out" class="nav-link text-dark">로그아웃</a>
					</div>
					<div style="width: 50px; height: 50px; overflow: hidden" class="mr-3 rounded-circle">
						<a href="#"> <!-- 내 피드로 이동 -->
							<img src="/static/image/profile.jpg" style="width: 50px; height: auto;">
							<!-- 프로필 사진은 초기 회원가입 시 등록 또는 수정 등록 가능 -->
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="mr-3 nav">
						<a href="/user/signin_view" class="nav-link text-dark">로그인</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</header>