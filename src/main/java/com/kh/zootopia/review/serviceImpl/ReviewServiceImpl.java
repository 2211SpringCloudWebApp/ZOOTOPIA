package com.kh.zootopia.review.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int deleteReview(int reviewNo) {

		int result = reviewStore.deleteReview(session, reviewNo);
		
		return 0;
	}

	@Override
	public Review selectReview(int reviewNo) {

		Review review = reviewStore.selectReview(session, reviewNo);
		
		return null;
	}

}
