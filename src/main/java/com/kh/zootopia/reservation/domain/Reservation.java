package com.kh.zootopia.reservation.domain;

import java.sql.Timestamp;

public class Reservation {
	
	private int reservationNo;
	private int animalNo;
	private String fosterId;
	private String adopterId;
	private String adoptedYN;
	private Timestamp reservationTime;
	
	public Reservation() {}
	
	

	public Reservation(int animalNo, String fosterId, String adopterId, Timestamp reservationTime) {
		super();
		this.animalNo = animalNo;
		this.fosterId = fosterId;
		this.adopterId = adopterId;
		this.reservationTime = reservationTime;
	}



	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getAnimalNo() {
		return animalNo;
	}

	public void setAnimalNo(int animalNo) {
		this.animalNo = animalNo;
	}

	public String getFosterId() {
		return fosterId;
	}

	public void setFosterId(String fosterId) {
		this.fosterId = fosterId;
	}

	public String getAdopterId() {
		return adopterId;
	}

	public void setAdopterId(String adopterId) {
		this.adopterId = adopterId;
	}

	public String getAdoptedYN() {
		return adoptedYN;
	}

	public void setAdoptedYN(String adoptedYN) {
		this.adoptedYN = adoptedYN;
	}

	public Timestamp getReservationTime() {
		return reservationTime;
	}

	public void setReservationTime(Timestamp reservationTime) {
		this.reservationTime = reservationTime;
	}

	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", animalNo=" + animalNo + ", fosterId=" + fosterId
				+ ", adopterId=" + adopterId + ", adoptedYN=" + adoptedYN + ", reservationTime=" + reservationTime
				+ "]";
	}
	
	
	

}
