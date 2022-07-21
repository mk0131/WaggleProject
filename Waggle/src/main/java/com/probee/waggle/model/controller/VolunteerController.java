package com.probee.waggle.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vol")
public class VolunteerController {
	
	public String Vol(int user_Code) {
		
		
		return "redirect:/board/list";
	}

}
