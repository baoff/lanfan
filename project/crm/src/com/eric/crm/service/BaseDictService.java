package com.eric.crm.service;

import java.util.List;

import com.eric.crm.domain.BaseDict;

public interface BaseDictService {
	
	List<BaseDict> findByTypeCode(String dictTypeCode);
}
