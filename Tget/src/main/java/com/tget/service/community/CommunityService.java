package com.tget.service.community;

import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;

public interface CommunityService {
	
		// 게시글 등록 ok
		public void addContent(Content content) throws Exception;
		
		// 신고 등록 ok
		public void addReport(Report report) throws Exception;
		
		// 댓글 등록 ok
		public void addReply(Reply reply) throws Exception;
		
		// 게시글 조회
		public Content getContent(int contentNo) throws Exception;
		
		// 게시글 수정
		public void updateContent(Content content) throws Exception;
			
		// 신고 업데이트
		public void updateReport(Report report) throws Exception;
		
		// 댓글 수정
		public void updateReply(Reply reply) throws Exception;
		
		// 댓글 조회
		public Reply getReply(int replyNo) throws Exception;
		
		// 신고 조회
		public Report getReport(int reportNo) throws Exception;
		
		// 댓글 삭제
		public void deleteReply(int replyNo) throws Exception;
		
		// 게시글 리스트 조회
		public Map<String,Object> getContentList(Search search) throws Exception;
		
		// 댓글 리스트 조회
		public Map<String,Object> getReplyList(Search search) throws Exception;
		
		// 신고 리스트 조회
		public Map<String,Object> getReportList(Search search) throws Exception; //getTotalCount, getReportList 
		
		// 환불 게시판 조회
		public Map<String,Object> getRefundList(Search search) throws Exception;
		
		// 공감수
		public void updateGoodCount(int contentNo)throws Exception;
		
		// 비 공감수
		public void updateBadCount(int contentNo)throws Exception;
		
		
		// 환불 게시판 환불 처리
		public void updateRefund(Content content) throws Exception;
		
		// 길 찾기
		public Map<String,Object> getSearchLoad(String load) throws Exception;
		
		// 날씨
		public Map<String,Object> getSearchWeather(String weather) throws Exception;
		
		
}