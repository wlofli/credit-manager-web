package com.xinyue.credit.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 用户信息
 * @author wenhai.you
 * @2015年6月30日
 * @上午10:29:55
 */
public class User extends ModelBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1612934006444362196L;

	private String id = "";
	
	private String telPhone = "";
	private String tel = "";
	private String password = "";
	
	private String passwordConfirm = "";
	
	private String realName = "";
	
	private String organization = "";

	private String province = "";
	
	private String city = "";
	private String citys = "";
	

	private String location = "";
	
	private String invitationCode = "";
	
	private String loginType = "";
	
	private String ipAddress = "";
	
	private String headImgPath = "";
	private String cardImgPath;
	private String workImgPath;
	private String lastLoginTime = "";
	
	public String getCardImgPath() {
		return cardImgPath;
	}

	public void setCardImgPath(String cardImgPath) {
		this.cardImgPath = cardImgPath;
	}

	public String getWorkImgPath() {
		return workImgPath;
	}

	public void setWorkImgPath(String workImgPath) {
		this.workImgPath = workImgPath;
	}

	private String organizationAdressString = "";
	
	private String sex;
	
	private String email;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd" )
	private Date birthday;
	
	private String adept;
	
	private String idcard;
	
	private String position;//职位
	
	private String audit;
	private String sexName;
	private String userid;
	private boolean freeLogin = false;
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSexName() {
		return sexName;
	}

	public void setSexName(String sexName) {
		this.sexName = sexName;
	}
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCitys() {
		return citys;
	}

	public void setCitys(String citys) {
		this.citys = citys;
	}
	/**
	 * @return the telPhone
	 */
	public String getTelPhone() {
		return telPhone;
	}

	/**
	 * @param telPhone the telPhone to set
	 */
	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the freeLogin
	 */
	public boolean isFreeLogin() {
		return freeLogin;
	}

	/**
	 * @param freeLogin the freeLogin to set
	 */
	public void setFreeLogin(boolean freeLogin) {
		this.freeLogin = freeLogin;
	}

	/**
	 * @return the realName
	 */
	public String getRealName() {
		return realName;
	}

	/**
	 * @param realName the realName to set
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}

	/**
	 * @return the organization
	 */
	public String getOrganization() {
		return organization;
	}

	/**
	 * @param organization the organization to set
	 */
	public void setOrganization(String organization) {
		this.organization = organization;
	}

	/**
	 * @return the province
	 */
	public String getProvince() {
		return province;
	}

	/**
	 * @param province the province to set
	 */
	public void setProvince(String province) {
		this.province = province;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the invitationCode
	 */
	public String getInvitationCode() {
		return invitationCode;
	}

	/**
	 * @param invitationCode the invitationCode to set
	 */
	public void setInvitationCode(String invitationCode) {
		this.invitationCode = invitationCode;
	}

	/**
	 * @return the passwordConfirm
	 */
	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	/**
	 * @param passwordConfirm the passwordConfirm to set
	 */
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the loginType
	 */
	public String getLoginType() {
		return loginType;
	}

	/**
	 * @param loginType the loginType to set
	 */
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	/**
	 * @return the ipAddress
	 */
	public String getIpAddress() {
		return ipAddress;
	}

	/**
	 * @param ipAddress the ipAddress to set
	 */
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	/**
	 * @return the headImgPath
	 */
	public String getHeadImgPath() {
		return headImgPath;
	}

	/**
	 * @param headImgPath the headImgPath to set
	 */
	public void setHeadImgPath(String headImgPath) {
		this.headImgPath = headImgPath;
	}

	/**
	 * @return the lastLoginTime
	 */
	public String getLastLoginTime() {
		return lastLoginTime;
	}

	/**
	 * @param lastLoginTime the lastLoginTime to set
	 */
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	/**
	 * @return the organizationAdressString
	 */
	public String getOrganizationAdressString() {
		return organizationAdressString;
	}

	/**
	 * @param organizationAdressString the organizationAdressString to set
	 */
	public void setOrganizationAdressString(String organizationAdressString) {
		this.organizationAdressString = organizationAdressString;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the birthday
	 */
	public Date getBirthday() {
		return birthday;
	}

	/**
	 * @param birthday the birthday to set
	 */
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	/**
	 * @return the adept
	 */
	public String getAdept() {
		return adept;
	}

	/**
	 * @param adept the adept to set
	 */
	public void setAdept(String adept) {
		this.adept = adept;
	}

	/**
	 * @return the idcard
	 */
	public String getIdcard() {
		return idcard;
	}

	/**
	 * @param idcard the idcard to set
	 */
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	/**
	 * @return the position
	 */
	public String getPosition() {
		return position;
	}

	/**
	 * @param position the position to set
	 */
	public void setPosition(String position) {
		this.position = position;
	}

	/**
	 * @return the audit
	 */
	public String getAudit() {
		return audit;
	}

	/**
	 * @param audit the audit to set
	 */
	public void setAudit(String audit) {
		this.audit = audit;
	}
	
	
}

