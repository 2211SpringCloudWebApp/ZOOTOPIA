package com.kh.zootopia.member.domain;

public class MyLike {
	
	private String boardId;
	private String postNo;
	private String likeMemberId;
	
	public MyLike() {}

	public MyLike(String boardId, String postNo, String likeMemberId) {
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

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
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
