package com.tget.service.alarm.domain;

import java.sql.Date;

public class Alarm {

	private int alarmNo;
	private int alarmCode;
	private String alarmBody;
	private String alarmKeyword;
	private Date regDate;
	private String userId;
	private String readCode;
	
	public Alarm() {
		// TODO Auto-generated constructor stub
	}

	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public String getAlarmBody() {
		return alarmBody;
	}

	public void setAlarmBody(String alarmBody) {
		this.alarmBody = alarmBody;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRead() {
		return readCode;
	}
	
	public String getAlarmKeyword() {
		return alarmKeyword;
	}

	public void setAlarmKeyword(String alarmKeyword) {
		this.alarmKeyword = alarmKeyword;
	}

	public void setRead(String readCode) {
		this.readCode = readCode;
	}

	public int getAlarmCode() {
		return alarmCode;
	}

	public void setAlarmCode(int alarmCode) {
		this.alarmCode = alarmCode;
	}

	public String getReadCode() {
		return readCode;
	}

	public void setReadCode(String readCode) {
		this.readCode = readCode;
	}

	@Override
	public String toString() {
		return "Alarm [alarmNo=" + alarmNo + ", alarmCode=" + alarmCode + ", alarmBody=" + alarmBody + ", alarmKeyword="
				+ alarmKeyword + ", regDate=" + regDate + ", userId=" + userId + ", readCode=" + readCode + "]";
	}
	
	
	

}
