package com.kh.zootopia.AdoptAnimalPost.domain;

import java.sql.Timestamp;

public class AdoptPost {
	
	private int adoptPostNo;
	private String boardId;
	private String adoptWriterId;
	
	private String adoptContent;
	private String adoptImageName;
	private String adoptImagePath;
	
	private Timestamp adoptCreateDate;
	private Timestamp adoptUpdateDate;
	private String adoptApprovalYN;
	
	private int animalNo;
	
	// DB에는 videoName, videoPath가 있지만 일단 여기서 안 씀
	// 시간 되면 쓰셈 일단은 video안 쓸 거임!
	
	public AdoptPost() {}

	public int getAdoptPostNo() {
		return adoptPostNo;
	}

	public void setAdoptPostNo(int adoptPostNo) {
		this.adoptPostNo = adoptPostNo;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getAdoptWriterId() {
		return adoptWriterId;
	}

	public void setAdoptWriterId(String adoptWriterId) {
		this.adoptWriterId = adoptWriterId;
	}

	public String getAdoptContent() {
		return adoptContent;
	}

	public void setAdoptContent(String adoptContent) {
		this.adoptContent = adoptContent;
	}

	public String getAdoptImageName() {
		return adoptImageName;
	}

	public void setAdoptImageName(String adoptImageName) {
		this.adoptImageName = adoptImageName;
	}

	public String getAdoptImagePath() {
		return adoptImagePath;
	}

	public void setAdoptImagePath(String adoptImagePath) {
		this.adoptImagePath = adoptImagePath;
	}

	public Timestamp getAdoptCreateDate() {
		return adoptCreateDate;
	}

	public void setAdoptCreateDate(Timestamp adoptCreateDate) {
		this.adoptCreateDate = adoptCreateDate;
	}

	public Timestamp getAdoptUpdateDate() {
		return adoptUpdateDate;
	}

	public void setAdoptUpdateDate(Timestamp adoptUpdateDate) {
		this.adoptUpdateDate = adoptUpdateDate;
	}

	public String getAdoptApprovalYN() {
		return adoptApprovalYN;
	}

	public void setAdoptApprovalYN(String adoptApprovalYN) {
		this.adoptApprovalYN = adoptApprovalYN;
	}

	public int getAnimalNo() {
		return animalNo;
	}

	public void setAnimalNo(int animalNo) {
		this.animalNo = animalNo;
	}

	@Override
	public String toString() {
		return "AdoptPost [adoptPostNo=" + adoptPostNo + ", boardId=" + boardId + ", adoptWriterId=" + adoptWriterId
				+ ", adoptContent=" + adoptContent + ", adoptImageName=" + adoptImageName + ", adoptImagePath="
				+ adoptImagePath + ", adoptCreateDate=" + adoptCreateDate + ", adoptUpdateDate=" + adoptUpdateDate
				+ ", adoptApprovalYN=" + adoptApprovalYN + ", animalNo=" + animalNo + "]";
	}

	
	

}
