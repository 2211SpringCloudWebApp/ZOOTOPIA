package com.kh.zootopia.manager.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.manager.store.ManagerStore;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.review.domain.PageInfo;

@Repository
public class ManagerStoreLogic implements ManagerStore{

	@Override
	public List<Member> selectMembers(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> mList = session.selectList("ManagerMapper.selectMembers", null, rowBounds);
		return mList;
	}

	@Override
	public Member selectOneById(SqlSession session, String memberId) {
		Member mOne = session.selectOne("ManagerMapper.selectOneById", memberId);
		return mOne;
	}

	@Override
	public int deleteMember(SqlSession session, String memberId) {
		int result = session.delete("ManagerMapper.deleteMember", memberId);
		return result;
	}

	@Override
	public List<Member> searchMember(SqlSession session, Search search) {
		List<Member> mList = session.selectList("ManagerMapper.searchMember", search);
		return mList;
	}

	@Override
	public void deleteCheckedMembers(SqlSession session, String memberId) {
		session.delete("ManagerMapper.deleteMember", memberId);
	}

	@Override
	public List<AdoptPost> selectAdopt(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AdoptPost> aList = session.selectList("AdoptPostMapper.selectAdopt", null, rowBounds);
		return aList;
	}

	@Override
	public void approveAdopts(SqlSession session, int adoptPostNo) {
		session.update("AdoptPostMapper.approveAdopt", adoptPostNo );
	}

	@Override
	public void deleteAdopts(SqlSession session, int adoptPostNo) {
		session.delete("AdoptPostMapper.deleteAdopts", adoptPostNo);
	}

	// 예약페이지
	@Override
	public List<AdoptPost> viewReservation(SqlSession session, DateDTO dateDTO) {
		List<AdoptPost> aList = session.selectList("ReservationMapper.selectReservations", dateDTO);
		return aList;
	}

	@Override
	public int approveReserv(SqlSession session, int reservationNo) {
		int result = session.update("ReservationMapper.approveReserv", reservationNo);
		return result;
	}

	// 페이징처리
	@Override
	public int getMemberListCount(SqlSession session) {
		int result = session.selectOne("MemberMapper.getMemberListCount");
		return result;
	}

	@Override
	public int getAdoptListCount(SqlSession session) {
		int result = session.selectOne("AdoptPostMapper.getAdoptListCount");
		return result;
	}

	@Override
	public void deleteCheckedReviews(SqlSession session, int reviewPostNo) {
		session.delete("ReviewMapper.deleteReview", reviewPostNo);
	}

}
