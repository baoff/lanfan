package com.eric.crm.dao;

import com.eric.crm.domain.User;

/**
 * �û������dao
 * @author eric
 *
 */
public interface UserDao {
	
	void save(User user);
	
	User login(User user);
}
