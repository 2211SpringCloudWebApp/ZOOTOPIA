package com.kh.zootopia.like.service.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.service.LikeService;
import com.kh.zootopia.like.store.LikeStore;

@Repository
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeStore likeStore;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int checkLike(Like like) {
		
		int result = likeStore.checkLike(session, like);
		
		return result;

	}

	@Override
	public int insertLike(Like like) {
		
		int result = likeStore.insertLike(session, like);
		
		return result;
	}

	@Override
	public int cancelLike(Like like) {
		
		int result = likeStore.cancelLike(session, like);
		
		return result;
		
	}

}
