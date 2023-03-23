package com.kh.zootopia.manager.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.manager.store.ManagerStore;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.review.domain.PageInfo;

@Repository
public class ManagerStoreLogic implements ManagerStore{

	// **회원관리
	// 멤버리스트 Controller
	@Override
	public List<Member> selectMembers(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> mList = session.selectList("ManagerMapper.selectMembers", null, rowBounds);
		return mList;
	}

	// 멤버리스트 페이징처리
	@Override
	public int getMemberListCount(SqlSession session) {
		int result = session.selectOne("MemberMapper.getMemberListCount");
		return result;
	}

	// 멤버검색 Controller
	@Override
	public List<Member> searchMember(SqlSession session, Search search, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> mList = session.selectList("ManagerMapper.searchMember", search, rowBounds);
		return mList;
	}

	// 멤버검색 페이징처리
	@Override
	public int getSearchMemberCount(SqlSession session, Search search) {
		int result = session.selectOne("MemberMapper.getSearchMemberCount", search);
		return result;
	}

	// 멤버디테일 Controller
	@Override
	public Member selectOneById(SqlSession session, String memberId) {
		Member mOne = session.selectOne("ManagerMapper.selectOneById", memberId);
		return mOne;
	}

	// 멤버삭제 Controller
	@Override
	public int deleteMember(SqlSession session, String memberId) {
		int result = session.delete("ManagerMapper.deleteMember", memberId);
		return result;
	}

	// 체크된멤버삭제 Controller
	@Override
	public void deleteCheckedMembers(SqlSession session, String memberId) {
		session.delete("ManagerMapper.deleteMember", memberId);
	}

	
	// ** 입양공고관리
	// 미승인 입양공고리스트 Controller
	@Override
	public List<AdoptAnimalPost> selectAdopt(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AdoptAnimalPost> aList = session.selectList("AdoptPostMapper.selectAdopt", null, rowBounds);
		return aList;
	}

	// 미승인 입양공고리스트 페이징처리
	@Override
	public int getAdoptListCount(SqlSession session) {
		int result = session.selectOne("AdoptPostMapper.getAdoptListCount");
		return result;
	}

	// 미승인 입양공고리스트에서 승인 Controller
	@Override
	public void approveAdopts(SqlSession session, int adoptPostNo) {
		session.update("AdoptPostMapper.approveAdopt", adoptPostNo );
	}

	// 입양공고리스트 내 여러개 삭제 Controller
//	@Override
//	public void deleteAdopts(SqlSession session, int adoptPostNo) {
//		session.delete("AdoptPostMapper.deleteAdopts", adoptPostNo);
//	}
	
	// 미승인 입양공고디테일 Controller
//	@Override
//	public AdoptAnimalPost detailAdopt(SqlSession session, Integer animalNo) {
//		AdoptAnimalPost aPost = session.selectOne("AnimalMapper.detailAdopt", animalNo);
//		return aPost;
//	}


	// ** 예약관리
	// 예약페이지 Detail Controller
	@Override
	public List<AdoptPost> viewReservation(SqlSession session, DateDTO dateDTO) {
		List<AdoptPost> aList = session.selectList("ReservationMapper.selectReservations", dateDTO);
		return aList;
	}

	// 예약승인 Controller
	@Override
	public int approveReserv(SqlSession session, Reservation rParam) {
		int result1 = session.update("ReservationMapper.approveReserv", rParam);
		System.out.println(result1);
		int result2 = session.update("AnimalMapper.updateAdopterId", rParam);
		System.out.println(result2);
		int result = 0;
		if (result1>0 && result2>0) result = 1;
		return result;
	}
	@Override
	public Reservation selectOneByReservationNo(SqlSession session, int reservationNo) {
		Reservation rParam = session.selectOne("ReservationMapper.selectOneByReservationNo", reservationNo);
		return rParam;
	}

	
	// ** 리뷰관리
	// 체크된 리뷰삭제 Controller
	@Override
	public void deleteCheckedReviews(SqlSession session, int reviewPostNo) {
		session.delete("ReviewMapper.deleteReview", reviewPostNo);
	}
	

	// **댓글관리
	// 댓글리스트 Controller
	@Override
	public List<Comment> selectComments(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Comment> cList = session.selectList("CommentMapper.selectComments", null, rowBounds);
		return cList;
	}

	// 댓글리스트 페이징처리
	@Override
	public int getCommentListCount(SqlSession session) {
		int result = session.selectOne("CommentMapper.getCommentListCount");
		return result;
	}

	// 체크된댓글삭제 Controller
	@Override
	public void deleteCheckedComments(SqlSession session, int commentNo) {
		session.delete("CommentMapper.deleteCheckedComments", commentNo);
	}

	// 댓글디테일 Controller
	@Override
	public Comment detailComment(SqlSession session, int commentNo) {
		Comment comment = session.selectOne("CommentMapper.detailComment", commentNo);
		return comment;
	}

	// 댓글삭제 Controller
	@Override
	public int deleteComment(SqlSession session, int commentNo) {
		int result = session.delete("CommentMapper.deleteCheckedComments", commentNo);
		return result;
	}


}
