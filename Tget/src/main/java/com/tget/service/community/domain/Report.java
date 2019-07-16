package com.tget.service.community.domain;

import java.sql.Date;

public class Report {
	
		private int reportNo;
		private String whiteId;
		private String whiteNickName;
		private String blackId;
		private int contentNo;
		private int replyNo;
		private String reportReasonCode;
		private Date regDate;
		private String reportCode;
		private String check;
		
		public int getReportNo() {
			return reportNo;
		}
		public void setReportNo(int reportNo) {
			this.reportNo = reportNo;
		}
		public String getWhiteId() {
			return whiteId;
		}
		public void setWhiteId(String whiteId) {
			this.whiteId = whiteId;
		}
		public String getWhiteNickName() {
			return whiteNickName;
		}
		public void setWhiteNickName(String whiteNickName) {
			this.whiteNickName = whiteNickName;
		}
		public String getBlackId() {
			return blackId;
		}
		public void setBlackId(String blackId) {
			this.blackId = blackId;
		}
		public int getContentNo() {
			return contentNo;
		}
		public void setContentNo(int contentNo) {
			this.contentNo = contentNo;
		}
		public int getReplyNo() {
			return replyNo;
		}
		public void setReplyNo(int replyNo) {
			replyNo = replyNo;
		}
		public String getReportReasonCode() {
			return reportReasonCode;
		}
		public void setReportReasonCode(String reportReasonCode) {
			this.reportReasonCode = reportReasonCode;
		}
		public Date getRegDate() {
			return regDate;
		}
		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}
		public String getReportCode() {
			return reportCode;
		}
		public void setReportCode(String reportCode) {
			this.reportCode = reportCode;
		}
		public String getCheck() {
			return check;
		}
		public void setCheck(String check) {
			this.check = check;
		}
		@Override
		public String toString() {
			return "Report [reportNo=" + reportNo + ", whiteId=" + whiteId + ", whiteNickName=" + whiteNickName
					+ ", blackId=" + blackId + ", contentNo=" + contentNo + ", replyNo=" + replyNo
					+ ", reportReasonCode=" + reportReasonCode + ", regDate=" + regDate + ", reportCode=" + reportCode
					+ ", Check=" + check + "]";
		}
		
		
}