package com.tget.service.community.domain;

import java.sql.Clob;
import java.sql.Date;


public class Content {
		
		//Field
		private int contentNo;
		private String userId;
		private String userNickname;
		private String contentName;
		private String contentBody;
		private String videoName;
		private String fileName;
		private Date regDate;
		private int viewCount;
		private String boardCode;
		private String contentCode;
		private int goodCount;
		private int badCount;
		private int refundTranNo;
		private String refundCheck;
		private String open;
		
		public int getContentNo() {
			return contentNo;
		}
		public void setContentNo(int contentNo) {
			this.contentNo = contentNo;
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
		public void setUserNickname(String userNickname) {
			this.userNickname = userNickname;
		}
		public String getContentName() {
			return contentName;
		}
		public void setContentName(String contentName) {
			this.contentName = contentName;
		}
		public String getContentBody() {
			return contentBody;
		}
		public void setContentBody(String contentBody) {
			this.contentBody = contentBody;
		}
		public String getVideoName() {
			return videoName;
		}
		public void setVideoName(String videoName) {
			this.videoName = videoName;
		}
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		public Date getRegDate() {
			return regDate;
		}
		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}
		public int getViewCount() {
			return viewCount;
		}
		public void setViewCount(int viewCount) {
			this.viewCount = viewCount;
		}
		public String getBoardCode() {
			return boardCode;
		}
		public void setBoardCode(String boardCode) {
			this.boardCode = boardCode;
		}
		public String getContentCode() {
			return contentCode;
		}
		public void setContentCode(String contentCode) {
			this.contentCode = contentCode;
		}
		public int getGoodCount() {
			return goodCount;
		}
		public void setGoodCount(int goodCount) {
			this.goodCount = goodCount;
		}
		public int getBadCount() {
			return badCount;
		}
		public void setBadCount(int badCount) {
			this.badCount = badCount;
		}
		public int getRefundTranNo() {
			return refundTranNo;
		}
		public void setRefundTranNo(int refundTranNo) {
			this.refundTranNo = refundTranNo;
		}
		public String getRefundCheck() {
			return refundCheck;
		}
		public void setRefundCheck(String refundCheck) {
			this.refundCheck = refundCheck;
		}
		public String getOpen() {
			return open;
		}
		public void setOpen(String open) {
			this.open = open;
		}
		@Override
		public String toString() {
			return "Content [contentNo=" + contentNo + ", userId=" + userId + ", userNickname=" + userNickname
					+ ", contentName=" + contentName + ", contentBody=" + contentBody + ", videoName=" + videoName
					+ ", fileName=" + fileName + ", regDate=" + regDate + ", viewCount=" + viewCount + ", boardCode="
					+ boardCode + ", contentCode=" + contentCode + ", goodCount=" + goodCount + ", badCount=" + badCount
					+ ", refundTranNo=" + refundTranNo + ", refundCheck=" + refundCheck + ", open=" + open + "]";
		}
		
		
		
}