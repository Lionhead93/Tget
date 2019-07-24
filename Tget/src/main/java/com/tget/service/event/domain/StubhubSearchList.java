package com.tget.service.event.domain;

import java.util.List;

public class StubhubSearchList {

	///F
	//private int page; //stubhub에 보낼때 'start'라는 항목의 값(몇페이지인지)
	//private String query; //stubhub에 보낼때 'q'라는 항목의 값(검색어)	
	//위의 2개의 항목은 Search 도메인에 넣는게 나을 듯
	
	private int numFound; //검색 결과, 이벤트 갯수
	private List<StubhubEvent> events; 
	//이벤트들이 담긴 리스트(default가 10개. 결과가 10개 미만일 경우, 있는 것 만큼만...)

	
	///C
	public StubhubSearchList() {
	}

	///M
//	public int getPage() {
//		return page;
//	}
//	public void setPage(int page) {
//		this.page = page;
//	}
//	public String getQuery() {
//		return query;
//	}
//	public void setQuery(String query) {
//		this.query = query;
//	}
	public int getNumFound() {
		return numFound;
	}
	public void setNumFound(Integer numFound) {
		this.numFound = numFound;
	}
	public List<StubhubEvent> getEvents() {
		return events;
	}
	public void setEvents(List<StubhubEvent> events) {
		this.events = events;
	}

	public String toString() {
		return "[StubhubSearchList] \nnumFound : "+numFound+"\n events : "+events;
	}
}
