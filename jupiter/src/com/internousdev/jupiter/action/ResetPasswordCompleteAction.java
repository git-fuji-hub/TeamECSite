package com.internousdev.jupiter.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.jupiter.dao.UserInfoDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ResetPasswordCompleteAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	
	public String execute() {
		if(session.isEmpty()) {
			return "sessionTimeout";
		}
		
		String result = ERROR;
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		int count = userInfoDAO.resetPassword(String.valueOf(session.get("userIdForResetPassword")), String.valueOf(session.get("newPassword")));
		
		if (count > 0) {
			result = SUCCESS;
		}
		session.remove("userIdForResetPassword");
		session.remove("newPassword");
		
		return result;
	}
    
	public Map<String, Object> getSession() {
		return session;
	}
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
}
