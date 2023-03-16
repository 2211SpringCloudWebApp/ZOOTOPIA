package com.kh.zootopia.AdoptAnimalPost.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalFiltering;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalPaging;
import com.kh.zootopia.AdoptAnimalPost.domain.FilteringAndPaging;
import com.kh.zootopia.reservation.domain.Reservation;

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
	 * @param paging
	 * @return
	 */
	List<AdoptAnimalPost> selectAllAnimal(SqlSession session, AnimalPaging paging);
	
	/**
	 * 필터링 된 입양 공고 목록 조회 Store
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

	/**
	 * 전체 동물 게시글 수 조회 Store
	 * @param session
	 * @return
	 */
	int selectTotalAnimalCount(SqlSession session);

	/**
	 * 필터링 된 동물 수 조회 Store
	 * @param session
	 * @param filter
	 * @return
	 */
	int selectFilteredAnimalCount(SqlSession session, AnimalFiltering filter);

	/**
	 * 입력될 공고 글 게시글 번호 가져오기 Store
	 * @param session
	 * @return
	 */
	int adoptPostNoCurrval(SqlSession session);


}
