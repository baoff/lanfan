package com.eric.crm.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.eric.crm.domain.Customer;
import com.eric.crm.domain.PageBean;

/**
 * �ͻ�����ҵ���
 * @author eric
 *
 */
public interface CustomerService {
	
	/**
	 * ����ͻ�
	 * @param customer
	 */
	void save(Customer customer);
	
	/**
	 * ��ҳ��ѯ�ͻ���Ϣ
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
