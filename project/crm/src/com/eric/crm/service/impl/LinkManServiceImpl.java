package com.eric.crm.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import com.eric.crm.dao.LinkManDao;
import com.eric.crm.domain.LinkMan;
import com.eric.crm.domain.PageBean;
import com.eric.crm.service.LinkManService;

@Transactional
public class LinkManServiceImpl implements LinkManService{
	
	private LinkManDao linkManDao;

	public void setLinkManDao(LinkManDao linkManDao) {
		this.linkManDao = linkManDao;
	}

	@Override
	public PageBean<LinkMan> findAll(DetachedCriteria detachedCriteria, Integer currentPage, Integer pageSize) {
		PageBean<LinkMan> pageBean = new PageBean<LinkMan>();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		Integer totalCount = linkManDao.findCount(detachedCriteria);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalCount/pageSize);
		if(totalCount % pageSize != 0){
			pageBean.setTotalPage(totalCount/pageSize + 1 );
		}
		Integer begin =(currentPage -1 ) * pageSize;
		List<LinkMan> list = linkManDao.findByPage(detachedCriteria, begin, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void save(LinkMan linkMan) {
		linkManDao.save(linkMan);
		
	}

	@Override
	public LinkMan findById(long lkmId) {
		return linkManDao.findById(lkmId);
	}

	@Override
	public void delete(LinkMan linkMan) {
		linkManDao.delete(linkMan);
		
	}

	@Override
	public void update(LinkMan linkMan) {
		linkManDao.update(linkMan);
	}
	
	
}
