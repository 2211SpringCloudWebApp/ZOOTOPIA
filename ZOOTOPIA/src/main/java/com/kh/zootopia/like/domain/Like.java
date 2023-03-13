package com.kh.zootopia.like.domain;

public class Like {

	private String boardId;
	private int postNo;
	private String likeMemberId;
	
	public Like() {}

	public Like(String boardId, int postNo, String likeMemberId) {
		this.boardId = boardId;
		this.postNo = postNo;
		this.likeMemberId = likeMemberId;
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

	public String getLikeMemberId() {
		return likeMemberId;
	}

	public void setLikeMemberId(String likeMemberId) {
		this.likeMemberId = likeMemberId;
	}

	@Override
	public String toString() {
		return "Like [boardId=" + boardId + ", postNo=" + postNo + ", likeMemberId=" + likeMemberId + "]";
	}
	
}
