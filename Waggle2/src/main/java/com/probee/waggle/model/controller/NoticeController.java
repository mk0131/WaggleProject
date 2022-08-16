package com.probee.waggle.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.service.NoticeService;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/insertform")
	public String Insertform() {
		
		return "notice";
	}
	
	@PostMapping("/insert")
	public String Insert(String no_Type, String no_Title, String no_Content, int user_Code) {
		
		noticeService.insert(no_Type, no_Title, no_Content);
		
		return "redirect:/inquiry/list?user_Code=" +user_Code;
	}
	
	

}
