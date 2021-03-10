package com.eric.crm.service;

import org.hibernate.criterion.DetachedCriteria;

import com.eric.crm.domain.LinkMan;
import com.eric.crm.domain.PageBean;

/**
 * 联系人业务层
 * @author eric
 *
 */
public interface LinkManService {
	
	PageBean<LinkMan> findAll(DetachedCriteria detachedCriteria,Integer currentPage, Integer pageSize);

	void save(LinkMan linkMan);

	LinkMan findById(long lkmId);

	void delete(LinkMan linkMan);

	void update(LinkMan linkMan);

}
