package com.kh.zootopia.member.store.logic;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	// 멤버 등록
	@Override
	public int intsertMember(SqlSession session, Member member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

	// 멤버 수정
	@Override
	public int updateMember(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMember", member);
		return result;
	}

	// 멤버 삭제 
	@Override
	public int deleteMember(SqlSession session, String memberId) {
		int result = session.delete("MemberMapper.deleteMember", memberId);
		return result;
	}

	// 멤버 로그인 
	@Override
	public Member checkMemberLogin(SqlSession session, Member mParam) {
		Member member = session.selectOne("MemberMapper.checkMemberLogin", mParam);
		return member;
	}

	// 멤버 아이디 찾기
	@Override
	public Member findId(SqlSession session, Member mParam) {
		Member member = session.selectOne("MemberMapper.findId" , mParam);
		return member;
	}

	// 멤버 비밀번호 찾기
	@Override
	public Member findPw(SqlSession session, Member mParam) {
		Member member = session.selectOne("MemberMapper.findPw" , mParam);
		return member;
	}

	
}
