package com.kh.zootopia.like.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.store.LikeStore;

@Repository
public class LikeStoreLogic implements LikeStore {

	@Override
	public int checkLike(SqlSession session, Like like) {
		
		int result = session.selectOne("LikeMapper.checkLike", like); // select count(*)를 이용해 결과 도출 후 정수형으로 바꿔서 int result에 저장 
		
		return result;
		
	}

	@Override
	public int insertLike(SqlSession session, Like like) {
		
		int result = session.insert("LikeMapper.insertLike", like); 
		
		return result;
		
	}

	@Override
	public int cancelLike(SqlSession session, Like like) {
		
		int result = session.delete("LikeMapper.cancelLike", like);
		
		return result;
	}
	
}
