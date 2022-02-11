package com.yullmaster.gram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yullmaster.gram.post.bo.PostBO;
import com.yullmaster.gram.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/timeline")
	public String timelineView(Model model) {
		
		List<Post> postlist = postBO.getPostList();
		
		model.addAttribute("postList", postlist);
		
		return "post/timeline";
	}
}
