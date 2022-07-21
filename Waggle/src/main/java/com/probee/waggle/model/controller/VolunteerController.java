package com.probee.waggle.model.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.service.VolunteerService;

@Controller
@RequestMapping("/vol")
public class VolunteerController {
	
	@Autowired
	VolunteerService volunteerService;
	
	@GetMapping("/submit")
	public String Vol(int vo_UCode, int vo_No) {
		
		int res = volunteerService.Submit(vo_UCode, vo_No);
		
		if(res>0) {
			return "redirect:/board/detail?req_No=" +vo_No;
		}
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/cancel")
	public String Cancel(int vo_UCode, int vo_No , HttpSession session) {
		
		int res = volunteerService.Cancel(vo_No,vo_UCode);
		
		if(res>0) {
			session.setAttribute("vo_UCode", -1);
			return "redirect:/board/detail?req_No=" +vo_No;
		}
		return "redirect:/board/detail?req_No=" +vo_No;
	}

}
