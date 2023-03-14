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
	public void insertComment(Comment comment) {
		
		commentStore.insertComment(session, comment);
		
	}

	@Override
	public int deleteComment(Comment comment) {
		
		int result = commentStore.deleteComment(session, comment);
		
		return result;
		
	}

}
