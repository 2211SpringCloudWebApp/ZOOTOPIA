package com.kh.zootopia.notice.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zootopia.comment.controller.CommentController;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.notice.domain.Notice;
import com.kh.zootopia.notice.service.NoticeService;
import com.kh.zootopia.review.domain.PageInfo;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	@Autowired
	private CommentController commentController;
	
	// 공지사항 등록화면
	@RequestMapping(value="/notice/registerView.ztp", method=RequestMethod.GET)
	public String noticeRegisterView() {
		try {
			return "notice/register";
		} catch (Exception e) {
			return "common/error";
		}
	}
	
	// 공지사항 등록
	@RequestMapping(value="/notice/register.ztp", method=RequestMethod.POST)
	public String noticeRegister(
			HttpServletRequest request
			, @ModelAttribute Notice notice
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
			// 파일이 있을 경우
			if(!uploadFile.getOriginalFilename().equals("")) {
				// 파일 복사(지정한 경로 업로드)
				String filePath = saveFile(uploadFile, request);
				if(filePath != null) {
					notice.setNoticeImageName(uploadFile.getOriginalFilename());
					notice.setNoticeImagePath(filePath);
				}
			}			
			int result = nService.insertNotice(notice);
			if(result > 0) {
				return "redirect:/notice/list.ztp";
			}else {
				model.addAttribute("message", "");
				return "";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 공지사항 수정
	@RequestMapping(value="/notice/modify.ztp", method=RequestMethod.POST)
	public String noticeModify(
			@ModelAttribute Notice notice
			, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
			, Model model
			, HttpServletRequest request) {
		try {
			// 수정할 때, 새로 업로드된 파일이 있는 경우
			if(!reloadFile.isEmpty()) {
				// 기존 업로드 된 파일 체크 후
				if(notice.getNoticeImageName() != null) {
					// 기존 파일 삭제
					this.deleteFile(notice.getNoticeImageName(), request);
				}
				// 새로 업로드 된 파일 복사(지정된 경로 업로드)
				String modifyPath = this.saveFile(reloadFile, request);
				if(modifyPath != null) {
					// notice에 새로운 파일 이름, 파일 경로 set
					notice.setNoticeImageName(reloadFile.getOriginalFilename());
					notice.setNoticeImagePath(modifyPath);
				}
			}				
			int result = nService.updateNotice(notice);
			if(result > 0) {
				return "redirect:/notice/list.ztp";
			}else {
				model.addAttribute("message", "");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/notice/remove.ztp", method=RequestMethod.GET)
	public String noticeRemove(@RequestParam("noticeNo") int noticeNo, Model model) {
		try {
			int result = nService.deleteNotice(noticeNo);
			if(result > 0) {
				return "redirect:/notice/list.ztp";
			}else {
				model.addAttribute("message", "");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}

	// 공지사항 목록 조회
	@RequestMapping(value="/notice/list.ztp", method=RequestMethod.GET)
	public String noticeListView(
			HttpSession session
			, Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		int totalCount = nService.getListCount();
		
		PageInfo pi = this.getPageInfo(page, totalCount);		
		List<Notice> nList = nService.selectNoticeList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("nList", nList);
		return "notice/list";
	}
	
	// 공지사항 상세 조회
	@RequestMapping(value="/notice/detail.ztp", method={RequestMethod.GET, RequestMethod.POST})
	public String noticeDetailView(
			@RequestParam("noticeNo") int noticeNo, Model model) {
		try {
			Notice notice = nService.selectOneByNo(noticeNo);
			nService.updateNoticeView(noticeNo);
			
			Comment comment = new Comment();
			comment.setBoardId("N");
			comment.setPostNo(noticeNo);
			List<Comment> commentList = commentController.commentList(comment); // 해당 게시물의 댓글 가져오기
			
			model.addAttribute("notice", notice);
			model.addAttribute("commentList", commentList); // 댓글 정보
			return "notice/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 공지사항 검색
	@RequestMapping(value="/notice/search.ztp", method=RequestMethod.GET)
	private String noticeSearchView(
			@ModelAttribute Search search
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model) {
		try {
			//System.out.println(search.toString());
			int totalCount = nService.getListCount(search);
			PageInfo pi = this.getPageInfo(currentPage, totalCount);
			List<Notice> searchList = nService.selectListByKeyword(pi, search);
			//System.out.println(searchList);
			if(!searchList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("pi", pi);
				model.addAttribute("sList", searchList);
				return "notice/search";
			}else {
				model.addAttribute("message", "");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// navigator start, end 값 설정 method()
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int navLimit = 10;
		int maxPage;
		int startNav;
		int endNav;
		
		maxPage = (int)Math.ceil((double) totalCount / boardLimit);
		startNav = (((int)((double)currentPage/navLimit+0.9))-1)*navLimit+1;
		endNav = startNav + navLimit - 1;
		if(endNav > maxPage) {
			endNav = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, totalCount, navLimit, startNav, endNav, maxPage);
		return pi;
	}
	
	// 지정 경로로 파일 복사(파일 업로드)
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		// 내가 원하는 경로 : 프로젝트 경로
		try {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\nuploadFiles";
			// 폴더가 없을 경우 자동 생성
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}
			// 파일저장
			String filePath = savePath + "\\" + uploadFile.getOriginalFilename();
			File file = new File(filePath);
			uploadFile.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 기존 파일 삭제
	private void deleteFile(String filename, HttpServletRequest request) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "\\nuploadFiles";
		String delFilepath = delPath + "\\" + filename;
		File delFile = new File(delFilepath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}	
}
