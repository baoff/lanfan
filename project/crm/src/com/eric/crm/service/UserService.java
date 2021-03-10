package com.eric.crm.service;

import java.util.List;

import com.eric.crm.domain.User;

/**
 * �û������ҵ���
 * @author eric
 *
 */
public interface UserService {
	
	void regist(User user);
	
	User login(User user);
	
	List<User> findAll();
}
