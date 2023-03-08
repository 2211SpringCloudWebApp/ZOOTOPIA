package com.kh.zootopia.member.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public List<Member> selectMembers(SqlSession session) {
		List<Member> mList = session.selectList("MemberMapper.selectMembers");
		return mList;
	}

}
