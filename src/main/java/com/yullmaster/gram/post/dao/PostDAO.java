package com.yullmaster.gram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yullmaster.gram.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId,
			@Param("userLoginId") String userLoginId,
			@Param("imagePath") String imagePath,
			@Param("content") String content);
	
	public List<Post> selectPostlist();
	
	public int deletePost(
			@Param("id") int id,
			@Param("userId") int userId);
}
