package com.yullmaster.gram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yullmaster.gram.common.EncryptUtils;
import com.yullmaster.gram.user.dao.UserDAO;
import com.yullmaster.gram.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String email, String name, String loginId, String password) {
		
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(email, name, loginId, encPassword);
	}
	
	public User getUserId(String loginId) {
		
		return userDAO.selectUserId(loginId);
	}
}
