package com.kh.zootopia.manager.service;

import java.util.List;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.review.domain.PageInfo;

public interface ManagerService {

	List<Member> selectMembers(PageInfo pi);

	Member selectOneById(String memberId);

	int deleteMember(String memberId);

	List<Member> searchMember(Search search);

	void deleteCheckedMembers(String memberId);

	List<AdoptPost> selectAdopt(PageInfo pi);

	void approveAdopts(int adoptPostNo);

	void deleteAdopts(int animalNo);

//	예약페이지
	List<AdoptPost> viewReservation(DateDTO dateDTO);

	int approveReserv(int reservationNo);

//	페이징처리
	int getMemberListCount();

	int getAdoptListCount();


}
