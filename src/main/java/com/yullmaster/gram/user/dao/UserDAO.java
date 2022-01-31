package com.yullmaster.gram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yullmaster.gram.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(
			@Param("email") String email,
			@Param("name") String name,
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	public int selectCountById(@Param("loginId") String loginId);
	// mapper에서 가져온 값을 int 로 불러온다
	
	public User selectUserByIdPassword(
			@Param("loginId") String loginId,
			@Param("password") String password);
}
