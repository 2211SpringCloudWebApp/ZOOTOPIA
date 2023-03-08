package com.kh.zootopia.review.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;

@Service
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
	 * @param reviewNo
	 * @return int
	 */
	public int deleteReview(int reviewNo);

	/**
	 * 후기 상세 페이지 Service
	 * @param reviewNo
	 * @return Review
	 */
	public Review selectReview(int reviewNo);

}
