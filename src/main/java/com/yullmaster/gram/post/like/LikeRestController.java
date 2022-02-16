package com.yullmaster.gram.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yullmaster.gram.post.like.bo.LikeBO;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
//	좋아요, 좋아요 취소 기능을 하나로 합침
	@GetMapping("/post/like")
	public Map<String, Boolean> like(
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId"); // 원래 형태로 다운 캐스팅 해야함
		boolean isLike = likeBO.like(postId, userId);
		
		// 좋아요 {"isLike":true}
		// 좋아요 취소 {"isLike":false}
		Map<String, Boolean> result = new HashMap<>();
//		if(count == 1) {
//			result.put("isLike", true);
//		} else {
//			result.put("isLike", false);
//		}
		
		result.put("isLike", isLike);
		
		return result;
	}
	
	
//	좋아요, 좋아요 취소 기능을 나눔
//	@GetMapping("/post/like")
//	public Map<String, String> like(
//			@RequestParam("postId") int postId,
//			HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		int userId = (Integer)session.getAttribute("userId"); // 원래 형태로 다운 캐스팅 해야함
//		int count = likeBO.addLike(postId, userId);
//		
//		Map<String, String> result = new HashMap<>();
//		
//		if(count == 1) {
//			result.put("result", "success");
//		} else {
//			result.put("result", "fail");
//		}
//		
//		return result;
//	}
//	
//	@GetMapping("/post/unlike")
//	public Map<String, String> unlike(
//			@RequestParam("postId") int postId,
//			HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		int userId = (Integer)session.getAttribute("userId");
//		int count = likeBO.deleteLike(postId, userId);
//		
//		Map<String, String> result = new HashMap<>();
//		
//		if(count == 0) { // 삭제가 안된 경우
//			result.put("result", "fail");
//		} else { // 삭제가 된 경우. 1 외에도 다른 숫자가 있을 수 있다.
//			result.put("result", "success");
//		}
//		
//		return result;
//	}
}
