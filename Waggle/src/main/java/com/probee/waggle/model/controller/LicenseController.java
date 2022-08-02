package com.probee.waggle.model.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.ConfirmDto2;
import com.probee.waggle.model.service.LicenseService;

@Controller
@RequestMapping("/license")
public class LicenseController {
	
	@Autowired
	LicenseService licenseService;
	
	@GetMapping("/list")
	public String goList(Model model) {
		List<ConfirmDto2> list = licenseService.selectAll();
		Collections.reverse(list);
		model.addAttribute("list", list); 
		return "licenseList";
	}
	
	@PostMapping("/permit")
	public String permit(String list) {
		String[] my_arr = list.split(",");
		for(String val: my_arr) {
			licenseService.permitConfirm(Integer.parseInt(val));
		}
		return "redirect:/license/list";
	}
	
	@PostMapping("/reject")
	public String reject(String list) {
		String[] my_arr = list.split(",");
		for(String val: my_arr) {
			licenseService.rejectConfirm(Integer.parseInt(val));
		}
		return "redirect:/license/list";
	}
	
	@PostMapping("/process")
	public String process(String list, HttpServletRequest request) {
		// 이미지 OCR 처리후 CSV 파일 생성 & 확인중으로 상태 변환
		licenseService.process(list, request);
		return "redirect:/license/list";
	}

}
