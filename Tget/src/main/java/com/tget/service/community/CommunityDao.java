package com.tget.service.community;

import java.util.List;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;


public interface CommunityDao {
	// �Խñ� ��� 
	public void InsertContent(Content content) throws Exception;
	// �Ű� ���
	public void InsertReport(Report report) throws Exception;
	// ��� ���
    public void InsertReply(Reply reply) throws Exception;
    // �Խñ� ����ȸ
    public Content selectContent(int contentNo) throws Exception;
    // �Ű� ��ȸ
    public Report selectReport(int reportNo) throws Exception;
    // ��� ��ȸ
    public Reply selectReply(int replyNo) throws Exception;
    // �Խñ� ����
	public void updateContent(Content content) throws Exception;
	// �Ű� ������Ʈ
	public void updateReport(Report report)	throws Exception;
    // �Խñ� ����Ʈ ��ȸ
    public List<Content> selectListContent(Search search) throws Exception;
    // ��� ����
    public void updateReply(Reply reply) throws Exception;
    // ��� ����
    public void deleteReply(int replyNo) throws Exception;
    // ��� ����Ʈ ��ȸ
    public Map<String, Object> selectListReply(int replyNo) throws Exception;
	// ������ 
    public void updateGoodCount(int contentNo)throws Exception;
    // �������
    public void updateBadCount(int contentNo)throws Exception;
    
    public void updateViewCount(int contentNo)throws Exception;
    
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int selectTotalCount(Search search) throws Exception ;
	
	public int selectTotalCountRefund(Search search) throws Exception ;
	
	public int selectTotalCountReport(Search search) throws Exception ;
	// ȯ�� �Խ��� ȯ�� ó�� update
	public void updateRefund(Content content) throws Exception;
	// ȯ�� �Խ��� ����Ʈ ��ȸ
	public List<Content> selectListRefund(Search search) throws Exception;
	
	// �Ű�� ����Ʈ ��ȸ(������)
	public List<Report> selectListReport(Search search) throws Exception;
	// ��� ����Ʈ ��ȸ(���� �ʿ�)
	
	//public List<Content> selectListRefund(Search search) throws Exception;
	
}
