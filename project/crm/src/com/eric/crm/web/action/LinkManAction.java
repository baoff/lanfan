package com.eric.crm.web.action;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.eric.crm.domain.Customer;
import com.eric.crm.domain.LinkMan;
import com.eric.crm.domain.PageBean;
import com.eric.crm.service.CustomerService;
import com.eric.crm.service.LinkManService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LinkManAction extends ActionSupport implements ModelDriven<LinkMan> {

	private LinkMan linkMan = new LinkMan();

	@Override
	public LinkMan getModel() {
		return linkMan;
	}
	
	private Integer currentPage = 1;
	
	public void setCurrentPage(Integer currentPage) {
		if(currentPage == null){
			currentPage = 1;
		}
		this.currentPage = currentPage;
	}

	private Integer pageSize = 3;
	
	public void setPageSize(Integer pageSize) {
		if(pageSize == null){
			pageSize = 3;
		}
		this.pageSize = pageSize;
	}

	private LinkManService linkManService;
	private CustomerService customerService;
	
	public void setLinkManService(LinkManService linkManService) {
		this.linkManService = linkManService;
	}
	
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public String saveUI(){
		List<Customer> list = customerService.findAll();
		ActionContext.getContext().getValueStack().set("list", list);
		return "saveUI";
	}
	
	public String save(){
		linkManService.save(linkMan);
		return "saveSuccess";
	}
	
	public String delete(){
		linkMan = linkManService.findById(linkMan.getLkmId());
		linkManService.delete(linkMan);
		return "deleteSuccess";
	}
	public String findAll() {
		// 创建离线条件查询对象
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(LinkMan.class);
		// 设置条件，有条件就设置条件，没有条件就直接调用业务层
		if(linkMan.getLkmName() != null){
			detachedCriteria.add(Restrictions.like("lkmName","%" + linkMan.getLkmName() + "%"));
		}
		if(linkMan.getLkmGender() != null && !linkMan.getLkmGender().equals("")){
			detachedCriteria.add(Restrictions.eq("lkmGender",linkMan.getLkmGender()));
		}
		if(linkMan.getCustomer() != null && linkMan.getCustomer().getCustId() != null){
			detachedCriteria.add(Restrictions.eq("customer.custId",linkMan.getCustomer().getCustId()));
		}
		// 调用业务层
		PageBean<LinkMan> pageBean = linkManService.findAll(detachedCriteria, currentPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAll";
	}
	
	public String edit(){
		List<Customer> list = customerService.findAll();
		linkMan = linkManService.findById(linkMan.getLkmId());
		ActionContext.getContext().getValueStack().set("list", list);
		return "editSuccess";
	}
	
	public String update(){
		linkManService.update(linkMan);
		return "updateSuccess";
	}

}
