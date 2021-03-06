package com.eric.crm.service;

import java.util.List;

import com.eric.crm.domain.User;

/**
 * 用户管理的业务层
 * @author eric
 *
 */
public interface UserService {
	
	void regist(User user);
	
	User login(User user);
	
	List<User> findAll();
}
