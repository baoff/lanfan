package com.eric.crm.web.action;

import com.eric.crm.domain.Customer;
import com.eric.crm.service.CustomerService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * �ͻ�����action
 * @author eric
 *
 */
public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{
	
	private Customer customer = new Customer();
	
	@Override
	public Customer getModel() {
		return customer;
	}
	
	private CustomerService customerService;

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	/**
	 * �ͻ���ӽ���
	 * @return
	 */
	public String saveUI(){
		return "saveUI";
	}
	
	/**
	 * ����ͻ�
	 * @return
	 */
	public String save(){
		customerService.save(customer);
		return NONE;
	}
}
