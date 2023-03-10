package com.kh.zootopia.AdoptAnimalPost.domain;


public class AdoptAnimalPost {
	
	private Animal animal;
	private AdoptPost adoptPost;
	
	public AdoptAnimalPost() {}

	public Animal getAnimal() {
		return animal;
	}

	public void setAnimal(Animal animal) {
		this.animal = animal;
	}

	public AdoptPost getAdoptPost() {
		return adoptPost;
	}

	public void setAdoptPost(AdoptPost adoptPost) {
		this.adoptPost = adoptPost;
	}

	@Override
	public String toString() {
		return "AdoptAnimalPost [animal=" + animal + ", adoptPost=" + adoptPost + "]";
	}
	
}
