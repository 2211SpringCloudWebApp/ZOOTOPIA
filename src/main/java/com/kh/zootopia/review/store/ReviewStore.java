package com.kh.zootopia.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;

public interface ReviewStore {
	
	/**
	 * 후기 등록 Store
	 * @param session
	 * @param review
	 * @return int
	 */
	public int insertReview(SqlSession session, Review review);
	
	/**
	 * 후기 목록 조회 Store
	 * @param session
	 * @param pageInfo
	 * @return List<Review>
	 */
	public List<Review> selectReviewList(SqlSession session, PageInfo pageInfo);
	
	/**
	 * 후기 게시물 전체 개수 Store
	 * @param session
	 * @return int
	 */
	public int getListCount(SqlSession session);

	/**
	 * 후기 게시물 검색 Store
	 * @param session
	 * @param pageInfo
	 * @param search
	 * @return List<Review>
	 */
	public List<Review> searchReview(SqlSession session, PageInfo pageInfo, Search search);
	
	/**
	 * 검색된 후기 게시물 전체 개수 Store
	 * @param session
	 * @param search
	 * @return int
	 */
	public int getListCount(SqlSession session, Search search);

	/**
	 * 후기 삭제 Store
	 * @param session
	 * @param reviewPostNo
	 * @return int
	 */
	public int deleteReview(SqlSession session, int reviewPostNo);

	/**
	 * 후기 상세 페이지 Store
	 * @param session
	 * @param reviewPostNo
	 * @return Review
	 */
	public Review selectReview(SqlSession session, int reviewPostNo);

	/**
	 * 후기 조회수 증가 Store
	 * @param session
	 * @param reviewPostNo
	 */
	public void viewCount(SqlSession session, int reviewPostNo);

	/**
	 * 후기 목록에 출력을 위한 Animal값을 가져오는 Store
	 * @param session
	 * @param animalNo
	 * @return Animal
	 */
	public Animal selectAnimalByAnimalNo(SqlSession session, int animalNo);
	
	// 마이페이지에서 넘어오는 부분
	/**
	 * 후기 목록 조회 Store
	 * @param session
	 * @param pageInfo
	 * @return
	 */
	public List<Review> mypageSelectReviewList(SqlSession session, PageInfo pageInfo , String memberid);

	/**
	 * 후기 게시물 검색 개수 Store
	 * @param session
	 * @param search
	 * @return
	 */
	public int mypageGetListCount(SqlSession session, Search search);

	/**
	 * 후기 게시물 검색 Store
	 * @param session
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	public List<Review> mypageSearchReview(SqlSession session, PageInfo pageInfo, Search search);

	/**
	 * 후기 수정 Store
	 * @param session
	 * @param review
	 * @return int
	 */
	public int modifyReview(SqlSession session, Review review);

}
