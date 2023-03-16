package com.kh.zootopia.AdoptAnimalPost.domain;

import java.sql.Timestamp;

public class AnimalFiltering {
	
	private String animalSpecies;
	private String animalAddr;
	private Timestamp adoptCreateDateStart;
	private Timestamp adoptCreateDateEnd;
	
	public AnimalFiltering() {super();}
	public AnimalFiltering(String animalSpecies, String animalAddr, String adoptCreateDateStart,
			String adoptCreateDateEnd) {
		super();
		this.animalSpecies = animalSpecies;
		this.animalAddr = animalAddr;
		this.adoptCreateDateStart = Timestamp.valueOf(adoptCreateDateStart + " 00:00:00");
		this.adoptCreateDateEnd = Timestamp.valueOf(adoptCreateDateEnd + " 23:59:59");
	}
	public String getAnimalSpecies() {
		return animalSpecies;
	}
	public void setAnimalSpecies(String animalSpecies) {
		this.animalSpecies = animalSpecies;
	}
	public String getAnimalAddr() {
		return animalAddr;
	}
	public void setAnimalAddr(String animalAddr) {
		this.animalAddr = animalAddr;
	}
	public Timestamp getAdoptCreateDateStart() {
		return adoptCreateDateStart;
	}
	public void setAdoptCreateDateStart(String adoptCreateDateStart) {
		this.adoptCreateDateStart = Timestamp.valueOf(adoptCreateDateStart + " 00:00:00");
	}
	public Timestamp getAdoptCreateDateEnd() {
		return adoptCreateDateEnd;
	}
	public void setAdoptCreateDateEnd(String adoptCreateDateEnd) {
		this.adoptCreateDateEnd = Timestamp.valueOf(adoptCreateDateEnd + " 23:59:59");
	}
	@Override
	public String toString() {
		return "AnimalFiltering [animalSpecies=" + animalSpecies + ", animalAddr=" + animalAddr
				+ ", adoptCreateDateStart=" + adoptCreateDateStart + ", adoptCreateDateEnd=" + adoptCreateDateEnd + "]";
	}
	
	

}
