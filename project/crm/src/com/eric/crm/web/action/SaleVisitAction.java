package com.eric.crm.web.action;

import java.util.Date;

import org.hibernate.criterion.DetachedCriteria;

import com.eric.crm.domain.PageBean;
import com.eric.crm.domain.SaleVisit;
import com.eric.crm.service.SaleVisitService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SaleVisitAction extends ActionSupport implements ModelDriven<SaleVisit> {

	private SaleVisit saleVisit = new SaleVisit();

	@Override
	public SaleVisit getModel() {
		return saleVisit;
	}

	private SaleVisitService saleVisitService;

	public void setSaleVisitService(SaleVisitService saleVisitService) {
		this.saleVisitService = saleVisitService;
	}
	private Date visitTime_end;
	
	
	public Date getVisitTime_end() {
		return visitTime_end;
	}

	public void setVisitTime_end(Date visitTime_end) {
		this.visitTime_end = visitTime_end;
	}

	private Integer currentPage = 1;
	private Integer pageSize = 3;

	public void setCurrentPage(Integer currentPage) {
		if (currentPage == null) {
			currentPage = 1;
		}
		this.currentPage = currentPage;
	}

	public void setPageSize(Integer pageSize) {
		if (pageSize == null) {
			pageSize = 3;
		}
		this.pageSize = pageSize;
	}
	
	public String saveUI(){
		return "saveUI";
	}
	
	public String save(){
		saleVisitService.save(saleVisit);
		return "saveSuccess";
	}
	
	public String findAll() {
		// 创建离线条件查询对象
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(SaleVisit.class);
		// 如果有条件，那么就设置条件
		// ...
		// 调用业务层
		PageBean<SaleVisit> pageBean = saleVisitService.findByPage(detachedCriteria, currentPage, pageSize);
		// 把pageBean存入值栈
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAll";
	}

}
