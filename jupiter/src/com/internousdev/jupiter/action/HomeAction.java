package com.internousdev.jupiter.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.jupiter.dao.MCategoryDAO;
import com.internousdev.jupiter.dto.MCategoryDTO;
import com.internousdev.jupiter.util.CommonUtility;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;
	public String execute() {
		//ログインしてない仮ユーザーなら仮のIDとして適当な値を入れる
		if(!(session.containsKey("tempUserId"))){
			 CommonUtility commonUtility = new CommonUtility();
			 session.put("tempUserId", commonUtility.getRamdomValue());
		}
		//ログインしてたらログインIDと0を入れる
		if(!(session.containsKey("loginid"))){
			session.put("loginid", 0);
		}

		//カテゴリーの選択したリストを保持する
		if(!session.containsKey("mCategoryDTOList")) {
			List<MCategoryDTO> mCategoryDTOList = new ArrayList<MCategoryDTO>();
			MCategoryDAO mCategoryDAO = new MCategoryDAO();
			mCategoryDTOList = mCategoryDAO.getMCategoryList();
			session.put("mCategoryDTOList", mCategoryDTOList);
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
