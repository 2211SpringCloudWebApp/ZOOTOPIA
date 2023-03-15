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
	SqlSession session;
	@Autowired
	MemberStore mStore;

	
	// 등록
	@Override
	public int insertMember(Member member) {
		int result=mStore.intsertMember(session, member);
		return result;
	}


	// 수정
	@Override
	public int updateMember(Member member) {
		int result = mStore.updateMember(session, member);
		return result;
	}


	// 삭제
	@Override
	public int deleteMember(String memberId) {
		int result = mStore.deleteMember(session, memberId);
		return result;
	}


	// 로그인
	@Override
	public Member checkMemberLogin(Member mParam) {
		Member member = mStore.checkMemberLogin(session, mParam);
		return member;
	}


	// 아이디 찾기
	@Override
	public Member findId(Member mParam) {
		Member member = mStore.findId(session, mParam);
		return member;
	}

	// 비밀번호 찾기
	@Override
	public Member findPw(Member mParam) {
		Member member = mStore.findPw(session, mParam);
		return member;
	}


	
	



}
