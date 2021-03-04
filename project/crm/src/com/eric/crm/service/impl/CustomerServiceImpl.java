package com.eric.crm.service.impl;

import com.eric.crm.dao.CustomerDao;
import com.eric.crm.service.CustomerService;

public class CustomerServiceImpl implements CustomerService{
	
	private CustomerDao customerDao;

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	
	

}
