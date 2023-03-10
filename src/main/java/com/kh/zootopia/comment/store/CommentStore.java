package com.kh.zootopia.comment.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.comment.domain.Comment;

public interface CommentStore {

	/**
	 * 댓글 내용 출력
	 * @param session
	 * @param boardId
	 * @param postNo
	 * @return
	 */
	public List<Comment> showCommentList(SqlSession session, String boardId, int postNo);
	
	/**
	 * 댓글 작성
	 * @param session
	 * @param comment
	 * @return
	 */
	public int writeComment(SqlSession session, Comment comment);
	
	/**
	 * 댓글 삭제
	 * @param session
	 * @param comment
	 * @return int
	 */
	public int deleteComment(SqlSession session, Comment comment);
}
