package com.kh.zootopia.animal.domain;

import java.sql.Timestamp;

public class Adopt {
	private int adoptPostNo;
	private String boardId;
	private String adoptWriterId;
	private String adoptContent;
	private String adoptImageName;
	private String adoptImagePath;
	private String adoptVideoName;
	private String adoptVideoPath;
	private Timestamp adoptCreateDate;
	private Timestamp adoptUpdateDate;
	private String adoptApprovalYn;
	private int animalNo;
	
	public Adopt() {}

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

	public String getAdoptVideoName() {
		return adoptVideoName;
	}

	public void setAdoptVideoName(String adoptVideoName) {
		this.adoptVideoName = adoptVideoName;
	}

	public String getAdoptVideoPath() {
		return adoptVideoPath;
	}

	public void setAdoptVideoPath(String adoptVideoPath) {
		this.adoptVideoPath = adoptVideoPath;
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

	public String getAdoptApprovalYn() {
		return adoptApprovalYn;
	}

	public void setAdoptApprovalYn(String adoptApprovalYn) {
		this.adoptApprovalYn = adoptApprovalYn;
	}

	public int getAnimalNo() {
		return animalNo;
	}

	public void setAnimalNo(int animalNo) {
		this.animalNo = animalNo;
	}

	@Override
	public String toString() {
		return "Adopt [adoptPostNo=" + adoptPostNo + ", boardId=" + boardId + ", adoptWriterId=" + adoptWriterId
				+ ", adoptContent=" + adoptContent + ", adoptImageName=" + adoptImageName + ", adoptImagePath="
				+ adoptImagePath + ", adoptVideoName=" + adoptVideoName + ", adoptVideoPath=" + adoptVideoPath
				+ ", adoptCreateDate=" + adoptCreateDate + ", adoptUpdateDate=" + adoptUpdateDate + ", adoptApprovalYn="
				+ adoptApprovalYn + ", animalNo=" + animalNo + "]";
	}
	
	
}
