package com.kh.zootopia.animal.store.logic;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.animal.domain.Adopt;
import com.kh.zootopia.animal.domain.Animal;
import com.kh.zootopia.animal.store.AnimalStore;

public class AnimalStoreLogic implements AnimalStore {

	@Override
	public int insertAnimal(SqlSession session, Adopt adopt, Animal animal) {
		int result = session.insert("", adopt);
		return result;
	}

	@Override
	public int deleteAnimal(SqlSession session, int animalNo) {
		int result = session.delete("", animalNo);
		return result;
	}

}
