package com.eric.crm.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import com.eric.crm.domain.BaseDict;
import com.eric.crm.service.BaseDictService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;


public class BaseDictAction extends ActionSupport implements ModelDriven<BaseDict> {
	
	private BaseDict baseDict =new BaseDict();
	
	
	public void setBaseDict(BaseDict baseDict) {
		this.baseDict = baseDict;
	}
	private BaseDictService baseDictService;
	
	public void setBaseDictService(BaseDictService baseDictService) {
		this.baseDictService = baseDictService;
	}

	@Override
	public BaseDict getModel() {
		return baseDict;
	}
	
	public String findByTypeCode() throws IOException{
		List<BaseDict> list = baseDictService.findByTypeCode(baseDict.getDictTypeCode());
		JsonConfig jsonConfig = new JsonConfig();
		//È¥³ý×Ö¶Î 
		jsonConfig.setExcludes(new String[]{"dictSort,dictEnable,dictMemo"});
		JSONArray array = JSONArray.fromObject(list,jsonConfig);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(array.toString());
		return NONE;
	}

}
