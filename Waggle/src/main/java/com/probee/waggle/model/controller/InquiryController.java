package com.probee.waggle.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.InquiryDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.service.InquiryService;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	
	@GetMapping("/list")
	public String selectList(Model model, int user_Code) {
		List<InquiryDto> list = inquiryService.selectList(user_Code);
		model.addAttribute("list", list);
		System.out.println(list);
		return "inquirylist";
	}
	
	@GetMapping("/userlist")
	public String selectuserList(Model model, int user_Code) {
		UsersDto userlist = inquiryService.selectuser(user_Code);
		model.addAttribute("userlist", userlist);
		return "inquiryuserlist";
	}
		
	@GetMapping("/detail") 
	public String selectOne(Model model, int in_Code) {
		model.addAttribute("dto", inquiryService.selectOne(in_Code));
		
		UsersDto user_dto = inquiryService.selectuser(in_Code);
		model.addAttribute("user_dto", user_dto);
		return "inquirydetail";
	}
	
	@GetMapping("/insertform")
	public String insertform() {	
		return "inquiryinsert";
	}
	
	@PostMapping("/insert")
	public String insert(InquiryDto dto, int in_UCode) {
		System.out.println(dto);
		if(inquiryService.insert(dto) > 0) {
			return "redirect:/inquiry/list?user_Code="+dto.getIn_UCode();
		} else {
			return "redirect:/inquiry/insert";
		}
		
	}
	
	@GetMapping("/updateform")
	public String updateform(int in_Code, Model model) {	
		model.addAttribute("dto", inquiryService.selectOne(in_Code));
		
		return "inquiryupdate";
	}
	
	@PostMapping("/update")
	public String update(InquiryDto dto) {
		if(inquiryService.update(dto) > 0) {
			return "redirect:/inquiry/detail?in_Code=" + dto.getIn_Code();
		} else {
			return "redirect:/inquiry/update?in_Code=" + dto.getIn_Code();
		}
		
	}
	
	@GetMapping("/delete")
	public String delete(int in_Code, InquiryDto dto, int user_Code) {
		if(inquiryService.delete(in_Code) > 0) {
			return "redirect:/inquiry/list?user_Code="+user_Code;
		} else {
			return "redirect:/inquiry/detail?in_Code=" + dto.getIn_Code();
		}
		
		
	}
	
}