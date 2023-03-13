package com.kh.zootopia.manager.service;

import java.util.List;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.member.domain.Member;

public interface ManagerService {

	List<Member> selectMembers();

	Member selectOneById(String memberId);

	int deleteMember(String memberId);

	List<Member> searchMember(Search search);

	void deleteCheckedMembers(String memberId);

	List<AdoptPost> selectAdopt();

	void approveAdopts(int adoptPostNo);

	void deleteAdopts(int animalNo);


}
