package com.eric.crm.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.eric.crm.dao.CustomerDao;
import com.eric.crm.domain.Customer;
import com.eric.crm.domain.PageBean;
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

	@Override
	public PageBean<Customer> findByPage(DetachedCriteria detachedCriteria, Integer currentPage, Integer pageSize) {
		PageBean<Customer> pageBean = new PageBean<Customer>();
		//封装当前的页数
		pageBean.setCurrentPage(currentPage);
		//封装每页显示记录数
		pageBean.setPageSize(pageSize);
		//封装总记录数
		Integer totalCount = customerDao.findCount(detachedCriteria);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalCount/pageSize);
		if(totalCount % pageSize != 0){
			pageBean.setTotalPage(totalCount/pageSize + 1 );
		}
		Integer begin =(currentPage -1 ) * pageSize;
		List<Customer> list = customerDao.findByPage(detachedCriteria,begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public Customer findById(Long custId) {
		return customerDao.findById(custId);
	}

	@Override
	public void delete(Customer customer) {
		customerDao.delete(customer);
	}

	@Override
	public void update(Customer customer) {
		customerDao.update(customer);
		
	}

	@Override
	public List<Customer> findAll() {
		return customerDao.findAll();
	}
	
	

}
