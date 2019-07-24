package com.tget.service.user.domain;

import java.util.Date;

public class User {

	//F
	
	private String userId;
	private String userName;
	private String password;
	private String phone;
	private String nickName;
	private String address;
	private int postalCode; 
	private String role;
	private String local;
	private int point;
	private String userStatement;
	private Date lastConnDate;
	private String kakaoId;
	private String kakaoToken;
	public String getKakaoToken() {
		return kakaoToken;
	}

	public void setKakaoToken(String kakaoToken) {
		this.kakaoToken = kakaoToken;
	}

	private String naverId;
	private String facebookId;
	private String blacklistCode;
	private Date blacklistStartDate;
	private Date blacklistEndDate;
	private String sellerCode;
	private int salesAmount;
	private int salesCount;
	private String accountBank;
	private String accountNo;
	private String code;
	//C
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	//M
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getPostalCode() {
		return postalCode;
	}


	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getLocal() {
		return local;
	}


	public void setLocal(String local) {
		this.local = local;
		
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public String getUserStatement() {
		return userStatement;
	}


	public void setUserStatement(String userStatement) {
		this.userStatement = userStatement;
	}


	public Date getLastConnDate() {
		return lastConnDate;
	}


	public void setLastConnDate(Date lastConnDate) {
		this.lastConnDate = lastConnDate;
	}


	public String getKakaoId() {
		return kakaoId;
	}


	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}


	public String getNaverId() {
		return naverId;
	}


	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}


	public String getFacebookId() {
		return facebookId;
	}


	public void setFacebookId(String facebookId) {
		this.facebookId = facebookId;
	}


	public String getBlacklistCode() {
		return blacklistCode;
	}


	public void setBlacklistCode(String blacklistCode) {
		this.blacklistCode = blacklistCode;
	}


	public Date getBlacklistStartDate() {
		return blacklistStartDate;
	}


	public void setBlacklistStartDate(Date blacklistStartDate) {
		this.blacklistStartDate = blacklistStartDate;
	}


	public Date getBlacklistEndDate() {
		return blacklistEndDate;
	}


	public void setBlacklistEndDate(Date blacklistEndDate) {
		this.blacklistEndDate = blacklistEndDate;
	}


	public String getSellerCode() {
		return sellerCode;
	}


	public void setSellerCode(String sellerCode) {
		this.sellerCode = sellerCode;
	}


	public int getSalesAmount() {
		return salesAmount;
	}


	public void setSalesAmount(int salesAmount) {
		this.salesAmount = salesAmount;
	}


	public int getSalesCount() {
		return salesCount;
	}


	public void setSalesCount(int salesCount) {
		this.salesCount = salesCount;
	}


	public String getAccountBank() {
		return accountBank;
	}


	public void setAccountBank(String accountBank) {
		this.accountBank = accountBank;
	}


	public String getAccountNo() {
		return accountNo;
	}


	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", phone=" + phone
				+ ", nickName=" + nickName + ", address=" + address + ", postalCode=" + postalCode + ", role=" + role
				+ ", local=" + local + ", point=" + point + ", userStatement=" + userStatement + ", lastConnDate="
				+ lastConnDate + ", kakaoId=" + kakaoId + ", naverId=" + naverId + ", facebookId=" + facebookId
				+ ", blacklistCode=" + blacklistCode + ", blacklistStartDate=" + blacklistStartDate
				+ ", blacklistEndDate=" + blacklistEndDate + ", sellerCode=" + sellerCode + ", salesAmount="
				+ salesAmount + ", salesCount=" + salesCount + ", accountBank=" + accountBank + ", accountNo="
				+ accountNo + ", code=" + code + "]";
	}

	
	
	
	
	
}
