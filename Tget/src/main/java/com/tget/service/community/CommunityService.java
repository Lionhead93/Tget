package com.tget.service.community;

import java.util.List;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;
import com.tget.service.community.domain.Weather;

public interface CommunityService {
	
		// �Խñ� ��� ok
		public void addContent(Content content) throws Exception;
		
		// �Ű� ��� ok
		public void addReport(Report report) throws Exception;
		
		// ��� ��� ok
		public void addReply(Reply reply) throws Exception;
		
		// �Խñ� ��ȸ
		public Content getContent(int contentNo) throws Exception;
		
		// �Խñ� ����
		public void updateContent(Content content) throws Exception;
			
		// �Ű� ������Ʈ
		public void updateReport(Report report) throws Exception;
		
		// ��� ����
		public void updateReply(Reply reply) throws Exception;
		
		// ��� ��ȸ
		public Reply getReply(int replyNo) throws Exception;
		
		// �Ű� ��ȸ
		public Report getReport(int reportNo) throws Exception;
		
		// ��� ����
		public void deleteReply(int replyNo) throws Exception;
		
		// �Խñ� ����Ʈ ��ȸ
		public Map<String,Object> getContentList(Search search) throws Exception;
		
		// ��� ����Ʈ ��ȸ
		public Map<String, Object> getReplyList(int replyNo) throws Exception;
		
		// �Ű� ����Ʈ ��ȸ
		public Map<String,Object> getReportList(Search search) throws Exception; //getTotalCount, getReportList 
		
		// ȯ�� �Խ��� ��ȸ
		public Map<String,Object> getRefundList(Search search) throws Exception;
		
		// ������
		public void updateGoodCount(int contentNo)throws Exception;
		
		public void updateViewCount(int contentNo)throws Exception;
		
		// �� ������
		public void updateBadCount(int contentNo)throws Exception;
		
		// ȯ�� �Խ��� ȯ�� ó��
		public void updateRefund(Content content) throws Exception;

		
		
}