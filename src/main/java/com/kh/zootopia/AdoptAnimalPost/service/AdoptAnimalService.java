package com.kh.zootopia.AdoptAnimalPost.service;

import java.util.List;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalFiltering;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalPaging;
import com.kh.zootopia.AdoptAnimalPost.domain.FilteringAndPaging;
import com.kh.zootopia.reservation.domain.Reservation;

public interface AdoptAnimalService {

	/**
	 * 입양 공고 등록 Service
	 * @param adoptAnimalPost
	 * @return
	 */
	int insertPost(AdoptAnimalPost adoptAnimalPost);

	/**
	 * 입양 공고 목록 조회 Service
	 * @param paging
	 * @return
	 */
	List<AdoptAnimalPost> selectAllAnimal(AnimalPaging paging);
	
	/**
	 * 필터링 된 입양 공고 목록 조회 Service 
	 * @param filteringAndPaging
	 * @return
	 */
	List<AdoptAnimalPost> selectFilteredAnimal(FilteringAndPaging filteringAndPaging);

	/**
	 * 입양 공고 디테일 조회 Service
	 * @param animalNo
	 * @return
	 */
	AdoptAnimalPost selectOneByAnimalNo(int animalNo);

	/**
	 * 전체 동물 게시글 수 조회 Service
	 * @return
	 */
	int selectTotalAnimalCount();

	/**
	 * 필터링 된 동물 게시글 수 조회 Service
	 * @param filter
	 * @return
	 */
	int selectFilteredAnimalCount(AnimalFiltering filter);

	/**
	 * 입력될 공고 글 게시글 번호 가져오기 Service
	 * @return
	 */
	int adoptPostNoCurrval();

	


}
