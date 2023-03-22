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
	
	/**
	 * 댓글 불러오기
	 * @param session
	 * @param comment
	 * @return Comment
	 */
	public Comment selectComment(SqlSession session, Comment comment);
	
	/**
	 * 댓글 수정
	 * @param session
	 * @param comment
	 * @return int
	 */
	public int modifyComment(SqlSession session, Comment comment);
	
	// ========유정======== //
	/**
	 * 입양 공고 디테일 댓글 등록 Store
	 * @param session
	 * @param cmt
	 * @return
	 */
	public int insertAdoptComment(SqlSession session, Comment cmt);

	/**
	 * 해당 입양 공고 댓글 목록 조회 Store
	 * @param session
	 * @param cmt
	 * @return
	 */
	public List<Comment> selectAdoptComment(SqlSession session, Comment cmt);

	/**
	 * 입양 공고 댓글 삭제 Store
	 * @param session
	 * @param commentNo
	 * @return
	 */
	public int removeComment(SqlSession session, Comment cParam);

	/**
	 * 입양 공고 댓글 수정 Store
	 * @param session
	 * @param cParam
	 * @return
	 */
	public int updateComment(SqlSession session, Comment cParam);

	
}
