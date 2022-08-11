package com.probee.waggle.model.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.InquiryDto;
import com.probee.waggle.model.dto.NoticeDto;
import com.probee.waggle.model.dto.Paging;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.service.InquiryService;
import com.probee.waggle.model.service.NoticeService;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/list")
	public String selectList(Model model, int user_Code, String user_Nm, Criteria cri) {
		
		int inquiryListCnt1 = inquiryService.inquiryListCnt(user_Code);
		int inquiryListCnt2 = inquiryService.inquiryallListCnt(user_Nm);
		
		// 페이징 객체
		Paging paging1 = new Paging();
		paging1.setCri(cri);
		paging1.setTotalCount(inquiryListCnt1);
		
		// 페이징 객체
		Paging paging2 = new Paging();
		
		paging2.setCri(cri);
		paging2.setTotalCount(inquiryListCnt2);
				
		
		List<InquiryDto> list = inquiryService.selectList(user_Code, cri);
		List<InquiryDto> alist = inquiryService.adminList(user_Nm, cri);
		
		List<NoticeDto> list2 =  noticeService.list();
		
		model.addAttribute("list2",list2);
		
		model.addAttribute("list", list);
		model.addAttribute("alist", alist);
		model.addAttribute("paging1", paging1);
		model.addAttribute("paging2", paging2);
		
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
		

		InquiryDto inqdto = inquiryService.selectOne(in_Code);
		model.addAttribute("dto", inqdto);
		
		UsersDto user_dto = inquiryService.selectuser(inqdto.getIn_UCode());
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
			inquiryService.updateOriginNo(dto);
			return "redirect:/inquiry/list?user_Code="+dto.getIn_UCode();
		} else {
			return "redirect:/inquiry/insert";
		}
		
	}
	
	@GetMapping("/admininsertform")
	public String admininsertform(HttpServletRequest request, Model model) {	
		
		int in_Code = Integer.parseInt(request.getParameter("in_Code"));
		
		InquiryDto inqdto = inquiryService.selectOne(in_Code);
		model.addAttribute("dto", inqdto);
		
		System.out.println(inqdto);
		
		UsersDto user_dto = inquiryService.selectuser(inqdto.getIn_UCode());
		model.addAttribute("user_dto", user_dto);
		
		request.setAttribute("originNo", Integer.parseInt(request.getParameter("in_Code")));
		
		System.out.println(user_dto);
		
		return "inquiryadmininsert";
	}
	
	@RequestMapping("/admininsert")
	public String admininsert(InquiryDto dto, int user_Code, Model model, HttpServletRequest request) {
		
		UsersDto user_dto = inquiryService.selectuser(user_Code);
		
		dto.setIn_UCode(user_Code);
		
		System.out.println(user_dto);
		System.out.println(dto);
		
		if(inquiryService.admininsert(dto) > 0 ) {
			inquiryService.inquiryListStat();
			return "redirect:/inquiry/list?user_Code=" + dto.getIn_UCode();
		} else {
			return "redirect:/inquiry/admininsert";
		}
		
		
	}
	
	
	@GetMapping("/updateform")
	public String updateform(int in_Code, Model model) {	
		
		InquiryDto inqdto = inquiryService.selectOne(in_Code);
		model.addAttribute("dto", inqdto);
		
		UsersDto user_dto = inquiryService.selectuser(inqdto.getIn_UCode());
		model.addAttribute("user_dto", user_dto);
		
		System.out.println(inqdto);
		System.out.println(user_dto);
		
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