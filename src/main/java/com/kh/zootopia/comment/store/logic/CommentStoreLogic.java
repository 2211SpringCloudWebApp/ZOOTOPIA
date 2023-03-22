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

	@Override
	public Comment selectComment(SqlSession session, Comment comment) {

		Comment commentResult = session.selectOne("CommentMapper.selectComment", comment);
		
		return commentResult;
		
	}

	@Override
	public int modifyComment(SqlSession session, Comment comment) {

		int result = session.update("CommentMapper.modifyComment", comment);
		
		return result;
	}
	
	// ========유정======== //
	/**
	 * 입양 공고 디테일 댓글 등록 StoreLogic
	 */
	@Override
	public int insertAdoptComment(SqlSession session, Comment cmt) {
		int result = session.insert("CommentMapper.insertAdoptComment", cmt);
		return result;
	}

	/**
	 * 해당 입양 공고 댓글 목록 조회 StoreLogic
	 */
	@Override
	public List<Comment> selectAdoptComment(SqlSession session, Comment cmt) {
		List<Comment> commentList = session.selectList("CommentMapper.selectAdoptComment", cmt);
		return commentList;
	}

	/**
	 * 입양 공고 댓글 삭제 StoreLogic
	 */
	@Override
	public int removeComment(SqlSession session, Comment cParam) {
		int result = session.delete("CommentMapper.removeComment", cParam);
		return result;
	}

	/**
	 * 입양 공고 댓글 수정 StoreLogic
	 */
	@Override
	public int updateComment(SqlSession session, Comment cParam) {
		int result = session.update("CommentMapper.updateComment", cParam);
		return result;
	}

}