package com.kh.zootopia.AdoptAnimalPost.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.AdoptAnimalPost.domain.AnimalPaging;
import com.kh.zootopia.AdoptAnimalPost.service.AdoptAnimalService;

@Controller
public class AdoptAnimalPostController {

	@Autowired
	private AdoptAnimalService aService;

	// 등록입니다

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
	public ModelAndView animalRegister(HttpServletRequest request
//			, @ModelAttribute Animal animal
//			, @ModelAttribute AdoptPost adoptPost

//			, String loginUserId
			, @RequestParam("adoptWriterId") String adoptWriterId

			, String animalSpecies, String animalGender

//			, String animalWeight
			, @RequestParam("animalWeight") String animalWeight

			, String animalAge, String neuterYN, String animalAddr, String animalCharacter, String adoptContent,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, ModelAndView mv) {

		try {

			request.setCharacterEncoding("UTF-8");

			System.out.println(adoptWriterId);
			System.out.println(animalWeight);

			// 수정할 부분!
			Animal animal = new Animal();
			animal.setAnimalSpecies(animalSpecies);
			animal.setAnimalGender(animalGender);
			animal.setAnimalWeight(Integer.parseInt(animalWeight));
			animal.setAnimalAge(Integer.parseInt(animalAge));
			animal.setNeuterYN(neuterYN);
			animal.setAnimalAddr(animalAddr);
			animal.setAnimalCharacter(animalCharacter);
			animal.setAnimalFosterId(adoptWriterId);

			AdoptPost adoptPost = new AdoptPost();
			adoptPost.setAdoptWriterId(adoptWriterId);
			adoptPost.setAdoptContent(adoptContent);

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
				// 성공, 리스트로 이동
				mv.setViewName("adoptAnimalPost/list");
			} else {
				// 실패, 실패 페이지로 이동
				// 말고 그냥 실패 팝업 후 리스트로 이동하고 싶음!
				// mv.setViewName("adoptAnimalPost/list");
				// 일단은 실패
				mv.addObject("message", "입양 공고 등록 실패").setViewName("common/error");
			}

		} catch (Exception e) {

			// 콘솔창에 에러 띄우기 위함
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

			String savePath = root + "\\uploadFiles";

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

	// 출력입니다

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
			AdoptAnimalPost aPost = aService.selectOneByAnimalNo(animalNo);
			if (aPost != null) {
				mv.addObject("aPost", aPost).setViewName("adoptAnimalPost/detail");
			} else {
				mv.addObject("message", "동물 디테일 조회 실패").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}

		return mv;
	}

}
