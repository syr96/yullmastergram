package com.yullmaster.gram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yullmaster.gram.user.bo.UserBO;
import com.yullmaster.gram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("email") String email,
			@RequestParam("name") String name,
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {
		
		int count = userBO.signUp(email, name, loginId, password);
		
		Map<String, String> result = new HashMap<>();
				
		if(count == 1) {
			result.put("result", "success");			
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/is_duplicate_id")
	public Map<String, Boolean> isDuplicateId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.isDuplicateId(loginId)) {
			// userBO.isDuplicateId(loginId) == false: 일치하는 아이디가 없다 -> 사용 가능 -> true
			
			result.put("is_duplicate", true);
			
		} else {
			// userBO.isDuplicateId(loginId) == true: 일치하는 아이디가 있다다 -> 사용 불가 -> false
			
			result.put("is_duplicate", false);
			
		}
		
		// result.put("is_duplicate", userBO.isDuplicateId(loginId));
		
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		Map<String, String> result = new HashMap<>();
		User user = userBO.signIn(loginId, password);
		
		if(user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
