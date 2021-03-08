package com.eric.crm.web.action;

import com.eric.crm.domain.Customer;
import com.eric.crm.service.CustomerService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 客户管理action
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
	 * 客户添加界面
	 * @return
	 */
	public String saveUI(){
		return "saveUI";
	}
	
	/**
	 * 保存客户
	 * @return
	 */
	public String save(){
		customerService.save(customer);
		return NONE;
	}
}
