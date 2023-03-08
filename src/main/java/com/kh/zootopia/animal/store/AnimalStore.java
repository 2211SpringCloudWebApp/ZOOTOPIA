package com.kh.zootopia.animal.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.animal.domain.Adopt;
import com.kh.zootopia.animal.domain.Animal;

public interface AnimalStore {

	/**
	 * 입양 공고 등록 Store
	 * @param session
	 * @param adopt
	 * @param animal
	 * @return int
	 */
	public int insertAnimal(SqlSession session, Adopt adopt, Animal animal);
	
	
	/**
	 * 입양 공고 삭제 Store
	 * @param session
	 * @param animal
	 * @return int
	 */
	public int deleteAnimal(SqlSession session, int animalNo);
}
