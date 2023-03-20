package com.kh.zootopia.review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;
import com.kh.zootopia.review.service.ReviewService;
import com.kh.zootopia.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession session;
	@Autowired
	private ReviewStore reviewStore;
	
	@Override
	public int insertReview(Review review) {

		int result = reviewStore.insertReview(session, review); 
		
		return result;
	}

	@Override
	public List<Review> selectReviewList(PageInfo pageInfo) {
		
		List<Review> reviewList = reviewStore.selectReviewList(session, pageInfo);
		
		return reviewList;
	}

	@Override
	public int getListCount() {
		
		int result = reviewStore.getListCount(session);
		
		return result;
	}

	@Override
	public List<Review> searchReview(PageInfo pageInfo, Search search) {
		
		List<Review> reviewList = reviewStore.searchReview(session, pageInfo, search);
		
		return reviewList;
	}
	
	@Override
	public int getListCount(Search search) {

		int result = reviewStore.getListCount(session, search);
		
		return result;
	}

	@Override
	public int deleteReview(int reviewPostNo) {

		int result = reviewStore.deleteReview(session, reviewPostNo);
		
		return result;
	}

	@Override
	public Review selectReview(int reviewPostNo) {

		Review review = reviewStore.selectReview(session, reviewPostNo);
		
		return review;
	}

	@Override
	public void viewCount(int reviewPostNo) {
		
		reviewStore.viewCount(session, reviewPostNo);
		
	}
	
	@Override
	public Animal selectAnimalByAnimalNo(int animalNo) {
		
		Animal animal = reviewStore.selectAnimalByAnimalNo(session, animalNo);
		
		return animal;
		
	}
	
	// 마이페이지 후기 조회
	@Override
	public List<Review> mypageSelectReviewList(PageInfo pageInfo, String memberId) {
		
		List<Review> reviewList = reviewStore.mypageSelectReviewList(session, pageInfo , memberId);
		
		return reviewList;
		
	}

	// 마이페이지 후기 게시물 전체개수 검색
	@Override
	public int mypageGetListCount(Search search) {
		
		int result = reviewStore.mypageGetListCount(session, search);
		
		return result;
		
	}
	
	// 마이페이지 후기 게시물 검색
	@Override
	public List<Review> mypageSearchReview(PageInfo pageInfo, Search search) {
		
		List<Review> reviewList = reviewStore.mypageSearchReview(session, pageInfo, search);
		
		return reviewList;
		
	}

}
