package com.tget.service.event.domain;

import java.sql.Date;

public class Category {

	///F
	private int categoryTwoNo;
	private String categoryOneCode;
	private String categoryTwoName;
	private String categoryTwoEng;
	private String userId;
	
	///C
	public Category() {
	}


	///M
	public int getCategoryTwoNo() {
		return categoryTwoNo;
	}

	public void setCategoryTwoNo(int categoryTwoNo) {
		this.categoryTwoNo = categoryTwoNo;
	}

	public String getCategoryOneCode() {
		return categoryOneCode;
	}

	public void setCategoryOneCode(String categoryOneCode) {
		this.categoryOneCode = categoryOneCode;
	}

	public String getCategoryTwoName() {
		return categoryTwoName;
	}

	public void setCategoryTwoName(String categoryTwoName) {
		this.categoryTwoName = categoryTwoName;
	}


	public String getCategoryTwoEng() {
		return categoryTwoEng;
	}

	public void setCategoryTwoEng(String categoryTwoEng) {
		this.categoryTwoEng = categoryTwoEng;
	}


	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}


	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String toString() {
		return "[Category] categoryTwoNo : "+categoryTwoNo+", "
	+"categoryOneCode : "+categoryOneCode+", " + "categoryTwoName : "+categoryTwoName;
	}
}
