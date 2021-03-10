package com.eric.crm.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.eric.crm.dao.SaleVisitDao;
import com.eric.crm.domain.PageBean;
import com.eric.crm.domain.SaleVisit;
import com.eric.crm.service.SaleVisitService;

@Transactional
public class SaleVisitServiceImpl implements SaleVisitService {

	private SaleVisitDao saleVisitDao;

	public void setSaleVisitDao(SaleVisitDao saleVisitDao) {
		this.saleVisitDao = saleVisitDao;
	}

	@Override
	public PageBean<SaleVisit> findByPage(DetachedCriteria detachedCriteria, Integer currentPage, Integer pageSize) {
		PageBean<SaleVisit> pageBean = new PageBean<SaleVisit>();
		// 设置当前页数
		pageBean.setCurrentPage(currentPage);
		// 设置每页显示的记录数
		pageBean.setPageSize(pageSize);
		// 设置总记录数
		Integer totalCount = saleVisitDao.findCount(detachedCriteria);
		pageBean.setTotalCount(totalCount);
		
		pageBean.setTotalPage(totalCount/pageSize);
		if(totalCount % pageSize != 0){
			pageBean.setTotalPage(totalCount/pageSize + 1 );
		}
		Integer begin =(currentPage -1 ) * pageSize;
		List<SaleVisit> list = saleVisitDao.findByPage(detachedCriteria, begin, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void save(SaleVisit saleVisit) {
		saleVisitDao.save(saleVisit);
	}

}
