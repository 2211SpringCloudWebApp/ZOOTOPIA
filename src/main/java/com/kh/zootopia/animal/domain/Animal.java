package com.kh.zootopia.animal.domain;

public class Animal {
	private int animalNo;
	private String animalSpecies;
	private String animalGender;
	private int animalWeight;
	private int animalAge;
	private String neuterYn;
	private String animalAddr;
	private String animalCharacter;
	private String animalFosterId;
	private String animalAdopterId;
	
	public Animal() {}

	public int getAnimalNo() {
		return animalNo;
	}

	public void setAnimalNo(int animalNo) {
		this.animalNo = animalNo;
	}

	public String getAnimalSpecies() {
		return animalSpecies;
	}

	public void setAnimalSpecies(String animalSpecies) {
		this.animalSpecies = animalSpecies;
	}

	public String getAnimalGender() {
		return animalGender;
	}

	public void setAnimalGender(String animalGender) {
		this.animalGender = animalGender;
	}

	public int getAnimalWeight() {
		return animalWeight;
	}

	public void setAnimalWeight(int animalWeight) {
		this.animalWeight = animalWeight;
	}

	public int getAnimalAge() {
		return animalAge;
	}

	public void setAnimalAge(int animalAge) {
		this.animalAge = animalAge;
	}

	public String getNeuterYn() {
		return neuterYn;
	}

	public void setNeuterYn(String neuterYn) {
		this.neuterYn = neuterYn;
	}

	public String getAnimalAddr() {
		return animalAddr;
	}

	public void setAnimalAddr(String animalAddr) {
		this.animalAddr = animalAddr;
	}

	public String getAnimalCharacter() {
		return animalCharacter;
	}

	public void setAnimalCharacter(String animalCharacter) {
		this.animalCharacter = animalCharacter;
	}

	public String getAnimalFosterId() {
		return animalFosterId;
	}

	public void setAnimalFosterId(String animalFosterId) {
		this.animalFosterId = animalFosterId;
	}

	public String getAnimalAdopterId() {
		return animalAdopterId;
	}

	public void setAnimalAdopterId(String animalAdopterId) {
		this.animalAdopterId = animalAdopterId;
	}

	@Override
	public String toString() {
		return "Animal [animalNo=" + animalNo + ", animalSpecies=" + animalSpecies + ", animalGender=" + animalGender
				+ ", animalWeight=" + animalWeight + ", animalAge=" + animalAge + ", neuterYn=" + neuterYn
				+ ", animalAddr=" + animalAddr + ", animalCharacter=" + animalCharacter + ", animalFosterId="
				+ animalFosterId + ", animalAdopterId=" + animalAdopterId + "]";
	}

	
	
}
