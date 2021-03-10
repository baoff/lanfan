package com.eric.crm.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.eric.crm.dao.CustomerDao;
import com.eric.crm.domain.Customer;

public class CustomerDaoImpl extends  BaseDaoImpl<Customer> implements CustomerDao{


}
