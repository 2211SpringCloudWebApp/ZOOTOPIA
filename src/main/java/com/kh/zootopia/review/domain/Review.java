package com.kh.zootopia.review.domain;

import java.sql.Timestamp;

public class Review {

	private int reviewPostNo;			// 후기 게시글 번호
	private String boardId;				// 게시판 ID
	private String reviewWriterId;		// 후기 작성자 ID
	private String animalNo;			// 동물 번호
	private String reviewTitle;			// 후기 제목
	private String reviewContent;		// 후기 내용
	private String reviewImageName;		// 첨부파일(사진) 이름
	private String reviewImagePath;		// 첨부파일(사진) 저장 경로
	private String reviewVideoName;		// 첨부파일(사진) 이름
	private String reviewVideoPath;		// 첨부파일(사진) 저장 경로
	private Timestamp reviewCreateDate;	// 후기 작성일
	private Timestamp reviewUpdateDate;	// 후기 수정일
	private int reviewViewCount;		// 조회수
	
	public Review() {}

	public int getReviewPostNo() {
		return reviewPostNo;
	}

	public void setReviewPostNo(int reviewPostNo) {
		this.reviewPostNo = reviewPostNo;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getReviewWriterId() {
		return reviewWriterId;
	}

	public void setReviewWriterId(String reviewWriterId) {
		this.reviewWriterId = reviewWriterId;
	}

	public String getAnimalNo() {
		return animalNo;
	}

	public void setAnimalNo(String animalNo) {
		this.animalNo = animalNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewImageName() {
		return reviewImageName;
	}

	public void setReviewImageName(String reviewImageName) {
		this.reviewImageName = reviewImageName;
	}

	public String getReviewImagePath() {
		return reviewImagePath;
	}

	public void setReviewImagePath(String reviewImagePath) {
		this.reviewImagePath = reviewImagePath;
	}

	public String getReviewVideoName() {
		return reviewVideoName;
	}

	public void setReviewVideoName(String reviewVideoName) {
		this.reviewVideoName = reviewVideoName;
	}

	public String getReviewVideoPath() {
		return reviewVideoPath;
	}

	public void setReviewVideoPath(String reviewVideoPath) {
		this.reviewVideoPath = reviewVideoPath;
	}

	public Timestamp getReviewCreateDate() {
		return reviewCreateDate;
	}

	public void setReviewCreateDate(Timestamp reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}

	public Timestamp getReviewUpdateDate() {
		return reviewUpdateDate;
	}

	public void setReviewUpdateDate(Timestamp reviewUpdateDate) {
		this.reviewUpdateDate = reviewUpdateDate;
	}

	public int getReviewViewCount() {
		return reviewViewCount;
	}

	public void setReviewViewCount(int reviewViewCount) {
		this.reviewViewCount = reviewViewCount;
	}

	@Override
	public String toString() {
		return "Review [reviewPostNo=" + reviewPostNo + ", boardId=" + boardId + ", reviewWriterId=" + reviewWriterId + ", animalNo=" + animalNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", reviewImageName=" + reviewImageName + ", reviewImagePath=" + reviewImagePath + ", reviewVideoName=" + reviewVideoName + ", reviewVideoPath=" + reviewVideoPath + ", reviewCreateDate=" + reviewCreateDate + ", reviewUpdateDate=" + reviewUpdateDate + ", reviewViewCount=" + reviewViewCount + "]";
	}
	
}
