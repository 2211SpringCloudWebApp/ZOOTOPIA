package com.kh.zootopia.comment.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.comment.domain.PageInfo;
import com.kh.zootopia.comment.service.CommentService;
import com.kh.zootopia.comment.store.CommentStore;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private SqlSession session;
	@Autowired
	private CommentStore commentStore;
	
//	@Override
//	public List<Comment> selectCommentList(PageInfo pageInfo, Comment comment) {
//		
//		List<Comment> commentList = commentStore.selectCommentList(session, pageInfo, comment);
//		
//		return commentList;
//	}
//
//	@Override
//	public int getListCount(Comment comment) {
//		
//		int result = commentStore.getListCount(session, comment);
//		
//		return 0;
//	}

	@Override
	public List<Comment> selectCommentList(Comment comment) {
		
		List<Comment> commentList = commentStore.selectCommentList(session, comment);
		
		return commentList;
		
	}

	@Override
	public int insertComment(Comment comment) {
		
		int result = commentStore.insertComment(session, comment);
		
		return result;
		
	}

	@Override
	public int deleteComment(Comment comment) {
		
		int result = commentStore.deleteComment(session, comment);
		
		return result;
		
	}

	@Override
	public Comment selectComment(Comment comment) {
		
		Comment commentResult = commentStore.selectComment(session, comment);
		
		return commentResult;
	}

	@Override
	public int modifyComment(Comment comment) {

		int result = commentStore.modifyComment(session, comment);
		
		return result;
	}
	
	// ========유정======== //
	/**
	 * 입양 공고 디테일 댓글 등록 ServiceImpl
	 */
	@Override
	public int insertAdoptComment(Comment cmt) {
		int result = commentStore.insertAdoptComment(session, cmt);
		return result;
	}

	/**
	 * 해당 입양 공고 댓글 목록 조회 ServiceImpl
	 */
	@Override
	public List<Comment> selectAdoptComment(Comment cmt) {
		List<Comment> commentList = commentStore.selectAdoptComment(session, cmt);
		return commentList;
	}

}
