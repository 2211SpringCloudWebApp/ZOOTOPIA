package com.kh.zootopia.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;
import com.kh.zootopia.review.store.ReviewStore;

@Repository
public class ReviewStoreLogic implements ReviewStore {

	@Override
	public int insertReview(SqlSession session, Review review) {
		
		System.out.println("StoreLogic review : " + review);
		
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
		List<Review> reviewList = session.selectList("ReviewMapper.searchReview", search, rowBounds);
		
		return reviewList;
		
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		
		int result = session.selectOne("ReviewMapper.searchReviewCount", search);
		
		return result;
	}

	
	@Override
	public int deleteReview(SqlSession session, int reviewPostNo) {

		int result = session.delete("ReviewMapper.deleteReview", reviewPostNo);
		
		return result;
	}

	@Override
	public Review selectReview(SqlSession session, int reviewPostNo) {

		Review review = session.selectOne("ReviewMapper.selectReview", reviewPostNo);

		return review;
	}

	@Override
	public void viewCount(SqlSession session, int reviewPostNo) {
		
		session.update("reviewViewCount", reviewPostNo);
		
	}
<<<<<<< HEAD
	
	// 후기 목록 조회
	@Override
	public List<Review> mypageSelectReviewList(SqlSession session, PageInfo pageInfo , String memberId ) {
		
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> reviewList = session.selectList("ReviewMapper.mypageSelectReviewList", memberId, rowBounds);
		
		return reviewList;
		
	}
=======
>>>>>>> refs/heads/WhoAmI_0315

}
