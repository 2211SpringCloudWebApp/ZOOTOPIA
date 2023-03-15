package com.kh.zootopia.comment.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.comment.domain.PageInfo;

public interface CommentStore {

//	/**
//	 * 댓글 내용 출력
//	 * @param session
//	 * @param pageInfo
//	 * @param comment
//	 * @return
//	 */
//	public List<Comment> selectCommentList(SqlSession session, PageInfo pageInfo, Comment comment);
//	
//	/**
//	 * 댓글 전체 개수
//	 * @param session
//	 * @param comment
//	 * @return int
//	 */
//	public int getListCount(SqlSession session, Comment comment);
	
	/**
	 * 댓글 내용 출력
	 * @param session
	 * @param comment
	 * @return
	 */
	public List<Comment> selectCommentList(SqlSession session, Comment comment);
	
	/**
	 * 댓글 입력
	 * @param session
	 * @param comment
	 * @return int
	 */
	public int insertComment(SqlSession session, Comment comment);
	
	/**
	 * 댓글 삭제
	 * @param session
	 * @param comment
	 * @return int
	 */
	public int deleteComment(SqlSession session, Comment comment);
}
