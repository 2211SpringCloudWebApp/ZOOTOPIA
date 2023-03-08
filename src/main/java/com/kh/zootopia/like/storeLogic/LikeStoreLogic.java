package com.kh.zootopia.like.storeLogic;

import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.store.LikeStore;

public class LikeStoreLogic implements LikeStore {

	@Override
	public int checkLike(SqlSession session, Like like) {
		
		int result = Integer.parseInt(session.selectOne("Like.checkLike", like)); // select count(*)를 이용해 결과 도출 후 정수형으로 바꿔서 int result에 저장 
		
		return result;
		
	}

	@Override
	public int insertLike(SqlSession session, Like like) {
		
		int result = session.insert("Like.insertLike", like); 
		
		return result;
		
	}
	
}
