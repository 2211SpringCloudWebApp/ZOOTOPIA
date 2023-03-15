package com.kh.zootopia.manager.domain;

public class DateDTO {

	private String year;
	private String month;
	private String date;
	
	public DateDTO() {}

	public DateDTO(String year, String month, String date) {
		super();
		this.year = year;
		this.month = month;
		this.date = date;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "DTO [year=" + year + ", month=" + month + ", date=" + date + "]";
	}
}
