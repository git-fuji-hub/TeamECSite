package com.internousdev.jupiter.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.jupiter.dao.DestinationInfoDAO;
import com.opensymphony.xwork2.ActionSupport;

public class CreateDestinationCompleteAction extends ActionSupport implements SessionAware {
	private Map<String,Object>session;

	public String execute(){

//セッションタイムアウトチェック↓↓
		if(session.isEmpty()){
			return "sessionTimeout";
			}

		String result=ERROR;

//DAOを通してDBに登録する(valueOfでString型へ変換)
		DestinationInfoDAO destinationInfoDAO=new DestinationInfoDAO();
		int count=destinationInfoDAO.insert(
				String.valueOf(session.get("userId")),
				String.valueOf(session.get("familyName")),
				String.valueOf(session.get("firstName")),
				String.valueOf(session.get("familyNameKana")),
				String.valueOf(session.get("firstNameKana")),
				String.valueOf(session.get("email")),
				String.valueOf(session.get("telNumber")),
				String.valueOf(session.get("userAddress"))
				);
//登録出来たらSUCCESS
		if(count>0){
			result=SUCCESS;
			}
		return result;
		}

	public Map<String,Object>getSession(){
		return session;
	}
	public void setSession(Map<String,Object>session){
		this.session=session;
	}
}