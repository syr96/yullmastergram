package com.yullmaster.gram.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yullmaster.gram.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("userLoginId") String userLoginId,
			@Param("comment") String comment);
	
	public List<Comment> selectCommentList(@Param("postId") int postId);
	
	public int deleteComment(@Param("postId") int postId);
}
