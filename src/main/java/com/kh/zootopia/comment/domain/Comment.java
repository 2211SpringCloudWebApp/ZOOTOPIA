package com.kh.zootopia.comment.domain;

public class Comment {

	private String boardID;
	private int postNo;
	private int commentNo;
	private int parentCommentNo;
	private String commentContent;
	
	public Comment() {}

	public Comment(String boardID, int postNo, int commentNo, int parentCommentNo, String commentContent) {
		this.boardID = boardID;
		this.postNo = postNo;
		this.commentNo = commentNo;
		this.parentCommentNo = parentCommentNo;
		this.commentContent = commentContent;
	}

	public String getBoardID() {
		return boardID;
	}

	public void setBoardID(String boardID) {
		this.boardID = boardID;
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

	@Override
	public String toString() {
		return "Comment [boardID=" + boardID + ", postNo=" + postNo + ", commentNo=" + commentNo + ", parentCommentNo=" + parentCommentNo + ", commentContent=" + commentContent + "]";
	}
	
}
