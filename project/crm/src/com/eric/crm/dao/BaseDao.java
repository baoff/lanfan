package com.eric.crm.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public interface BaseDao<T> {
	
	void save(T t);
	
	void update(T t);
	
	void delete(T t);
	
	T findById(Serializable id);
	
	List<T> findAll();
	
	Integer findCount(DetachedCriteria detachedCriteria);
	
	List<T> findByPage(DetachedCriteria detachedCriteria,Integer begin,Integer pageSize);

}
