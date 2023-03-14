package com.kh.zootopia.AdoptAnimalPost.store;

import java.util.List;

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

	/**
	 * 입양 공고 목록 조회 Store
	 * @param session
	 * @return
	 */
	List<AdoptAnimalPost> selectAllAnimal(SqlSession session);

	/**
	 * 입양 공고 디테일 조회 Store
	 * @param session
	 * @param animalNo
	 * @return
	 */
	AdoptAnimalPost selectOneByAnimalNo(SqlSession session, int animalNo);

}
