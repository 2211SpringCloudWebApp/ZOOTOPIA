package com.kh.zootopia.review.domain;

import java.security.Timestamp;

public class Review {

	private int reviewPostNo;
	private String animalNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewWriterId;
	private Timestamp reviewCreateDate;
	private Timestamp reviewUpdateDate;
	private String reviewFileName;
	private String reviewFilePath;
	private int reviewViewCount;
	
	public Review() {}

	public int getReviewPostNo() {
		return reviewPostNo;
	}

	public void setReviewPostNo(int reviewPostNo) {
		this.reviewPostNo = reviewPostNo;
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

	public String getReviewWriterId() {
		return reviewWriterId;
	}

	public void setReviewWriterId(String reviewWriterId) {
		this.reviewWriterId = reviewWriterId;
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

	public String getReviewFileName() {
		return reviewFileName;
	}

	public void setReviewFileName(String reviewFileName) {
		this.reviewFileName = reviewFileName;
	}

	public String getReviewFilePath() {
		return reviewFilePath;
	}

	public void setReviewFilePath(String reviewFilePath) {
		this.reviewFilePath = reviewFilePath;
	}

	public int getReviewViewCount() {
		return reviewViewCount;
	}

	public void setReviewViewCount(int reviewViewCount) {
		this.reviewViewCount = reviewViewCount;
	}

	@Override
	public String toString() {
		return "Review [reviewPostNo=" + reviewPostNo + ", animalNo=" + animalNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", reviewWriterId=" + reviewWriterId + ", reviewCreateDate=" + reviewCreateDate + ", reviewUpdateDate=" + reviewUpdateDate + ", reviewFileName=" + reviewFileName + ", reviewFilePath=" + reviewFilePath + ", reviewViewCount=" + reviewViewCount + "]";
	}
	
}
