package com.yullmaster.gram.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws IOException {
		
		// 로그인 정보
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI();
		
		// 로그인 상태
		if(session.getAttribute("userId") != null) {
			if(uri.startsWith("/user/")) {
				response.sendRedirect("/post/timeline");
				return false;
			}
		} else {
			if(uri.startsWith("/post/")) {
				response.sendRedirect("/user/signin_view");
				return false;
			}
		}
		return true; // 여기는 true 로 둬야함
	}
	
	@Override
	public void postHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			ModelAndView modelAndView) {
		
	}
	
	@Override
	public void afterCompletion(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			Exception ex) {
		
	}
}
