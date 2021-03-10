package com.eric.crm.service;

import org.hibernate.criterion.DetachedCriteria;

import com.eric.crm.domain.PageBean;
import com.eric.crm.domain.SaleVisit;

public interface SaleVisitService {

	PageBean<SaleVisit> findByPage(DetachedCriteria detachedCriteria, Integer currentPage, Integer pageSize);

	void save(SaleVisit saleVisit);

}
