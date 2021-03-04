package com.eric.crm.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.eric.crm.dao.UserDao;
import com.eric.crm.domain.User;

/**
 * 用户管理的dao实现类
 * @author eric
 *
 */
public class UserDaoImpl extends HibernateDaoSupport implements UserDao{

	@Override
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	@Override
	public User login(User user) {
		List<User> users = (List<User>) this.getHibernateTemplate().find("from User where user_code = ? and user_password =? ",
			user.getUserCode(),user.getUserPassword());
		if(users.size() > 0 ){
			return users.get(0);
		}
		return null;
	}
	
	

}
