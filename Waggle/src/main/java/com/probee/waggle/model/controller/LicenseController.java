package com.probee.waggle.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.service.LicenseService;

@Controller
@RequestMapping("/license")
public class LicenseController {
	
	@Autowired
	LicenseService licenseService;
	
	@GetMapping("/list")
	public String goList(Model model) {
		model.addAttribute("list", licenseService.selectAll()); 
		return "licenseList";
	}

}
