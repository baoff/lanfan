package com.eric.crm.service.impl;

import java.util.List;

import com.eric.crm.dao.BaseDictDao;
import com.eric.crm.domain.BaseDict;
import com.eric.crm.service.BaseDictService;

public class BaseDictServiceImpl implements BaseDictService{
	
	private BaseDictDao baseDictDao;

	@Override
	public List<BaseDict> findByTypeCode(String dictTypeCode) {
		return baseDictDao.findByTypeCode(dictTypeCode);
	}

}
