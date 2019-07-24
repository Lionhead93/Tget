package com.tget.service.event.domain;

import java.sql.Date;

import com.tget.common.util.CommonUtil;

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
	private String eventTimeStr;
	private String ticketLowestPriceStr;
	private String koName;
	private String koPerformer;
	private String koLocation;
	
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
		this.setEventTimeStr(eventTime);
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
		this.setTicketLowestPriceStr(ticketLowestPrice);
	}

	public int getTotalTicketCount() {
		return totalTicketCount;
	}
	public void setTotalTicketCount(int totalTicketCount) {
		this.totalTicketCount = totalTicketCount;
	}

	public String getEventTimeStr() {
		return eventTimeStr;
	}

	public void setEventTimeStr(int eventTime) {
		String temp = String.valueOf(eventTime);
		this.eventTimeStr = temp.substring(0, 2)+":"+temp.substring(2);
	}
	
	public String getTicketLowestPriceStr() {
		return ticketLowestPriceStr;
	}
	
	public void setTicketLowestPriceStr(int ticketLowestPrice) {
//		String temp = String.valueOf(ticketLowestPrice);
		this.ticketLowestPriceStr = CommonUtil.toAmountStr(String.valueOf(ticketLowestPrice));
	}


	/**
	 * @return the koName
	 */
	public String getKoName() {
		return koName;
	}

	/**
	 * @param koName the koName to set
	 */
	public void setKoName(String koName) {
		this.koName = koName;
	}

	/**
	 * @param eventTimeStr the eventTimeStr to set
	 */
	public void setEventTimeStr(String eventTimeStr) {
		this.eventTimeStr = eventTimeStr;
	}

	/**
	 * @param ticketLowestPriceStr the ticketLowestPriceStr to set
	 */
	public void setTicketLowestPriceStr(String ticketLowestPriceStr) {
		this.ticketLowestPriceStr = ticketLowestPriceStr;
	}

	/**
	 * @return the koPerformer
	 */
	public String getKoPerformer() {
		return koPerformer;
	}

	/**
	 * @param koPerformer the koPerformer to set
	 */
	public void setKoPerformer(String koPerformer) {
		this.koPerformer = koPerformer;
	}

	/**
	 * @return the koLocation
	 */
	public String getKoLocation() {
		return koLocation;
	}

	/**
	 * @param koLocation the koLocation to set
	 */
	public void setKoLocation(String koLocation) {
		this.koLocation = koLocation;
	}

	public String toString() {
		return "[Event] eventId : "+eventId+"\n viewCount : "+viewCount+"\n" + 
				"categoryTwoEng : "+categoryTwoEng+"\n" +"eventImage : "+eventImage+"\n" + 
				"eventName : "+eventName+"\n eventLocation : "+eventLocation+"\n" +
				"eventDate : "+eventDate+"\n eventTime : "+eventTime+
				"\n ticketLowestPrice : "+ticketLowestPrice+"\n totalTicketCount : "+totalTicketCount;
	}
}
