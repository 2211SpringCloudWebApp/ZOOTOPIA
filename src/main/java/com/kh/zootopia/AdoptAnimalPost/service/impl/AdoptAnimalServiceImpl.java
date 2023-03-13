package com.kh.zootopia.AdoptAnimalPost.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.service.AdoptAnimalService;
import com.kh.zootopia.AdoptAnimalPost.store.AdoptAnimalStore;

@Service
public class AdoptAnimalServiceImpl implements AdoptAnimalService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private AdoptAnimalStore aStore;

	/**
	 * 입양 공고 등록 ServiceImpl
	 */
	@Override
	public int insertPost(AdoptAnimalPost adoptAnimalPost) {
		int result = aStore.insertPost(session, adoptAnimalPost);
		return result;
	}

}
