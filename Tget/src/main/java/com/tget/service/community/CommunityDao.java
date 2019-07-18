package com.tget.service.community;

import java.util.List;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;


public interface CommunityDao {
	// 게시글 등록 
	public void InsertContent(Content content) throws Exception;
	// 신고 등록
	public void InsertReport(Report report) throws Exception;
	// 댓글 등록
    public void InsertReply(Reply reply) throws Exception;
    // 게시글 상세조회
    public Content selectContent(int contentNo) throws Exception;
    // 신고 조회
    public Report selectReport(int reportNo) throws Exception;
    // 게시글 수정
	public void updateContent(Content content) throws Exception;
	// 신고 업데이트
	public void updateReport(Report report)	throws Exception;
	
    // 게시글 리스트 조회
    public List<Content> selectListContent(Search search) throws Exception;
    // 댓글 수정
    public void updateReply(Reply reply) throws Exception;
    // 댓글 삭제
    public void deleteReply(int replyNo) throws Exception;
    // 댓글 리스트 조회
    public List<Reply> selectListReply(int replyNo) throws Exception; 
	// 공감수 
    public void updateGoodCount(int contentNo)throws Exception;
    // 비공감수
    public void updateBadCount(int contentNo)throws Exception;
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int selectTotalCount(Search search) throws Exception ;
	// 환불 게시판 환불 처리 update
	public void updateRefund(Content content) throws Exception;
	// 신고글 리스트 조회(관리자)
	public List<Report> selectListReport(Search search) throws Exception;
	// 댓글 리스트 조회(수정 필요)
	List<Reply> selectListReply(Search search) throws Exception;
	
	//public List<Content> selectListRefund(Search search) throws Exception;
	
}
