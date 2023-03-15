package com.kh.zootopia.comment.domain;

public class Comment {

	private String boardId;			// 게시판 ID
	private int postNo;				// 게시물 번호
	private int commentNo;			// 댓글 번호
	private int parentCommentNo;	// 부모 댓글 번호
	private String commentContent;	// 댓글 내용
	private String commentWriterId;	// 댓글 작성자 ID
	
	public Comment() {}

	public Comment(String boardId, int postNo, int commentNo, int parentCommentNo, String commentContent, String commentWriterId) {
		this.boardId = boardId;
		this.postNo = postNo;
		this.commentNo = commentNo;
		this.parentCommentNo = parentCommentNo;
		this.commentContent = commentContent;
		this.commentWriterId = commentWriterId;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getParentCommentNo() {
		return parentCommentNo;
	}

	public void setParentCommentNo(int parentCommentNo) {
		this.parentCommentNo = parentCommentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentWriterId() {
		return commentWriterId;
	}

	public void setCommentWriterId(String commentWriterId) {
		this.commentWriterId = commentWriterId;
	}

	@Override
	public String toString() {
		return "Comment [boardId=" + boardId + ", postNo=" + postNo + ", commentNo=" + commentNo + ", parentCommentNo=" + parentCommentNo + ", commentContent=" + commentContent + ", commentWriterId=" + commentWriterId + "]";
	}

	
}
