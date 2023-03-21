package com.kh.zootopia.AdoptAnimalPost.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalFiltering;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalPaging;
import com.kh.zootopia.AdoptAnimalPost.domain.FilteringAndPaging;
import com.kh.zootopia.AdoptAnimalPost.service.AdoptAnimalService;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.comment.service.CommentService;
import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.reservation.service.ReservationService;


@Controller
public class AdoptAnimalPostController {

	@Autowired
	private AdoptAnimalService aService;
	
	@Autowired
	private ReservationService rService;
	
	@Autowired
	private CommentService cService;

	
	
	// ========== 등록 ========== //

	/**
	 * 입양 공고 등록 폼
	 * 
	 * @return
	 */
	@RequestMapping(value = "/adoptAnimal/registerView.ztp", method = RequestMethod.GET)
	public String animalRegisterView() {
		return "adoptAnimalPost/register";
	}
	

	/**
	 * 입양 등록
	 * 
	 * @param request
	 * @param animal
	 * @param adoptPost
	 * @param uploadFile
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/adoptAnimal/register.ztp", method = RequestMethod.POST)
	public ModelAndView animalRegister(
			HttpServletRequest request
			, @ModelAttribute Animal animal
			, @ModelAttribute AdoptPost adoptPost
			, @RequestParam("characters") List<String> characters
			, String sido
			, String sigungu
			, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, ModelAndView mv) {

		try {
			request.setCharacterEncoding("UTF-8");
			
			// 작성자 = 임보자
			animal.setAnimalFosterId(adoptPost.getAdoptWriterId());	
			
			// 입력받은 성격들 문자열 하나로 모아서 animal객체에 담기
			 String animalCharacter = String.join(";", characters);
			 animal.setAnimalCharacter(animalCharacter);
			 
			// 입력받은 주소 시/군, 시/군/구 문자열 하나로 모아서 animal객체에 담기
			 String animalAddr = sido + " " + sigungu;
			 animal.setAnimalAddr(animalAddr);
			
			// 이미지 이름, 경로 가져오기
			String adoptImageName = uploadFile.getOriginalFilename();
			if (!adoptImageName.equals("")) {
				String adoptImagePath = saveFile(uploadFile, request);
				if (adoptImagePath != null) {
					adoptPost.setAdoptImageName(adoptImageName);
					adoptPost.setAdoptImagePath(adoptImagePath);
				}
			}

			AdoptAnimalPost adoptAnimalPost = new AdoptAnimalPost(animal, adoptPost);
			int result = aService.insertPost(adoptAnimalPost);

			if (result > 0) {
				
				// 입양 공고 등록 성공 시 입양 공고 목록으로 이동함
				mv.setViewName("redirect:/adoptAnimal/list.ztp");
				
			} else {
				
				// 입양 공고 등록 실패 시 실패 alert띄우고 입양 공고 목록으로 이동하도록 바꾸기
				// mv.setViewName("adoptAnimalPost/list");
				
				// 일단은 실패 에러페이지
				mv.addObject("message", "입양 공고 등록 실패").setViewName("common/error");
				
			}

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");

		}

		return mv;
	}

	
	/**
	 * 파일 복사 (지정한 경로로 업로드) 메소드
	 * 
	 * @param uploadFile
	 * @param request
	 * @return
	 */
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {

		try {
			// 내가 원하는 경로 : 프로젝트 경로
			// 어느 컴퓨터에서 실행하든 프로젝트 경로 찾을 수 있도록하기! - resources의 실제 경로 갖고오기!
			String root = request.getSession().getServletContext().getRealPath("resources");

			String savePath = root +"\\uploadFiles";

			// 폴더가 없을 경우 resources아래 폴더 자동 생성
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdir();
			}

			// 파일 실제로 저장
			String filePath = savePath + "\\" + uploadFile.getOriginalFilename();
			File file = new File(filePath);
			uploadFile.transferTo(file);

			return filePath;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	

	// ========== 삭제 ========== //
	
	/**
	 * 입양 공고 삭제
	 * @param animalNo
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/adoptAnimal/delete.ztp", method = RequestMethod.GET)
	public ModelAndView deleteAnimal(
			int animalNo
			, ModelAndView mv) {
		
		try {
			System.out.println("animalNo : " + animalNo);
			int result = aService.deleteAnimal(animalNo);
			if (result > 0) {
				mv.setViewName("redirect:/adoptAnimal/list.ztp");
			} else {
				mv.addObject("message", "입양 공고 삭제 실패").setViewName("common/error");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
		
	
	// ========== 출력 ========== //

	/**
	 * 입양 공고 목록 출력
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/adoptAnimal/list.ztp", method = RequestMethod.GET)
	public ModelAndView animalListView (
			@RequestParam(name = "page", defaultValue = "1") int currentPage
			, ModelAndView mv) {

		try {

			int totalCount = aService.selectTotalAnimalCount();
			AnimalPaging paging = new AnimalPaging(currentPage, totalCount);
			
			List<AdoptAnimalPost> aPostList = aService.selectAllAnimal(paging);
			
			// 페이징 적용하면 15개밖에 못 가져오나??
			// > 그르네 db데이터문제인가 나중에 해결하기~!~!~
			for (int i = 0; i < aPostList.size(); i++) {
				System.out.println(aPostList.get(i));
			}
			

			if (!aPostList.isEmpty()) {

				mv.addObject("aPostList", aPostList);
				mv.addObject("paging", paging);
				mv.setViewName("adoptAnimalPost/list");

			} else {

				mv.addObject("message", "동물 리스트 조회 실패").setViewName("common/error");

			}
		} catch (Exception e) {

			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");

		}

		return mv;
	}
	

	/**
	 * 필터링된 공고 목록 출력
	 * @param filter
	 * @param currentPage
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/adoptAnimal/filteredList.ztp", method = RequestMethod.GET)
	public ModelAndView filteredAnimalList(
			@ModelAttribute AnimalFiltering filter
			, @RequestParam(name = "page", defaultValue = "1") int currentPage
			, ModelAndView mv) {
		
		try {
			
			// 필터링 된 게시글 수 구해서 paging 객체에 넣어주기
			int totalCount = aService.selectFilteredAnimalCount(filter);
			AnimalPaging paging = new AnimalPaging(currentPage, totalCount);
			
			// 필터링과 페이징 같이 전달할 객체 생성
			FilteringAndPaging filteringAndPaging = new FilteringAndPaging(filter, paging);
			
			// 필터링과 페이징 적용 된 리스트 가져오기
			List<AdoptAnimalPost> aPostList = aService.selectFilteredAnimal(filteringAndPaging);

			if (!aPostList.isEmpty()) {
				mv.addObject("aPostList", aPostList);
				mv.addObject("paging", paging);
				mv.setViewName("adoptAnimalPost/list");

			} else {

				mv.addObject("message", "동물 리스트 조회 실패").setViewName("common/error");

			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		
	    return mv;
	}
	
	
	/**
	 * 동물 디테일 출력
	 * 
	 * @param animalNo
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/adoptAnimal/detailView.ztp", method = RequestMethod.GET)
	public ModelAndView animalDetailView(int animalNo, ModelAndView mv) {

		try {
			
			// animalNo를 통해 해당 동물 Detail 정보 가져오기
			AdoptAnimalPost aPost = aService.selectOneByAnimalNo(animalNo);
			
			// animalNo를 통해 해당 동물에 관한 예약 리스트 가져오기 (예약하기 or 예약취소 버튼)
			List<Reservation> rList = rService.selectAllapplicantByAnimalNo(animalNo);

			if (aPost != null) {
				
				// Comment 객체에 boardId랑 postNo 정보 담아서
				Comment cmt = new Comment();
				cmt.setBoardId(aPost.getAdoptPost().getBoardId());
				cmt.setPostNo(aPost.getAdoptPost().getAdoptPostNo());
				
				// 해당 공고에 달린 댓글 가져오기(댓글 대댓글 구분하지 않고!)				
				List<Comment> commentList = cService.selectAdoptComment(cmt);
				
				mv.addObject("aPost", aPost);
				mv.addObject("rList", rList);
				mv.addObject("commentList", commentList);
				mv.setViewName("adoptAnimalPost/detail");
				
			} else {
				mv.addObject("message", "동물 디테일 조회 실패").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}

		return mv;
	}
	

	
	// ========== 매칭 ========== //
	
	/**
	 * 매칭 페이지 메인 뷰
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/matching/mainView.ztp", method = RequestMethod.GET)
	public ModelAndView matchingView(ModelAndView mv) {
		mv.setViewName("adoptAnimalPost/matching");
		return mv;
	}
	
	
	/**
	 * 매칭 페이지에서 축종 갖고와서 성격 선택 페이지로 전달하는 역할만 함!
	 * @param animalSpecies
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/matching/character.ztp", method = RequestMethod.GET)
	public ModelAndView asdfa(
			String animalSpecies
			, ModelAndView mv) {
		mv.addObject("animalSpecies", animalSpecies).setViewName("adoptAnimalPost/matchingCharacter");
		return mv;
	}
	
	
	/**
	 * 매칭 결과 페이지
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/matching/result.ztp", method = RequestMethod.POST)
	public ModelAndView asdfasdfAndView(
			@RequestParam(name = "page", defaultValue = "1") int currentPage
			, String animalSpecies
			, String animalCharacter
			, ModelAndView mv) {
		
		try {
			
			// 선택받은 종, 성격 정보 전달용 animal 객체에 정보 담기
			Animal animalInfo = new Animal();
			animalInfo.setAnimalSpecies(animalSpecies);
			animalInfo.setAnimalCharacter(animalCharacter);
			
			// 페이징에 필요
			int totalCount = aService.selectMatchingAnimalCount(animalInfo);
			AnimalPaging paging = new AnimalPaging(currentPage, totalCount);
			
			List<AdoptAnimalPost> aPostList = aService.selectMatchingAnimal(paging, animalInfo);
			
			if (!aPostList.isEmpty()) {
				mv.addObject("aPostList", aPostList).setViewName("adoptAnimalPost/matchingResult");
				
			} else {
				// 에러페이지 말고 걍 결과 페이지 따로 만들어서 출력하는 방식으로 바꾸기
				// 일단은 걍 에러페이지 이용
				mv.addObject("message", "조건에 맞는 동물 ㄴㄴ").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
	
	
	
	// ========== 댓글 ========== //
	
	/**
	 * 댓글 등록 및 리스트 리턴
	 * @param request
	 * @param animalNo
	 * @param boardId
	 * @param postNo
	 * @param parentCommentNo
	 * @param commentContent
	 * @param commentWriterId
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/adoptAnimal/addComment.ztp", method = RequestMethod.POST)
	public ModelAndView addComment(
			HttpServletRequest request
			, int animalNo
			, @ModelAttribute Comment cmt
			, ModelAndView mv) {

		
		try {
			
			request.setCharacterEncoding("UTF-8");
			
			// 댓글 등록하기
			int result = cService.insertAdoptComment(cmt);
			
			if (result > 0) {
				
				// animalNo를 통해 해당 동물 Detail 정보 가져오기
				AdoptAnimalPost aPost = aService.selectOneByAnimalNo(animalNo);
				
				// animalNo를 통해 해당 동물에 관한 예약 리스트 가져오기 (예약하기 or 예약취소 버튼)
				List<Reservation> rList = rService.selectAllapplicantByAnimalNo(animalNo);

				// 해당 공고에 달린 댓글 가져오기(댓글 대댓글 구분하지 않고!)				
				// boardId, postNo 일치하는 거 다 가져온 다음에 jsp에서 if문으로 나눠줄 거임!
				List<Comment> commentList = cService.selectAdoptComment(cmt);
				
				mv.addObject("commentList", commentList);
				mv.addObject("aPost", aPost);
				mv.addObject("rList", rList);
				mv.setViewName("adoptAnimalPost/detail");
				
			} else {
				mv.addObject("message", "댓글 등록 실패!").setViewName("common/error");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		
		return mv;
	}
	
	
}
