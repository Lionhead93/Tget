package com.tget.service.event.domain;

import java.sql.Date;

public class Event {

	///F
	private String eventId;
	private int viewCount;
	private String categoryTwoEng;
	private String eventImage;
	private String eventName;
	private String eventLocation;
	private Date eventDate;
	private int eventTime;
	private int interestedCategoryNo;
	private String userId;
	private int ticketLowestPrice;
	private int totalTicketCount;
	
	///C
	public Event() {
	}

	///M
	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getCategoryTwoEng() {
		return categoryTwoEng;
	}
	public void setCategoryTwoEng(String categoryTwoEng) {
		this.categoryTwoEng = categoryTwoEng;
	}

	public String getEventImage() {
		return eventImage;
	}
	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
	}

	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventLocation() {
		return eventLocation;
	}
	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}

	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public int getEventTime() {
		return eventTime;
	}
	public void setEventTime(int eventTime) {
		this.eventTime = eventTime;
	}

	public int getInterestedCategoryNo() {
		return interestedCategoryNo;
	}
	public void setInterestedCategoryNo(int interestedCategoryNo) {
		this.interestedCategoryNo = interestedCategoryNo;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getTicketLowestPrice() {
		return ticketLowestPrice;
	}
	public void setTicketLowestPrice(int ticketLowestPrice) {
		this.ticketLowestPrice = ticketLowestPrice;
	}

	public int getTotalTicketCount() {
		return totalTicketCount;
	}
	public void setTotalTicketCount(int totalTicketCount) {
		this.totalTicketCount = totalTicketCount;
	}

	public String toString() {
		return "[Event] eventId : "+eventId+"\n viewCount : "+viewCount+"\n" + 
				"categoryTwoEng : "+categoryTwoEng+"\n" +"eventImage : "+eventImage+"\n" + 
				"eventName : "+eventName+"\n eventLocation : "+eventLocation+"\n" +
				"eventDate : "+eventDate+"\n eventTime : "+eventTime+
				"\n ticketLowestPrice : "+ticketLowestPrice+"\n totalTicketCount : "+totalTicketCount;
	}
}
