package com.eric.crm.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.eric.crm.dao.CustomerDao;
import com.eric.crm.domain.Customer;

public class CustomerDaoImpl extends  HibernateDaoSupport implements CustomerDao{

	@Override
	public void save(Customer customer) {
		this.getHibernateTemplate().save(customer);
	}

}
