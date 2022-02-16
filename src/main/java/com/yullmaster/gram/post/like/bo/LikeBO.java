package com.yullmaster.gram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yullmaster.gram.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

//	1. 좋아요, 좋아요 취소 직관적으로 설계하는 방법
//	public int addLike(int postId, int userId) {
//		return likeDAO.insertLike(postId, userId);
//	}
//	
//	public int deleteLike(int postId, int userId) {
//		return likeDAO.deleteLike(postId, userId);
//	}
	
	
//	2. 좋아요, 좋아요 취소 한번에 처리하는 방법
	// 리턴
	// 좋아요: true
	// 좋아요 취소: false
	public boolean like(int postId, int userId) {
		
		// 전달 받은 데이터를 기반으로 좋아요 상태이면 좋아요 취소 - delete
		// 좋아요 아닌 상태면 좋아요 - insert
		
		if(this.isLike(postId, userId)) { // 좋아요 상태 -> 좋아요 취소 로 만들기
			likeDAO.deleteLike(postId, userId);
			return false;
		} else { // 좋아요 아닌 상태 -> 좋아요 로 만들기
			likeDAO.insertLike(postId, userId);
			return true;
		}
	}
	
	
	// postId 로 좋아요 개수 조회
	public int getLikeCount(int postId) {
		return likeDAO.selectLikeCount(postId);
	}
	
	// postId 와 userId 로 좋아요 여부 확인
	public boolean isLike(int postId, int userId) {
		
//		int count = likeDAO.selectLikeCountByUserId(postId, userId);
		
//		방법 1
//		if(count == 0) {
//			return false;
//		} else {
//			return true;
//		}
//		
//		방법 2
//		return !(count == 0);
		
		return !(likeDAO.selectLikeCountByUserId(postId, userId) == 0);
	}
}
