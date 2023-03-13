package com.kh.zootopia.AdoptAnimalPost.service;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;

public interface AdoptAnimalService {

	/**
	 * 입양 공고 등록 Service
	 * @param adoptAnimalPost
	 * @return
	 */
	int insertPost(AdoptAnimalPost adoptAnimalPost);

}
