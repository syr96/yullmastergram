package com.yullmaster.gram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yullmaster.gram.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String email, String name, String loginId, String password) {
		return userDAO.insertUser(email, name, loginId, password);
	}
}
