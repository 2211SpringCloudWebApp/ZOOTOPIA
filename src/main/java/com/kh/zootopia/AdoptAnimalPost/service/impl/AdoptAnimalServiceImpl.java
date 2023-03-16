package com.kh.zootopia.AdoptAnimalPost.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalFiltering;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalPaging;
import com.kh.zootopia.AdoptAnimalPost.domain.FilteringAndPaging;
import com.kh.zootopia.AdoptAnimalPost.service.AdoptAnimalService;
import com.kh.zootopia.AdoptAnimalPost.store.AdoptAnimalStore;
import com.kh.zootopia.reservation.domain.Reservation;

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

	/**
	 * 입양 공고 목록 조회 ServiceImpl
	 */
	@Override
	public List<AdoptAnimalPost> selectAllAnimal(AnimalPaging paging) {
		List<AdoptAnimalPost> aPostList = aStore.selectAllAnimal(session, paging);
		return aPostList;
	}
	
	/**
	 * 필터링 된 입양 공고 목록 조회 ServiceImpl 
	 */
	@Override
	public List<AdoptAnimalPost> selectFilteredAnimal(FilteringAndPaging filteringAndPaging) {
		List<AdoptAnimalPost> aPostList = aStore.selectFilteredAnimal(session, filteringAndPaging);
		return aPostList;
	}
	

	/**
	 * 입양 공고 디테일 조회 ServiceImpl
	 */
	@Override
	public AdoptAnimalPost selectOneByAnimalNo(int animalNo) {
		AdoptAnimalPost aPost = aStore.selectOneByAnimalNo(session, animalNo);
		return aPost;
	}

	/**
	 * 전체 동물 게시글 수 조회 ServiceImpl
	 */
	@Override
	public int selectTotalAnimalCount() {
		int totalAnimalCount = aStore.selectTotalAnimalCount(session);
		return totalAnimalCount;
	}

	/**
	 * 필터링 된 동물 수 조회 ServiceImple
	 */
	@Override
	public int selectFilteredAnimalCount(AnimalFiltering filter) {
		int filteredAnimalCount = aStore.selectFilteredAnimalCount(session, filter);
		return filteredAnimalCount;
	}

	/**
	 * 입력될 공고 글 게시글 번호 가져오기 ServiceImpl
	 */
	@Override
	public int adoptPostNoCurrval() {
		int adoptPostNo = aStore.adoptPostNoCurrval(session);
		return adoptPostNo;
	}

	
	

}
