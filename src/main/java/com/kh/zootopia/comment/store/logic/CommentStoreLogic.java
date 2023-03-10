package com.kh.zootopia.comment.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.comment.store.CommentStore;

@Repository
public class CommentStoreLogic implements CommentStore {

	@Override
	public List<Comment> showCommentList(SqlSession session, String boardId, int postNo) {
		
		Comment comment = new Comment();
		comment.setBoardID(boardId);
		comment.setPostNo(postNo);
		
		List<Comment> commentList = session.selectList("CommentMapper.showCommentList", comment);
		
		return commentList;
		
	}

	@Override
	public int writeComment(SqlSession session, Comment comment) {
		
		int result = session.insert("CommentMapper.insertComment", comment);
		
		return 0;
	}

	@Override
	public int deleteComment(SqlSession session, Comment comment) {
		return 0;
	}

}