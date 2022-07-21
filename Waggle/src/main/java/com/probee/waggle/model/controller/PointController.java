package com.probee.waggle.model.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.PointsDto;
import com.probee.waggle.model.service.PointService;

@Controller
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	PointService pointService;
	
	@GetMapping("/use")
	public String PointUse(Model model, HttpSession session){
		int ucode = (int)session.getAttribute("user_Code");
		model.addAttribute("use", pointService.selectPointUse(ucode));
		return "point";
	}
	

}
