package com.eric.crm.web.action;

import org.apache.struts2.ServletActionContext;

import com.eric.crm.domain.User;
import com.eric.crm.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 用户管理的action
 * @author eric
 *
 */
public class UserAction extends ActionSupport implements ModelDriven<User> {
	
	private UserService userService;
	
	private User user = new User();
	
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/**
	 * 用户注册
	 * @return
	 */
	public String regist(){
		userService.regist(user);
		return LOGIN;
	}
	
	/**
	 * 用户登录
	 * @return
	 */
	public String login(){
		User exitUser = userService.login(user);
		if(exitUser == null){
			//登录失败
			this.addActionError("用户名或密码错误!");
			return LOGIN;
		}
		ServletActionContext.getRequest().getSession().setAttribute("existUser", exitUser);
		return SUCCESS;
	}

}
