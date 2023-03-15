package com.kh.zootopia.member.store;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.member.domain.Member;

public interface MemberStore {

	
	/** 
	 * 멤버 등록 Store
	 * @param session
	 * @param member
	 * @return
	 */
	int intsertMember(SqlSession session, Member member);

	
	/**
	 * 멤버 수정 Store
	 * @param session
	 * @param member
	 * @return
	 */
	int updateMember(SqlSession session, Member member);


	/**
	 * 멤버 삭제 Store
	 * @param session
	 * @param memberId
	 * @return
	 */
	int deleteMember(SqlSession session, String memberId);


	/**
	 * 멤버 로그인 Store
	 * @param session
	 * @param mParam
	 * @return
	 */
	Member checkMemberLogin(SqlSession session, Member mParam);


	/**
	 * 멤버 아이디 찾기 Store
	 * @param session
	 * @param mParam
	 * @return
	 */
	Member findId(SqlSession session, Member mParam);


	/**
	 * 멤버 비밀번호 찾기 Store
	 * @param session
	 * @param mParam
	 * @return
	 */
	Member findPw(SqlSession session, Member mParam);

	


}
