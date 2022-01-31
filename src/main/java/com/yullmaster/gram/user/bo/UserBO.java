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
	
	public int signUp(String email, String name, String loginId, String password) {
		
		String encPassword = EncryptUtils.md5(password);
		
		if(encPassword.equals("")) {
			
			return 0;
			
		}
		
		return userDAO.insertUser(email, name, loginId, encPassword);
	}
	
	public boolean isDuplicateId(String loginId) {
		
		if(userDAO.selectCountById(loginId) == 0) { // 0 이면 값이 없다는 뜻 -> 일치하는 아이디가 없다는 뜻
			
			return false;
			
		} else {
			
			return true;
			
		}
		
		// return (userDAO.selectCountById(loginId) != 0);
		// 0 이 아니면 일치하는 아이디가 있다는 뜻이 된다
		
	}
	
	public User signIn(String loginId, String password) {
		
		// 비밀번호를 암호화 하고 DAO 로 전달한다.
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUserByIdPassword(loginId, encPassword);
	}
}
