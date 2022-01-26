package com.yullmaster.gram.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yullmaster.gram.user.bo.UserBO;

@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	public Map<String, String> signUp(
			@RequestParam("email") String email,
			@RequestParam("name") String name,
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {
		
		int count = userBO.addUser(email, name, loginId, password);
		
	}
}
