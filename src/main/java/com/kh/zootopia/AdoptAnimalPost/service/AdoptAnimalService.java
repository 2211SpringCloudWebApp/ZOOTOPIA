package com.kh.zootopia.AdoptAnimalPost.service;

import java.util.List;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;

public interface AdoptAnimalService {

	/**
	 * 입양 공고 등록 Service
	 * @param adoptAnimalPost
	 * @return
	 */
	int insertPost(AdoptAnimalPost adoptAnimalPost);

	/**
	 * 입양 공고 목록 조회 Service
	 * @return
	 */
	List<AdoptAnimalPost> selectAllAnimal();

	/**
	 * 입양 공고 디테일 조회 Service
	 * @param animalNo
	 * @return
	 */
	AdoptAnimalPost selectOneByAnimalNo(int animalNo);

}
