package com.kh.zootopia.comment.service;

import java.util.List;

import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.comment.domain.PageInfo;

public interface CommentService {

//	/**
//	 * 댓글 내용 출력
//	 * @param pageInfo
//	 * @param comment
//	 * @return
//	 */
//	public List<Comment> selectCommentList(PageInfo pageInfo, Comment comment);
//	
//	/**
//	 * 댓글 전체 개수
//	 * @param comment
//	 * @return int
//	 */
//	public int getListCount(Comment comment);
	
	/**
	 * 댓글 내용 출력
	 * @param comment
	 * @return List<Comment>
	 */
	public List<Comment> selectCommentList(Comment comment);
	
	/**
	 * 댓글 입력
	 * @param comment
	 * @return int
	 */
	public int insertComment(Comment comment);

	/**
	 * 댓글 삭제
	 * @param comment
	 * @return int
	 */
	public int deleteComment(Comment comment);

	/**
	 * 댓글 불러오기
	 * @param comment
	 * @return Comment
	 */
	public Comment selectComment(Comment comment);

	/**
	 * 댓글 수정
	 * @param comment
	 * @return int
	 */
	public int modifyComment(Comment comment);
	
	// ========유정======== //
	/**
	 * 입양 공고 디테일 댓글 등록 Service
	 * @param cmt
	 * @return
	 */
	public int insertAdoptComment(Comment cmt);

	/**
	 * 해당 입양 공고 댓글 목록 조회 Service
	 * @param cmt
	 * @return
	 */
	public List<Comment> selectAdoptComment(Comment cmt);
	
}
