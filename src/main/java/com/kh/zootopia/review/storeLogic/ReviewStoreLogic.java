package com.kh.zootopia.review.storeLogic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;
import com.kh.zootopia.review.store.ReviewStore;

public class ReviewStoreLogic implements ReviewStore {

	@Override
	public int insertReview(SqlSession session, Review review) {
		
		int result = session.insert("ReviewMapper.insertReview", review);
		
		return result;
	}

	@Override
	public List<Review> selectReviewList(SqlSession session, PageInfo pageInfo) {
		
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Review> reviewList = session.selectList("ReviewMapper.selectReviewList", null, rowBounds);
		
		return reviewList;
	}

	@Override
	public int getListCount(SqlSession session) {
		
		int result = session.selectOne("ReviewMapper.selectReviewCount");
		
		return result;
	}

	@Override
	public List<Review> searchReview(SqlSession session, PageInfo pageInfo, Search search) {

		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> reviewList = session.selectList("ReviewMapper.searchNotice", search, rowBounds);
		
		return reviewList;
		
	}
	

	@Override
	public int getListCount(SqlSession session, Search search) {
		
		int result = session.selectOne("ReviewMapper.searchReviewCount", search);
		
		return result;
	}

	
	@Override
	public int deleteReview(SqlSession session, int reviewNo) {

		int result = session.delete("NoticeMapper.deleteNotice", reviewNo);
		
		return result;
	}

	@Override
	public Review selectReview(SqlSession session, int reviewNo) {

		Review review = session.selectOne("ReviewMapper.selectReview", reviewNo);
		
		return review;
	}

}
