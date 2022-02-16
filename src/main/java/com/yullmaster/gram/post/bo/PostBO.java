package com.yullmaster.gram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yullmaster.gram.common.FileManagerService;
import com.yullmaster.gram.post.comment.bo.CommentBO;
import com.yullmaster.gram.post.comment.model.Comment;
import com.yullmaster.gram.post.dao.PostDAO;
import com.yullmaster.gram.post.like.bo.LikeBO;
import com.yullmaster.gram.post.model.Post;
import com.yullmaster.gram.post.model.PostDetail;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	// 객체별로 하나씩 등록해야한다
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId, String userLoginId, MultipartFile file, String content) {
		
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, userLoginId, filePath, content);
	}
	
	public List<PostDetail> getPostList(int userId) {
		// post 리스트 가져오기
		// post 대응하는 댓글 좋아요 가져오기
		// post 대응하는 댓글 좋아요 데이터 구조 만들기
		List<Post> postList = postDAO.selectPostlist();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			// 해당하는 post id 로 댓글 가져오기
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			
			int likeCount = likeBO.getLikeCount(post.getId());
			boolean isLike = likeBO.isLike(post.getId(), userId);
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			postDetail.setLikeCount(likeCount);
			postDetail.setLike(isLike);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		
		// return postDAO.selectPostlist();
	}
	
	public int deletePost(int id, int userId) {
		
		return postDAO.deletePost(id, userId);
	}
}
