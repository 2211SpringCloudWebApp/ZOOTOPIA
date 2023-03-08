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

}
