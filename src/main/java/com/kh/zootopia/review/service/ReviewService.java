package com.kh.zootopia.review.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;

public interface ReviewService {

	/**
	 * 후기 등록 Service
	 * @param review
	 * @return int
	 */
	public int insertReview(Review review);

	/**
	 * 후기 목록 조회 Service
	 * @param pageInfo
	 * @return List<Review>
	 */
	public List<Review> selectReviewList(PageInfo pageInfo);
	
	/**
	 * 후기 게시물 전체 개수 Service
	 * @return int
	 */
	public int getListCount();

	/**
	 * 후기 게시물 검색 Service
	 * @param pageInfo
	 * @param search
	 * @return List<Review>
	 */
	public List<Review> searchReview(PageInfo pageInfo, Search search);
	
	/**
	 * 검색된 후기 게시물 전체 개수 Service
	 * @return int
	 */
	public int getListCount(Search search);

	/**
	 * 후기 삭제 Service
	 * @param reviewPostNo
	 * @return int
	 */
	public int deleteReview(int reviewPostNo);

	/**
	 * 후기 상세 페이지 Service
	 * @param reviewPostNo
	 * @return Review
	 */
	public Review selectReview(int reviewPostNo);
	
	/**
	 * 후기 조회수 증가 Service
	 * @param reviewPostNo
	 */
	public void viewCount(int reviewPostNo);

	/**
	 * 후기 목록에 출력을 위한 Animal값을 가져오는 Service
	 * @param animalNo
	 * @return Animal
	 */
	public Animal selectAnimalByAnimalNo(int animalNo);
	
	// 마이페이지에서 넘어오는 부분
	/**
	 * 마이페이지 후기 목록 조회 Service
	 * @param pageInfo
	 * @return
	 */
	public List<Review> mypageSelectReviewList(PageInfo pageInfo , String memberId);

	/**
	 * 마이페이지 검색된 후기 게시물 전체 개수 Service
	 * @return int
	 */
	public int mypageGetListCount(Search search);

	/**
	 * 마이페이지 후기 게시글 검색 Service
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	public List<Review> mypageSearchReview(PageInfo pageInfo, Search search);
	
}
