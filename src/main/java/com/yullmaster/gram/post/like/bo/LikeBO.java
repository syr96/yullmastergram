package com.yullmaster.gram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yullmaster.gram.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int postId, int userId) {
		return likeDAO.insertLike(postId, userId);
	}
	
	// postId 로 좋아요 개수 조회
	public int getLikeCount(int postId) {
		return likeDAO.selectLikeCount(postId);
	}
	
	// postId 와 userId 로 좋아요 여부 확인
	public boolean isLike(int postId, int userId) {
		int count = likeDAO.selectLikeCountByUserId(postId, userId);
		
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
