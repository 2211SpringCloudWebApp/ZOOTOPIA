package com.kh.zootopia.animal.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.zootopia.animal.domain.Adopt;
import com.kh.zootopia.animal.domain.Animal;
import com.kh.zootopia.animal.service.AnimalService;
import com.kh.zootopia.animal.store.AnimalStore;

public class AnimalServiceImpl implements AnimalService {

	@Autowired
	private SqlSession session;
	@Autowired
	private AnimalStore aStore;
	
	
	@Override
	public int insertAnimal(Adopt adopt, Animal animal) {
		return aStore.insertAnimal(session, adopt, animal);
	}


	@Override
	public int deleteAnimal(int animalNo) {
		int result = aStore.deleteAnimal(session, animalNo);
		return result;
	}
	

}
