package com.kh.zootopia.AdoptAnimalPost.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalFiltering;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalPaging;
import com.kh.zootopia.AdoptAnimalPost.domain.FilteringAndPaging;
import com.kh.zootopia.reservation.domain.Reservation;

public interface AdoptAnimalStore {
	
	
	
	// ========== 등록 ========== //

	/**
	 * 입양 공고 등록 Store
	 * @param session
	 * @param adoptAnimalPost
	 * @return
	 */
	int insertPost(SqlSession session, AdoptAnimalPost adoptAnimalPost);

	
	
	// ========== 삭제 ========== //
	
	/**
	 * 입양 공고 삭제 Store
	 * @param session
	 * @param animalNo
	 * @return
	 */
	int deleteAnimal(SqlSession session, int animalNo);
	
	
	
	// ========== 출력 ========== //
	
	/**
	 * 입양 공고 목록 조회 Store
	 * @param session
	 * @param paging
	 * @return
	 */
	List<AdoptAnimalPost> selectAllAnimal(SqlSession session, AnimalPaging paging);
	
	
	/**
	 * 필터링된 입양 공고 목록 조회 Store
	 * @param session
	 * @param filteringAndPaging
	 * @return
	 */
	List<AdoptAnimalPost> selectFilteredAnimal(SqlSession session, FilteringAndPaging filteringAndPaging);

	
	/**
	 * 입양 공고 디테일 조회 Store
	 * @param session
	 * @param animalNo
	 * @return
	 */
	AdoptAnimalPost selectOneByAnimalNo(SqlSession session, int animalNo);

	
	
	// ========== COUNT ========== //
	
	/**
	 * 전체 동물 게시글 수 조회 Store
	 * @param session
	 * @return
	 */
	int selectTotalAnimalCount(SqlSession session);

	
	/**
	 * 필터링된 동물 수 조회 Store
	 * @param session
	 * @param filter
	 * @return
	 */
	int selectFilteredAnimalCount(SqlSession session, AnimalFiltering filter);

	
	
	// ========== 매칭 ========== //

	/**
	 * 매칭 조건에 맞는 입양 공고 목록 조회 Store
	 * @param session
	 * @param paging
	 * @param animalInfo
	 * @return
	 */
	List<AdoptAnimalPost> selectMatchingAnimal(SqlSession session, AnimalPaging paging, Animal animalInfo);
	
	/**
	 * 매칭 조건에 맞는 동물 수 조회 Store
	 * @param session
	 * @param animalInfo
	 * @return
	 */
	int selectMatchingAnimalCount(SqlSession session, Animal animalInfo);



}
