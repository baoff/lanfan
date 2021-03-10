package com.eric.crm.domain;

import java.util.Date;

public class SaleVisit {
	
	private Long visitId;
	private Date visitTime;
	private String visitAddr;
	private String visitDetail;
	private Date visitNextTime;
	
	//
	private Customer customer;
	private User user;
	public Long getVisitId() {
		return visitId;
	}
	public void setVisitId(Long visitId) {
		this.visitId = visitId;
	}
	public Date getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(Date visitTime) {
		this.visitTime = visitTime;
	}
	public String getVisitAddr() {
		return visitAddr;
	}
	public void setVisitAddr(String visitAddr) {
		this.visitAddr = visitAddr;
	}
	public String getVisitDetail() {
		return visitDetail;
	}
	public void setVisitDetail(String visitDetail) {
		this.visitDetail = visitDetail;
	}
	public Date getVisitNextTime() {
		return visitNextTime;
	}
	public void setVisitNextTime(Date visitNextTime) {
		this.visitNextTime = visitNextTime;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

}
