package com.yullmaster.gram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yullmaster.gram.user.bo.UserBO;

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
		
		int count = userBO.addUser(email, name, loginId, password);
		
		Map<String, String> result = new HashMap<>();
				
		if(count == 1) {
			result.put("result", "success");			
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	@PostMapping("/is_duplicate_id")
	public Map<String, Boolean> checkId() {
		
	}
}
