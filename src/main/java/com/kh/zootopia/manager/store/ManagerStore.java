package com.kh.zootopia.manager.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.member.domain.Member;

public interface ManagerStore {

	List<Member> selectMembers(SqlSession session);

	Member selectOneById(SqlSession session, String memberId);

	int deleteMember(SqlSession session, String memberId);

	List<Member> searchMember(SqlSession session, Search search);

	void deleteCheckedMembers(SqlSession session, String memberId);

	List<AdoptPost> selectAdopt(SqlSession session);

	void approveAdopts(SqlSession session, int adoptPostNo);

	void deleteAdopts(SqlSession session, int animalNo);

	//예약페이지
	List<AdoptPost> viewReservation(SqlSession session, DateDTO dateDTO);


}
