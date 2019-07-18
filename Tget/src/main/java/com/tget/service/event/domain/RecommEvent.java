package com.tget.service.event.domain;

import java.sql.Date;

public class RecommEvent {

	///F
	private int recommEventNo;
	private String eventName;
	private String videoName;
	private String recommEventName;
	private String recommEventDetail;
//	private String recommStatus;
	
	///C
	public RecommEvent() {
	}


	///M
	public int getRecommEventNo() {
		return recommEventNo;
	}

	public void setRecommEventNo(int recommEventNo) {
		this.recommEventNo = recommEventNo;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	public String getRecommEventName() {
		return recommEventName;
	}

	public void setRecommEventName(String recommEventName) {
		this.recommEventName = recommEventName;
	}

	public String getRecommEventDetail() {
		return recommEventDetail;
	}

	public void setRecommEventDetail(String recommEventDetail) {
		this.recommEventDetail = recommEventDetail;
	}

//	public String getRecommStatus() {
//		return recommStatus;
//	}
//
//	public void setRecommStatus(String recommStatus) {
//		this.recommStatus = recommStatus;
//	}


	public String toString() {
		return "[RecommEvent] recommEventNo : "+recommEventNo+", "+"eventName : "+eventName+", " + 
				"videoName : "+videoName+", " +"recommEventName : "+recommEventName+", "
				+"recommEventDetail : "+recommEventDetail;
	}
}
