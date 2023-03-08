package com.kh.zootopia.animal.service;

import com.kh.zootopia.animal.domain.Adopt;
import com.kh.zootopia.animal.domain.Animal;

public interface AnimalService {

	/**
	 * 입양 공고 등록 Service
	 * @param adopt
	 * @param animal
	 * @return int
	 */
	public int insertAnimal(Adopt adopt, Animal animal);

	
	/**
	 * 입양 공고 삭제 Service
	 * @param animalNo
	 * @return int
	 */
	public int deleteAnimal(int animalNo);


}
