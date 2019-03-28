package com.internousdev.neptune.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.neptune.dao.MCategoryDAO;
import com.internousdev.neptune.dao.UserInfoDAO;
import com.internousdev.neptune.dto.MCategoryDTO;
import com.internousdev.neptune.dto.UserInfoDTO;
import com.internousdev.neptune.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class CreateUserCompleteAction extends ActionSupport implements SessionAware{
	private String familyName;
	private String firstName;
	private String familyNameKana;
	private String firstNameKana;
	private String sex;
	private String email;
	private String userId;
	private String password;
	private String categoryId;
	private List<MCategoryDTO> mCategoryDTOList = new ArrayList<MCategoryDTO>();
	private Map<String, Object> session;

	public String execute() {
		if(session.isEmpty() || familyName == null){
			return "sessionErr";
		}

		String result = ERROR;

		List<String> familyNameErrorMessageList = new ArrayList<String>();
		List<String> firstNameErrorMessageList = new ArrayList<String>();
		List<String> familyNameKanaErrorMessageList = new ArrayList<String>();
		List<String> firstNameKanaErrorMessageList = new ArrayList<String>();
		List<String> emailErrorMessageList = new ArrayList<String>();
		List<String> userIdErrorMessageList = new ArrayList<String>();
		List<String> passwordErrorMessageList = new ArrayList<String>();
		List<String> isExistUserIdErrorMessageList = new ArrayList<String>();

		InputChecker inputChecker = new InputChecker();
		familyNameErrorMessageList = inputChecker.doCheck("姓", familyName, 1, 16, true, true, true, false, false, false, false);
		firstNameErrorMessageList = inputChecker.doCheck("名", firstName, 1, 16, true, true, true, false, false, false, false);
		familyNameKanaErrorMessageList = inputChecker.doCheck("姓ふりがな", familyNameKana, 1, 16, false, false, true, false, false, false, false);
		firstNameKanaErrorMessageList = inputChecker.doCheck("名ふりがな", firstNameKana, 1, 16, false, false, true, false, false, false, false);
		emailErrorMessageList = inputChecker.doCheck("メールアドレス", email, 10, 32, true, false, false, true, true, false, false);
		userIdErrorMessageList = inputChecker.doCheck("ユーザーID", userId, 1, 8, true, false, false, true, false, false, false);
		passwordErrorMessageList = inputChecker.doCheck("パスワード", password, 1, 16, true, false, false, true, false, false, false);

		UserInfoDTO userInfoDTO = new UserInfoDTO();
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		userInfoDTO = userInfoDAO.getUserInfo(userId);

		if(familyNameErrorMessageList.size() != 0 || firstNameErrorMessageList.size() != 0 || familyNameKanaErrorMessageList.size() != 0
				|| firstNameKanaErrorMessageList.size() != 0 || emailErrorMessageList.size() != 0 || userIdErrorMessageList.size() != 0
				|| isExistUserIdErrorMessageList.size() != 0 || passwordErrorMessageList.size() != 0 || !StringUtils.isEmpty(userInfoDTO.getUserId())){
			return ERROR;
		}

		int intSex = 0;
		try{
			intSex = Integer.parseInt(sex);
			if(intSex > 1){
				intSex = 0;
			}
		}catch (NumberFormatException e){
			return ERROR;
		}
		int count = userInfoDAO.createUser(familyName,firstName,familyNameKana,firstNameKana,intSex,email,userId,password);
		if(count > 0) {
			result = SUCCESS;
		}

		if(!session.containsKey("mCategoryList")) {
			MCategoryDAO mCategoryDAO = new MCategoryDAO();
			mCategoryDTOList = mCategoryDAO.getMCategoryList();
			session.put("mCategoryDTOList", mCategoryDTOList);
		}
		return result;
	}

	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public List<MCategoryDTO> getMCategoryDTOList() {
		return mCategoryDTOList;
	}
	public void setMCategoryDTOList(List<MCategoryDTO> mCategoryDTOList) {
		this.mCategoryDTOList = mCategoryDTOList;
	}
	public String getFamilyName() {
		return familyName;
	}
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getFamilyNameKana() {
		return familyNameKana;
	}
	public void setFamilyNameKana(String familyNameKana) {
		this.familyNameKana = familyNameKana;
	}
	public String getFirstNameKana() {
		return firstNameKana;
	}
	public void setFirstNameKana(String firstNameKana) {
		this.firstNameKana = firstNameKana;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
