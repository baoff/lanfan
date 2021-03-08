package com.eric.crm.service;

import com.eric.crm.domain.Customer;

/**
 * 客户管理业务层
 * @author eric
 *
 */
public interface CustomerService {
	
	/**
	 * 保存客户
	 * @param customer
	 */
	void save(Customer customer);

}
