package com.yullmaster.gram.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yullmaster.gram.post.comment.dao.CommentDAO;
import com.yullmaster.gram.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int postId, int userId, String userLoginId, String comment) {
		return commentDAO.insertComment(postId, userId, userLoginId, comment);
	}
	
	// postId 로 댓글 리스트 가져오기
	public List<Comment> getCommentList(int postId) {
		return commentDAO.selectCommentList(postId);
	}
}
