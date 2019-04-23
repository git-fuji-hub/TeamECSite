package com.internousdev.jupiter.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class CreateDestinationAction extends ActionSupport implements SessionAware {
	private int backFlag;
	private Map<String,Object>session;

	public String execute(){

//セッションタイムアウトチェック↓↓
		if(session.isEmpty()){
		return "sessionTimeout";
		}

//backFlagが1ではない(決済確認画面から来た時)session.removeする(未入力の状態にする)

		if(backFlag != 1){
			session.remove("familyName");
			session.remove("firstName");
			session.remove("familyNameKana");
			session.remove("firstNameKana");
			session.remove("email");
			session.remove("telNumber");
			session.remove("userAddress");
			}
		return SUCCESS;
	}

	public int getBackFlag(){
		return backFlag;
	}
	public void setBackFlag(int backFlag){
		this.backFlag = backFlag;
	}
	public Map<String,Object> getSession(){
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session = session;
	}
}