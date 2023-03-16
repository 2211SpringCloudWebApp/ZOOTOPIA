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

	/**
	 * 입양 공고 등록 StoreLogic
	 */
	@Override
	public int insertPost(SqlSession session, AdoptAnimalPost adoptAnimalPost) {

		int animalResult = session.insert("AnimalMapper.insertAnimal", adoptAnimalPost.getAnimal());
		int adoptPostResult = session.insert("AdoptPostMapper.insertAdoptPost", adoptAnimalPost.getAdoptPost());

		// 둘 다 성공했을 때만 result 값이 1이 되도록!
		int result = 0;
		if (animalResult == 1 && adoptPostResult == 1)
			result = 1;

		return result;
	}

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
	 * 입양 공고 디테일 조회 StoreLogic
	 */
	@Override
	public AdoptAnimalPost selectOneByAnimalNo(SqlSession session, int animalNo) {
		Animal animal = session.selectOne("AnimalMapper.selectOneByAnimalNo", animalNo);
		AdoptPost post = session.selectOne("AdoptPostMapper.selectOneByAnimalNo", animalNo);

		AdoptAnimalPost aPost = new AdoptAnimalPost(animal, post);

		return aPost;
	}

	/**
	 * 전체 동물 게시글 수 조회 StoreLogic
	 */
	@Override
	public int selectTotalAnimalCount(SqlSession session) {
		int totalAnimalCount = session.selectOne("AnimalMapper.selectTotalAnimalCount");
		return totalAnimalCount;

	}

	/**
	 * 필터링 된 동물 수 조회 StoreLogic
	 */
	@Override
	public int selectFilteredAnimalCount(SqlSession session, AnimalFiltering filter) {
		int filteredAnimalCount = session.selectOne("AnimalMapper.selectFilteredAnimalCount", filter);
		return filteredAnimalCount;
	}

	/**
	 * 필터링 된 입양 공고 목록 조회 StoreLogic
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
	 * 입력될 공고 글 게시글 번호 가져오기 StoreLogic
	 */
	@Override
	public int adoptPostNoCurrval(SqlSession session) {
		int adoptPostNo = session.selectOne("AdoptPostMapper.adoptPostNoCurrval");
		return adoptPostNo;
	}


}
