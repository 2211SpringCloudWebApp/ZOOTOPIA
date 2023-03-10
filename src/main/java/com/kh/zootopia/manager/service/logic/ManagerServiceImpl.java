package com.kh.zootopia.manager.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.manager.service.ManagerService;
import com.kh.zootopia.manager.store.ManagerStore;
import com.kh.zootopia.member.domain.Member;


@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private ManagerStore mStore;

	@Override
	public List<Member> selectMembers() {
		List<Member> mList = mStore.selectMembers(session);
		return mList;
	}

	@Override
	public Member selectOneById(String memberId) {
		Member mOne = mStore.selectOneById(session, memberId);
		return mOne;
	}

	@Override
	public int deleteMember(String memberId) {
		int result = mStore.deleteMember(session, memberId);
		return result;
	}

	@Override
	public List<Member> searchMember(Search search) {
		List<Member> mList = mStore.searchMember(session, search);
		return mList;
	}

	@Override
	public void deleteCheckedMembers(String memberId) {
		mStore.deleteCheckedMembers(session, memberId);
	}

	@Override
	public List<AdoptPost> selectAdopt() {
		List<AdoptPost> aList = mStore.selectAdopt(session);
		return aList;
	}

}
