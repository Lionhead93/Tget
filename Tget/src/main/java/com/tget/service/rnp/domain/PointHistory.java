package com.tget.service.rnp.domain;

import java.sql.Date;

import com.tget.common.util.CommonUtil;

public class PointHistory {

	///F
	private String userId;
	private String pointUpdateCode;
	private Date regDate;
	private int tranNo;
	private int totalPoint;
	private int updatePoint;
	private int pointHistoryNo;
	private String totalPointStr;
	private String updatePointStr;
	
	///C
	public PointHistory() {
	}

	///M
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPointUpdateCode() {
		return pointUpdateCode;
	}

	public void setPointUpdateCode(String pointUpdateCode) {
		this.pointUpdateCode = pointUpdateCode;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getTranNo() {
		return tranNo;
	}

	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
		this.setTotalPointStr(CommonUtil.toAmountStr(String.valueOf(totalPoint)));
	}

	public int getUpdatePoint() {
		return updatePoint;
	}

	public void setUpdatePoint(int updatePoint) {
		this.updatePoint = updatePoint;
		this.setUpdatePointStr(CommonUtil.toAmountStr(String.valueOf(updatePoint)));
	}

	public int getPointHistoryNo() {
		return pointHistoryNo;
	}

	public void setPointHistoryNo(int pointHistoryNo) {
		this.pointHistoryNo = pointHistoryNo;
	}
	
	public String getTotalPointStr() {
		return totalPointStr;
	}
	public void setTotalPointStr(String totalPointStr) {
		this.totalPointStr = totalPointStr;
	}
	public String getUpdatePointStr() {
		return updatePointStr;
	}
	public void setUpdatePointStr(String updatePointStr) {
		this.updatePointStr = updatePointStr;
	}

	public String toString() {
		return "[PointHistory] userId : "+userId+", "+"pointUpdateCode : "+pointUpdateCode+", " + 
				"tranNo : "+tranNo+", " +"regDate : "+regDate+", " + 
				"totalPoint : "+totalPoint+", " + "updatePoint : "+updatePoint+", pointHistoryNo : "+pointHistoryNo;
	}

}
