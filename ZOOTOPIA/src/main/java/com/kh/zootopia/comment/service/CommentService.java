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
	public void insertComment(Comment comment);

	/**
	 * 댓글 삭제
	 * @param comment
	 * @return int
	 */
	public int deleteComment(Comment comment);
	
}
