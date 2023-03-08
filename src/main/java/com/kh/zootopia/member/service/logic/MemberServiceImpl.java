package com.kh.zootopia.member.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.service.MemberService;
import com.kh.zootopia.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession session;
	@Autowired
	private MemberStore mStore;
	
	@Override
	public List<Member> selectMembers() {
		List<Member> mList = mStore.selectMembers(session);
		return mList;
	}

}
