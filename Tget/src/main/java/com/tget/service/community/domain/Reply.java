package com.tget.service.community.domain;

import java.sql.Date;

public class Reply {
	
	private int replyNo;
	private String userId;
	private String userNickname;
	private int contentNo;
	private String replyBody;
	private Date regDate;
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickName(String userNickname) {
		this.userNickname = userNickname;
	}
	public int getContentNo() {
		return contentNo;
	}
	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}
	public String getReplyBody() {
		return replyBody;
	}
	public void setReplyBody(String replyBody) {
		this.replyBody = replyBody;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", userId=" + userId + ", userNickname=" + userNickname + ", contentNo="
				+ contentNo + ", replyBody=" + replyBody + ", regDate=" + regDate + "]";
	}
	
	
}
