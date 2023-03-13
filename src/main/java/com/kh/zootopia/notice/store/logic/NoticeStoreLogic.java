package com.kh.zootopia.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.notice.domain.Notice;
import com.kh.zootopia.notice.store.NoticeStore;
import com.kh.zootopia.review.domain.PageInfo;

@Repository
public class NoticeStoreLogic implements NoticeStore {


	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int updateNotice(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public int updateNoticeView(SqlSession session, int noticeNo) {
		int result = session.update("NoticeMapper.updateNoticeView", noticeNo);
		return result;
	}

	@Override
	public int deleteNotice(SqlSession session, int noticeNo) {
		int result = session.delete("NoticeMapper.deleteNotice", noticeNo);
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);		
		List<Notice> nList = session.selectList("NoticeMapper.selectNoticeList", null, rowBounds);
		return nList;
	}

	@Override
	public Notice selectOneByNo(SqlSession session, int noticeNo) {
		Notice notice = session.selectOne("NoticeMapper.selectOnyByNo", noticeNo);
		return notice;
	}

	@Override
	public List<Notice> selectListByKeyword(SqlSession session, PageInfo pi, Search search) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Notice> searchList = session.selectList("NoticeMapper.selectListByKeyword", search, rowBounds);
		return searchList;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("NoticeMapper.getListCount");
		return result;
	}

	@Override
	public int getListCount(SqlSession session, Search search) {
		int result = session.selectOne("NoticeMapper.getSearchListCount", search);
		return result;
	}
	
}
