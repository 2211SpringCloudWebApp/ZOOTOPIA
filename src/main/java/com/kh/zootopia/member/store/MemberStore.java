package com.kh.zootopia.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.member.domain.Member;

public interface MemberStore {

	List<Member> selectMembers(SqlSession session);

}
