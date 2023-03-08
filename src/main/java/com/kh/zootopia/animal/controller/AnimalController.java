package com.kh.zootopia.animal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.zootopia.animal.service.AnimalService;

@Controller
public class AnimalController {

	@Autowired
	public AnimalService aService;
	
	// 입양 공고 등록 화면
	@RequestMapping(value="/animal/regist", method=RequestMethod.GET)
	public String registerView() {
		return "animal/register";
	}
	
	// 입양 공고 등록
	public void adoptRegister() {
		
	}
}
