package com.yullmaster.gram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yullmaster.gram.common.FileManagerService;
import com.yullmaster.gram.post.dao.PostDAO;
import com.yullmaster.gram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userLoginId, MultipartFile file, String content) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, userLoginId, filePath, content);
	}
	
	public List<Post> getPostList() {
		return postDAO.selectPostlist();
	}
}
