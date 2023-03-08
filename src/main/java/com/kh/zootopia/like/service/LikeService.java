package com.kh.zootopia.like.service;

import org.springframework.stereotype.Service;

import com.kh.zootopia.like.domain.Like;

@Service
public interface LikeService {

	/**
	 * 좋아요 확인
	 * @param like
	 * @return int
	 */
	public int checkLike(Like like);

	/**
	 * 좋아요 입력
	 * @param like
	 * @return int
	 */
	public int insertLike(Like like);

	/**
	 * 좋아요 취소
	 * @param like
	 * @return int
	 */
	public int cancelLike(Like like);

}
