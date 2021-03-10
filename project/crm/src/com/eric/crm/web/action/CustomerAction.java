package com.eric.crm.web.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.eric.crm.domain.Customer;
import com.eric.crm.domain.PageBean;
import com.eric.crm.service.CustomerService;
import com.eric.crm.utils.UploadUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

/**
 * 客户管理action
 * @author eric
 *
 */
public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{
	
	private Customer customer = new Customer();
	
	@Override
	public Customer getModel() {
		return customer;
	}
	
	private CustomerService customerService;

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	private Integer currentPage = 1;
	
	public void setCurrentPage(Integer currentPage) {
		if(currentPage == null){
			currentPage = 1;
		}
		this.currentPage = currentPage;
	}
	
	private Integer pageSize = 3;

	public void setPageSize(Integer pageSize) {
		if(pageSize == null){
			pageSize = 3;
		}
		this.pageSize = pageSize;
	}
	//文件名称
	private String uploadFileName;
	//文件本身
	private File upload;
	//文件类型
	private String uploadContentType;

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * 客户添加界面
	 * @return
	 */
	public String saveUI(){
		return "saveUI";
	}
	
	/**
	 * 保存客户
	 * @return
	 * @throws IOException 
	 */
	public String save() throws IOException{
		//上传图片
		if(upload != null){
			String path = "E:/upload";
			String uuidFileName = UploadUtils.getUuidFileName(uploadFileName);
			String realPath = UploadUtils.getPath(uuidFileName);
			String url = path + realPath;
			File file = new File(url);
			if(!file.exists()){
				file.mkdirs();
			}
			//文件上传
			File dictFile = new File(url + "/" + uuidFileName);
			FileUtils.copyFile(upload, dictFile);
			customer.setCustImage(url + "/" + uuidFileName);
		}
		customerService.save(customer);
		return "saveSuccess";
	}
	
	public String findAll(){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Customer.class);
		if(customer.getCustName() != null){
			detachedCriteria.add(Restrictions.like("custName", "%" + customer.getCustName() + "%"));
		}
		if(customer.getBaseDictSource() != null){
			if(customer.getBaseDictSource().getDictId() != null)
			detachedCriteria.add(Restrictions.eq("baseDictSource.dictId", customer.getBaseDictSource().getDictId()));
		}
		if(customer.getBaseDictLevel() != null){
			if(customer.getBaseDictLevel().getDictId() != null)
			detachedCriteria.add(Restrictions.eq("baseDictLevel.dictId", customer.getBaseDictLevel().getDictId()));
		}
		if(customer.getBaseDictIndustry() != null){
			if(customer.getBaseDictIndustry().getDictId() != null)
			detachedCriteria.add(Restrictions.eq("baseDictIndustry.dictId", customer.getBaseDictIndustry().getDictId()));
		}
		
		PageBean<Customer> pageBean = customerService.findByPage(detachedCriteria, currentPage, pageSize);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAll";
	}
	
	public String delete(){
		customer = customerService.findById(customer.getCustId());
		if(customer.getCustImage() != null){
			File file = new File(customer.getCustImage());
			if(file.exists()){
				file.delete();
			}
		}
		customerService.delete(customer);
		return "deleteSuccess";
	}
	public String edit(){
		customer = customerService.findById(customer.getCustId());
//		ActionContext.getContext().getValueStack().push(customer);
		return "editSuccess";
	}
	
	public String update() throws IOException{
		if(upload != null){
			String custImage = customer.getCustImage();
			if(custImage != null ||  !custImage .equals("")){
				File file = new File(custImage);
				file.delete();
			}
			
			String path = "E:/upload";
			String uuidFileName = UploadUtils.getUuidFileName(uploadFileName);
			String realPath = UploadUtils.getPath(uuidFileName);
			String url = path + realPath;
			File file = new File(url);
			if(!file.exists()){
				file.mkdirs();
			}
			//文件上传
			File dictFile = new File(url + "/" + uuidFileName);
			FileUtils.copyFile(upload, dictFile);
			customer.setCustImage(url + "/" + uuidFileName);
		}
		customerService.update(customer);
		return "updateSuccess";
	}
	
	public String all() throws IOException{
		List<Customer> list = customerService.findAll();
		JsonConfig jsonConfig = new JsonConfig();
		//去除字段 
//		jsonConfig.setExcludes(new String[]{"custPhone,custMobile,baseDictSource","baseDictIndustry","baseDictLevel","custImage","linkMans"});
//		jsonConfig.setIgnoreDefaultExcludes(false);
//		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		
		JSONArray array = new JSONArray(); 
		for(int i = 0 ; i < list.size() ; i++){
			JSONObject json = new JSONObject();
			json.put("custId", list.get(i).getCustId());
			json.put("custName", list.get(i).getCustName());
			array.add(json);
		}
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println(array.toString());
		return NONE;
	}
}
