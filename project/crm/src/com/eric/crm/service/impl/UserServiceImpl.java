package com.eric.crm.service.impl;

import org.springframework.transaction.annotation.Transactional;

import com.eric.crm.dao.UserDao;
import com.eric.crm.domain.User;
import com.eric.crm.service.UserService;
import com.eric.crm.utils.MD5Utils;

@Transactional
public class UserServiceImpl implements UserService{

	private UserDao userDao;
	

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	@Override
	public void regist(User user) {
		user.setUserPassword(MD5Utils.md5(user.getUserPassword()));
		user.setUserState(1);
		userDao.save(user);
	}


	@Override
	public User login(User user) {
		user.setUserPassword(MD5Utils.md5(user.getUserPassword()));
		return userDao.login(user);
	}
	
}
