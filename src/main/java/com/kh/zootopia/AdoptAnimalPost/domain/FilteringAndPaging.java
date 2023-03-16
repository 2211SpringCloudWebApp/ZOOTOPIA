package com.kh.zootopia.AdoptAnimalPost.domain;

public class FilteringAndPaging {
	
	private AnimalFiltering animalFiltering;
	private AnimalPaging animalPaging;
	
	public FilteringAndPaging() {super();}
	public FilteringAndPaging(AnimalFiltering animalFiltering, AnimalPaging animalPaging) {
		super();
		this.animalFiltering = animalFiltering;
		this.animalPaging = animalPaging;
	}
	public AnimalFiltering getAnimalFiltering() {
		return animalFiltering;
	}
	public void setAnimalFiltering(AnimalFiltering animalFiltering) {
		this.animalFiltering = animalFiltering;
	}
	public AnimalPaging getAnimalPaging() {
		return animalPaging;
	}
	public void setAnimalPaging(AnimalPaging animalPaging) {
		this.animalPaging = animalPaging;
	}
	@Override
	public String toString() {
		return "FilteringAndPaging [animalFiltering=" + animalFiltering + ", animalPaging=" + animalPaging + "]";
	}
	
}
