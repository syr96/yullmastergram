package com.yullmaster.gram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yullmaster.gram.post.bo.PostBO;
import com.yullmaster.gram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/timeline")
	public String timelineView(Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postlist = postBO.getPostList(userId);
		
		model.addAttribute("postList", postlist);
		
		return "post/timeline";
	}
	
	@GetMapping("/history")
	public String historyView() {
		return "post/history";
	}
}
