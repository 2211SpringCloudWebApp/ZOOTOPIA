package com.kh.zootopia.AdoptAnimalPost.service;

import java.util.List;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalFiltering;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalPaging;
import com.kh.zootopia.AdoptAnimalPost.domain.FilteringAndPaging;
import com.kh.zootopia.reservation.domain.Reservation;

public interface AdoptAnimalService {

	
	// ========== 등록 ========== //
	
	/**
	 * 입양 공고 등록 Service
	 * @param adoptAnimalPost
	 * @return
	 */
	int insertPost(AdoptAnimalPost adoptAnimalPost);

	
	
	// ========== 삭제 ========== //
	
	/**
	 * 입양 공고 삭제 Service
	 * @param animalNo
	 * @return
	 */
	int deleteAnimal(int animalNo);
	
	
	
	// ========== 출력 ========== //
	
	/**
	 * 입양 공고 목록 조회 Service
	 * @param paging
	 * @return
	 */
	List<AdoptAnimalPost> selectAllAnimal(AnimalPaging paging);
	
	
	/**
	 * 필터링된 입양 공고 목록 조회 Service 
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


	
	// ========== COUNT ========== //
	
	/**
	 * 전체 동물 게시글 수 조회 Service
	 * @return
	 */
	int selectTotalAnimalCount();

	
	/**
	 * 필터링된 동물 게시글 수 조회 Service
	 * @param filter
	 * @return
	 */
	int selectFilteredAnimalCount(AnimalFiltering filter);


	
	// ========== 매칭 ========== //
	
	/**
	 * 매칭 조건에 맞는 입양 공고 목록 조회 Service
	 * @param paging
	 * @param animalInfo
	 * @return
	 */
	List<AdoptAnimalPost> selectMatchingAnimal(AnimalPaging paging, Animal animalInfo);
	
	/**
	 * 매칭 조건에 맞는 동물 수 조회 Service
	 * @param animalInfo
	 * @return
	 */
	int selectMatchingAnimalCount(Animal animalInfo);


	
}
