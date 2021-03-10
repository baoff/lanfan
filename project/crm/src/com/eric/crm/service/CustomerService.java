package com.eric.crm.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.eric.crm.domain.Customer;
import com.eric.crm.domain.PageBean;

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
	
	/**
	 * 分页查询客户信息
	 * @param detachedCriteria
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	PageBean<Customer> findByPage(DetachedCriteria detachedCriteria,Integer currentPage, Integer pageSize);
	
	Customer findById(Long custId);
	
	void delete(Customer customer);
	
	void update(Customer customer);

	List<Customer> findAll();
}
