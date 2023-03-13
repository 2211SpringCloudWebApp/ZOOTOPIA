package com.kh.zootopia.AdoptAnimalPost.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;

public interface AdoptAnimalStore {

	/**
	 * 입양 공고 등록 Store
	 * @param session
	 * @param adoptAnimalPost
	 * @return
	 */
	int insertPost(SqlSession session, AdoptAnimalPost adoptAnimalPost);

}
