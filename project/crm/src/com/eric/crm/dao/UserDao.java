package com.eric.crm.dao;

import com.eric.crm.domain.User;

/**
 * 用户管理的dao
 * @author eric
 *
 */
public interface UserDao extends BaseDao<User>{
	
	User login(User user);
}
