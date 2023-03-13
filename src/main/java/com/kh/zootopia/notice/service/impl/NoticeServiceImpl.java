package com.kh.zootopia.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.notice.domain.Notice;
import com.kh.zootopia.notice.service.NoticeService;
import com.kh.zootopia.notice.store.NoticeStore;
import com.kh.zootopia.review.domain.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSession session;
	@Autowired
	private NoticeStore nStore;
	
	@Override
	public int insertNotice(Notice notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = nStore.updateNotice(session, notice);
		return result;
	}

	@Override
	public int updateNoticeView(int noticeNo) {
		int result = nStore.updateNoticeView(session, noticeNo);
		return result;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int result = nStore.deleteNotice(session, noticeNo);
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(PageInfo pi) {
		List<Notice> nList = nStore.selectNoticeList(session, pi);
		return nList;
	}

	@Override
	public Notice selectOneByNo(int noticeNo) {
		Notice notice = nStore.selectOneByNo(session, noticeNo);
		return notice;
	}

	@Override
	public List<Notice> selectListByKeyword(PageInfo pi, Search search) {
		List<Notice> searchList = nStore.selectListByKeyword(session, pi, search);
		return searchList;
	}

	@Override
	public int getListCount() {
		int result = nStore.getListCount(session);
		return result;
	}

	@Override
	public int getListCount(Search search) {
		int totalCount = nStore.getListCount(session, search);
		return totalCount;
	}
}
