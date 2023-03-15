package com.kh.zootopia.comment.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.comment.store.CommentStore;

@Repository
public class CommentStoreLogic implements CommentStore {

//	@Override
//	public List<Comment> selectCommentList(SqlSession session, PageInfo pageInfo, Comment comment) {
//		
//		int limit = pageInfo.getBoardLimit();
//		int currentPage = pageInfo.getCurrentPage();
//		int offset = (currentPage - 1) * limit;
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		List<Comment> commentList = session.selectList("CommentMapper.selectCommentList", comment, rowBounds);
//		
//		return commentList;
//		
//	}
//	
//	@Override
//	public int getListCount(SqlSession session, Comment comment) {
//		
//		int result = session.selectOne("CommentMapper.getListCount", comment);
//		
//		return result;
//	}
	
	@Override
	public List<Comment> selectCommentList(SqlSession session, Comment comment) {
		
		List<Comment> commentList = session.selectList("CommentMapper.selectCommentList", comment);
		
		return commentList;
	}

	@Override
	public int insertComment(SqlSession session, Comment comment) {
		
		int result = session.insert("CommentMapper.insertComment", comment);
		
		return result;

	}

	@Override
	public int deleteComment(SqlSession session, Comment comment) {
		
		int result = session.delete("CommentMapper.deleteComment", comment);
		
		return result;
	}

}