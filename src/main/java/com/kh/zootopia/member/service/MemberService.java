package com.kh.zootopia.member.service;

import com.kh.zootopia.member.domain.Member;

public interface MemberService {

	
	/**
	 * 멤버 등록 Service
	 * @param member
	 * @return
	 */
	int insertMember(Member member);

	
	/**
	 * 멤버 수정 Service
	 * @param member
	 * @return
	 */
	int updateMember(Member member);


	/**
	 * 멤버 삭제 Service
	 * @param memberId
	 * @return
	 */
	int deleteMember(String memberId);


	// 멤버 로그인 Service
	Member checkMemberLogin(Member mParam);


	// 멤버 아이디 찾기 Service
	Member findId(Member mParam);


	// 멤버 비밀번호 찾기 Service
	Member findPw(Member mParam);



}
