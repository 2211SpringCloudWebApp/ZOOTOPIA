package com.kh.zootopia.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;
import com.kh.zootopia.review.store.ReviewStore;

@Repository
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
		session.delete("CommentMapper.deleteAllCommentsFromReview", reviewPostNo); // 리뷰글이 지워지면 그 글에 대한 댓글도 모두 삭제
		
		return result;
		
	}

	@Override
	public Review selectReview(SqlSession session, int reviewPostNo) {
		
		Review review = session.selectOne("ReviewMapper.selectReview", reviewPostNo);

		return review;
		
	}

	@Override
	public void viewCount(SqlSession session, int reviewPostNo) {
		
		session.update("ReviewMapper.reviewViewCount", reviewPostNo);
		
	}
	
	@Override
	public Animal selectAnimalByAnimalNo(SqlSession session, int animalNo) {
		
		Animal animal = session.selectOne("AnimalMapper.selectAnimalByAnimalNo", animalNo);
		
		return animal;
		
	}
	
	//------------------------------------------------------------------------------------------------------------------
	// 후기 목록 조회
	@Override
	public List<Review> mypageSelectReviewList(SqlSession session, PageInfo pageInfo , String memberId) {
		
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Review> reviewList = session.selectList("ReviewMapper.mypageSelectReviewList", memberId, rowBounds);
		
		return reviewList;
		
	}
	
	// 후기 게시물 전체개수 
	@Override
	public int mypageGetListCount(SqlSession session, Search search) {
		
		int result = session.selectOne("ReviewMapper.selectMypageReviewCount");
		
		return result;
		
	}

	// 후기 게시물 검색
	@Override
	public List<Review> mypageSearchReview(SqlSession session, PageInfo pageInfo, Search search) {
		
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Review> reviewList = session.selectList("ReviewMapper.mypageSearchReview", search, rowBounds);
		
		return reviewList;
		
	}

	@Override
	public int modifyReview(SqlSession session, Review review) {
		
		int result = session.update("ReviewMapper.modifyReview", review);
		
		return result;
	}
	
}
