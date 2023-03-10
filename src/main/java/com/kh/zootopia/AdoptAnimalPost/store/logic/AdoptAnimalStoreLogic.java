package com.kh.zootopia.AdoptAnimalPost.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.store.AdoptAnimalStore;

@Repository
public class AdoptAnimalStoreLogic implements AdoptAnimalStore{

	/**
	 * 입양 공고 등록 Store
	 */
	@Override
	public int insertPost(SqlSession session, AdoptAnimalPost adoptAnimalPost) {
		
		int animalResult = session.insert("AnimalMapper.insertAnimal", adoptAnimalPost.getAnimal());
		int adoptPostResult  = session.insert("AdoptPostMapper.insertAdoptPost", adoptAnimalPost.getAdoptPost());
		
		// 둘 다 성공했을 때만 result 값이 1이 되도록!
		int result = 0;
		if (animalResult == 1 && adoptPostResult == 1) result = 1;
		
		return result;
	}

}
