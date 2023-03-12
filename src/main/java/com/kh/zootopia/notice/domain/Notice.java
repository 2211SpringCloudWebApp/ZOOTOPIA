package com.kh.zootopia.notice.domain;

import java.sql.Timestamp;

public class Notice {
	
	private int noticeNo;
	private String noticeSubject;
	private String noticeContent;
	private String noticeWriter;
	private Timestamp noticeCreateDate;
	private Timestamp noticeUpdateDate;
	private String noticeImageName;
	private String noticeImagePath;
	private int noticeViewCount;
	
	public Notice() {}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeSubject() {
		return noticeSubject;
	}

	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public Timestamp getNoticeCreateDate() {
		return noticeCreateDate;
	}

	public void setNoticeCreateDate(Timestamp noticeCreateDate) {
		this.noticeCreateDate = noticeCreateDate;
	}

	public Timestamp getNoticeUpdateDate() {
		return noticeUpdateDate;
	}

	public void setNoticeUpdateDate(Timestamp noticeUpdateDate) {
		this.noticeUpdateDate = noticeUpdateDate;
	}

	public String getNoticeImageName() {
		return noticeImageName;
	}

	public void setNoticeImageName(String noticeImageName) {
		this.noticeImageName = noticeImageName;
	}

	public String getNoticeImagePath() {
		return noticeImagePath;
	}

	public void setNoticeImagePath(String noticeImagePath) {
		this.noticeImagePath = noticeImagePath;
	}

	public int getNoticeViewCount() {
		return noticeViewCount;
	}

	public void setNoticeViewCount(int noticeViewCount) {
		this.noticeViewCount = noticeViewCount;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeSubject=" + noticeSubject + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", noticeCreateDate=" + noticeCreateDate + ", noticeUpdateDate="
				+ noticeUpdateDate + ", noticeImageName=" + noticeImageName + ", noticeImagePath=" + noticeImagePath
				+ ", noticeViewCount=" + noticeViewCount + "]";
	}
	
	
}
