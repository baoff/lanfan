package com.eric.crm.service.impl;

import org.springframework.transaction.annotation.Transactional;

import com.eric.crm.dao.CustomerDao;
import com.eric.crm.domain.Customer;
import com.eric.crm.service.CustomerService;

@Transactional
public class CustomerServiceImpl implements CustomerService{
	
	private CustomerDao customerDao;

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	@Override
	public void save(Customer customer) {
		this.customerDao.save(customer);
	}
	
	

}
