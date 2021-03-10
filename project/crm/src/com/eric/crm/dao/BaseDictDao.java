package com.eric.crm.dao;

import java.util.List;

import com.eric.crm.domain.BaseDict;

public interface BaseDictDao extends BaseDao<BaseDict> {
	
	List<BaseDict> findByTypeCode(String dictTypeCode);
}
