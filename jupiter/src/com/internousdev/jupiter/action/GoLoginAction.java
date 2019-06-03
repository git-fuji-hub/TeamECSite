package com.internousdev.jupiter.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class GoLoginAction extends ActionSupport implements SessionAware {
	public Map<String, Object> session;

	public String execute() {
		if (session.isEmpty()) {
			return "sessionTimeout";
		}
		if (session.containsKey("cartFlag")) {
			session.remove("cartFlag");
		}

		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}