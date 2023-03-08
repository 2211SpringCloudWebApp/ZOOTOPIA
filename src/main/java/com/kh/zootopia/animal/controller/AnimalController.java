package com.kh.zootopia.animal.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zootopia.animal.domain.Adopt;
import com.kh.zootopia.animal.domain.Animal;
import com.kh.zootopia.animal.service.AnimalService;

@Controller
public class AnimalController {

	@Autowired
	private AnimalService aService;
	
	// 입양 공고 등록 화면
	@RequestMapping(value="/animal/registerView.ztp", method=RequestMethod.GET)
	public String adoptRegisterView() {
		try {
			
			return "animal/register";
		} catch (Exception e) {
			
			return "";
		}
	}
	
	// 입양 공고 등록
	@RequestMapping(value="/animal/register.ztp", method=RequestMethod.POST)
	public String animalRegister(
			@ModelAttribute Adopt adopt, @ModelAttribute Animal animal
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request
			, Model model) {
		try {
			// 파일이 있을 경우
			if(!uploadFile.getOriginalFilename().equals("")) {
				// 파일 복사(지정한 경로 업로드)
				String filePath = saveFile(uploadFile, request);
				if(filePath != null) {
					adopt.setAdoptImageName(uploadFile.getOriginalFilename());
					adopt.setAdoptImagePath(filePath);
					adopt.setAdoptVideoName(uploadFile.getOriginalFilename());
					adopt.setAdoptVideoPath(filePath);
				}
			}
			int result = aService.insertAnimal(adopt, animal);
			if(result > 0) {
				return "redirect:/animal/list.ztp";
			}else {
				model.addAttribute("msg", "");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 입양 공고 삭제
	@RequestMapping(value="/animal/remove.ztp", method=RequestMethod.GET)
	public String adoptRemove(@RequestParam("animalNo") int animalNo, Model model) {
		try {
			int result = aService.deleteAnimal(animalNo);
			if(result > 0) {
				return "redirect:/animal/list.ztp";
			}else {
				model.addAttribute("msg", "");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 지정 경로로 파일 복사(파일 업로드)
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		// 내가 원하는 경로 : 프로젝트 경로
		try {
			// "resources" -> 임시경로입니다
			String root = request.getSession().getServletContext().getRealPath("resources");
			// "\\nuploadFiles" -> 임시경로입니다
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
	
	// 파일 삭제
	private void deleteFile(String filename, HttpServletRequest request) throws Exception {
		// "resources" -> 임시경로입니다
		String root = request.getSession().getServletContext().getRealPath("resources");
		// "\\nuploadFiles" -> 임시경로입니다
		String delPath = root + "\\nuploadFiles";
		String delFilepath = delPath + "\\" + filename;
		File delFile = new File(delFilepath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
}
