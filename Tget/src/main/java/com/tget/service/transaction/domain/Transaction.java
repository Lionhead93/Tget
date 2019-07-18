package com.tget.service.transaction.domain;

import java.sql.Date;

import com.tget.service.event.domain.Event;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.user.domain.User;

public class Transaction {
	
	//F
	private int tranNo;
	private Ticket ticket;
	private Event event; 
	private User seller;
	private User buyer;
	private int orderAmount;
	private int totalPrice;
	private Date orderDate;
	private String paymentOption;
	private String paymentNo;
	private String tranCode;
	private String deliveryAddr;
	private String deliveryCompany;
	private String deliveryNo;
	private Date deliveryStartDate;
	private int reviewScore;
	private String reviewBody;
	private Date reviewRegDate;
	private String refundAccountNo;
	private String refundAccountBank;
	
	public Transaction() {
		// TODO Auto-generated constructor stub
	}
	
	//M
	public int getTranNo() {
		return tranNo;
	}
	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}
	public Ticket getTicket() {
		return ticket;
	}
	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	public User getSeller() {
		return seller;
	}
	public void setSeller(User seller) {
		this.seller = seller;
	}
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getPaymentOption() {
		return paymentOption;
	}
	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}
	public String getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getTranCode() {
		return tranCode;
	}
	public void setTranCode(String tranCode) {
		this.tranCode = tranCode;
	}
	public String getDeliveryAddr() {
		return deliveryAddr;
	}
	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}
	public String getDeliveryCompany() {
		return deliveryCompany;
	}
	public void setDeliveryCompany(String deliveryCompany) {
		this.deliveryCompany = deliveryCompany;
	}
	public String getDeliveryNo() {
		return deliveryNo;
	}
	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}
	public Date getDeliveryStartDate() {
		return deliveryStartDate;
	}
	public void setDeliveryStartDate(Date deliveryStartDate) {
		this.deliveryStartDate = deliveryStartDate;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public String getReviewBody() {
		return reviewBody;
	}
	public void setReviewBody(String reviewBody) {
		this.reviewBody = reviewBody;
	}
	public Date getReviewRegDate() {
		return reviewRegDate;
	}
	public void setReviewRegDate(Date reviewRegDate) {
		this.reviewRegDate = reviewRegDate;
	}
	public String getRefundAccountNo() {
		return refundAccountNo;
	}
	public void setRefundAccountNo(String refundAccountNo) {
		this.refundAccountNo = refundAccountNo;
	}
	public String getRefundAccountBank() {
		return refundAccountBank;
	}
	public void setRefundAccountBank(String refundAccountBank) {
		this.refundAccountBank = refundAccountBank;
	}
	
	@Override
	public String toString() {
		return "Transaction [tranNo=" + tranNo + ", orderAmount=" + orderAmount + ", totalPrice=" + totalPrice + ", orderDate="
				+ orderDate + ", paymentOption=" + paymentOption + ", paymentNo=" + paymentNo + ", tranCode=" + tranCode
				+ ", deliveryAddr=" + deliveryAddr + ", deliveryCompany=" + deliveryCompany + ", deliveryNo="
				+ deliveryNo + ", deliveryStartDate=" + deliveryStartDate + ", reviewScore=" + reviewScore
				+ ", reviewBody=" + reviewBody + ", reviewRegDate=" + reviewRegDate + ", refundAccountNo="
				+ refundAccountNo + ", refundAccountBank=" + refundAccountBank + "]";
	}
	
	
}
