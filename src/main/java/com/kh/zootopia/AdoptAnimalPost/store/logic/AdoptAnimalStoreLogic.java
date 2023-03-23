package com.kh.zootopia.AdoptAnimalPost.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalFiltering;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalPaging;
import com.kh.zootopia.AdoptAnimalPost.domain.FilteringAndPaging;
import com.kh.zootopia.AdoptAnimalPost.store.AdoptAnimalStore;
import com.kh.zootopia.reservation.domain.Reservation;

@Repository
public class AdoptAnimalStoreLogic implements AdoptAnimalStore {

	
	
	// ========== 등록 ========== //
	
	/**
	 * 입양 공고 등록 StoreLogic
	 */
	@Override
	public int insertPost(SqlSession session, AdoptAnimalPost adoptAnimalPost) {

		int animalResult = session.insert("AnimalMapper.insertAnimal", adoptAnimalPost.getAnimal());
		int adoptPostResult = session.insert("AdoptPostMapper.insertAdoptPost", adoptAnimalPost.getAdoptPost());

		// 둘 다 성공했을 때만 result 값이 1이 되도록!
		int result = 0;
		if (animalResult == 1 && adoptPostResult == 1) result = 1;

		return result;
	}


	
	// ========== 삭제 ========== //
	

	/**
	 * 입양 공고 삭제 StoreLogic
	 */
	@Override
	public int deleteAnimal(SqlSession session, int animalNo) {
		
		int animalResult = session.insert("AnimalMapper.deleteAnimal", animalNo);
		int adoptPostResult = session.insert("AdoptPostMapper.deleteAdoptPost", animalNo);

		// 둘 다 성공했을 때만 result 값이 1이 되도록!
		int result = 0;
		if (animalResult == 1 && adoptPostResult == 1) result = 1;
		
		return result;
	}
	
	
	
	// ========== 수정 ========== //
	
	/**
	 * 입양 공고 수정 StoreLogic
	 */
	@Override
	public int updatetPost(SqlSession session, AdoptAnimalPost adoptAnimalPost) {
		
		int animalResult = session.update("AnimalMapper.updateAnimal", adoptAnimalPost.getAnimal());
		int adoptPostResult = session.update("AdoptPostMapper.updateAdoptPost", adoptAnimalPost.getAdoptPost());

		// 둘 다 성공했을 때만 result 값이 1이 되도록!
		int result = 0;
		if (animalResult == 1 && adoptPostResult == 1) result = 1;

		return result;
	}
	
	
	// ========== 출력 ========== //
	
	/**
	 * 입양 공고 목록 조회 StoreLogic
	 */
	@Override
	public List<AdoptAnimalPost> selectAllAnimal(SqlSession session, AnimalPaging paging) {
		
		int limit = paging.getAnimalPostLimit();
		int offset = (paging.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<Animal> aList = session.selectList("AnimalMapper.selectAllAnimal", null, rowBounds);
		List<AdoptPost> pList = session.selectList("AdoptPostMapper.selectAllPost", null, rowBounds);

		List<AdoptAnimalPost> aPostList = new ArrayList<AdoptAnimalPost>();
		
		for (Animal animal : aList) {
			for (AdoptPost adoptPost : pList) {
				if (animal.getAnimalNo() == adoptPost.getAnimalNo()) {
					AdoptAnimalPost aPost = new AdoptAnimalPost(animal, adoptPost);
					aPostList.add(aPost);
					break;
				}
			}
		}

		return aPostList;
	}

	
	/**
	 * 필터링된 입양 공고 목록 조회 StoreLogic
	 */
	@Override
	public List<AdoptAnimalPost> selectFilteredAnimal(SqlSession session, FilteringAndPaging filteringAndPaging) {
		
		// 페이징 관련
		AnimalPaging paging = filteringAndPaging.getAnimalPaging();
		int limit = paging.getAnimalPostLimit();
		int offset = (paging.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		// 필터링 관련
		AnimalFiltering filtering = filteringAndPaging.getAnimalFiltering();
		
		List<Animal> aList = session.selectList("AnimalMapper.selectFilteredAnimal", filtering, rowBounds);
		List<AdoptPost> pList = session.selectList("AdoptPostMapper.selectFilteredPost", filtering, rowBounds);

		List<AdoptAnimalPost> aPostList = new ArrayList<AdoptAnimalPost>();

		// animalNo가 같은 것만 list에 추가하기!
		for (Animal animal : aList) {
			for (AdoptPost adoptPost : pList) {
				if (animal.getAnimalNo() == adoptPost.getAnimalNo()) {
					AdoptAnimalPost aPost = new AdoptAnimalPost(animal, adoptPost);
					aPostList.add(aPost);
					break;
				}
			}
		}

		return aPostList;
		
	}
	
	
	/**
	 * 입양 공고 디테일 조회 StoreLogic
	 */
	@Override
	public AdoptAnimalPost selectOneByAnimalNo(SqlSession session, int animalNo) {
		
		Animal animal = session.selectOne("AnimalMapper.selectOneByAnimalNo", animalNo);
		AdoptPost post = session.selectOne("AdoptPostMapper.selectOneByAnimalNo", animalNo);

		AdoptAnimalPost aPost = new AdoptAnimalPost(animal, post);

		return aPost;
	}

	
	
	// ========== COUNT ========== //
	
	/**
	 * 전체 동물 게시글 수 조회 StoreLogic
	 */
	@Override
	public int selectTotalAnimalCount(SqlSession session) {
		int totalAnimalCount = session.selectOne("AnimalMapper.selectTotalAnimalCount");
		return totalAnimalCount;

	}

	
	/**
	 * 필터링된 동물 수 조회 StoreLogic
	 */
	@Override
	public int selectFilteredAnimalCount(SqlSession session, AnimalFiltering filter) {
		int filteredAnimalCount = session.selectOne("AnimalMapper.selectFilteredAnimalCount", filter);
		return filteredAnimalCount;
	}

	

	// ========== 매칭 ========== //
	
	/**
	 * 매칭 조건에 맞는 입양 공고 목록 조회 StoreLogic
	 */
	@Override
	public List<AdoptAnimalPost> selectMatchingAnimal(SqlSession session, AnimalPaging paging, Animal animalInfo) {
		
		int limit = paging.getAnimalPostLimit();
		int offset = (paging.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<Animal> aList = session.selectList("AnimalMapper.selectMatchingAnimal", animalInfo, rowBounds);
		List<AdoptPost> pList = session.selectList("AdoptPostMapper.selectMatchingPost", animalInfo, rowBounds);

		List<AdoptAnimalPost> aPostList = new ArrayList<AdoptAnimalPost>();

		for (Animal animal : aList) {
			for (AdoptPost adoptPost : pList) {
				if (animal.getAnimalNo() == adoptPost.getAnimalNo()) {
					AdoptAnimalPost aPost = new AdoptAnimalPost(animal, adoptPost);
					aPostList.add(aPost);
					break;
				}
			}
		}

		return aPostList;
	}
	
	
	/**
	 * 매칭 조건에 맞는 동물 수 조회 StoreLogic
	 */
	@Override
	public int selectMatchingAnimalCount(SqlSession session, Animal animalInfo) {
		int totalCount = session.selectOne("AnimalMapper.selectMatchingAnimalCount", animalInfo);
		return totalCount;
	}



	/**
	 * 매칭 조건에 맞는 입양 공고 랜덤으로 하나 조회 StoreLogi
	 */
	@Override
	public AdoptAnimalPost selectRandOneMatchingAnimal(SqlSession session, Animal animalInfo) {
		
		// 랜덤뽑기하고
		Animal animal = session.selectOne("AnimalMapper.selectRandOneMatchingAnimal", animalInfo);
		
		// 그거에 맞는 게시글 정보 가져오고
		AdoptPost post = session.selectOne("AdoptPostMapper.selectOneByAnimalNo", animal.getAnimalNo());
		
		// 둘이 합체!
		AdoptAnimalPost aPost = new AdoptAnimalPost(animal, post);

		return aPost;
	}


	/**
	 * 수정 페이지에서 첨부 이미지만 삭제하기
	 */
	@Override
	public int removeImg(SqlSession session, int animalNo) {
		int result = session.update("AdoptPostMapper.updateRemoveImg", animalNo);
		return result;
	}



	


	
}
