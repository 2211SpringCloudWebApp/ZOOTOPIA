package com.kh.zootopia.notice.service;

import java.util.List;

import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.notice.domain.Notice;
import com.kh.zootopia.review.domain.PageInfo;


public interface NoticeService {


	/**
	 * 공지사항 등록 Service
	 * @param notice
	 * @return int
	 */
	public int insertNotice(Notice notice);

	/**
	 * 공지사항 수정 Service
	 * @param notice
	 * @return int
	 */
	public int updateNotice(Notice notice);

	/**
	 * 조회수 증가 Service
	 * @param noticeNo
	 */
	public int updateNoticeView(int noticeNo);

	/**
	 * 공지사항 삭제 Service
	 * @param noticeNo
	 * @return int
	 */
	public int deleteNotice(int noticeNo);

	/**
	 * 공지사항 목록 조회 Service
	 * @param pi 
	 * @return List<Notice>
	 */
	public List<Notice> selectNoticeList(PageInfo pi);

	/**
	 * 공지사항 상세 조회 Service
	 * @param noticeNo
	 * @return Notice
	 */
	public Notice selectOneByNo(int noticeNo);

	/**
	 * 공지사항 검색 Service
	 * @param pi
	 * @param search
	 * @return List<Notice>
	 */
	public List<Notice> selectListByKeyword(PageInfo pi, Search search);

	/**
	 * 공지사항 게시물 전체 개수 Service
	 * @return int
	 */
	public int getListCount();

	/**
	 * 공지사항 검색 게시물 전체 개수 Service
	 * @param search
	 * @return int
	 */
	public int getListCount(Search search);
	
}
