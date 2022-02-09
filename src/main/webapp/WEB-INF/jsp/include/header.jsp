<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header class="d-flex justify-content-between bg-light">
		<h1><a href="/post/timeline" class="ml-3 text-decoration-none text-dark">yullmaster-gram</a></h1>
		<div class="d-flex align-items-center">
			<c:choose>
				<c:when test="${not empty userId }">
					<div class="mr-3">${userName }님 <a href="/user/sign_out">로그아웃</a></div>
					<div style="width: 50px; height: 50px; overflow: hidden" class="mr-3 rounded-circle">
						<img src="/static/image/profile.jpg" style="width: 50px; height: auto;">
					</div>
				</c:when>
				<c:otherwise>
					<div class="mr-3"><a href="/user/signin_view">로그인</a></div>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
	<script>
		
	</script>