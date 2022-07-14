package com.probee.waggle.model.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.HomeDto;
import com.probee.waggle.model.dto.RequestDto;
import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.service.BoardService;
import com.probee.waggle.model.service.HomeService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private HomeService homeService;
	
	@GetMapping("/list")
	public String selectList(Model model, int ... page) {
		List<RequestDto2> list = boardService.selectList();
		
		int All_pages = (int)Math.ceil(list.size()/5.0);
		int Last_pages = list.size()-5*(All_pages-1);
		
		int start=0;
		int end=0;
		
		try {
			model.addAttribute("page", page);
			
			if(page[0] == All_pages) {
				start = list.size()-Last_pages;
				end = list.size()-1;
			} else {
				start = 5*(page[0]-1);
				end = 5*(page[0])-1;
			}
			
		} catch(Exception e) {
			model.addAttribute("page", 1);
			start = 0;
			if(All_pages <= 1) {
				end = list.size()-1;
			} else {
				end = 4;
			}
		}
		model.addAttribute("start",start/5+1);
		model.addAttribute("end",end/5+1);
		model.addAttribute("All_pages",All_pages);
		model.addAttribute("list", list.subList(start, end));
		return "board";
	}
	
	@GetMapping("/requestform")
	public String goRequestForm(Model model, HttpSession session) {
		model.addAttribute("user_Code",session.getAttribute("user_Code"));
		return "requestForm";
	}
	
	@PostMapping("/request")
	public String updateRequest(RequestDto2 req_dto, HomeDto home_dto) {
		
		System.out.println(req_dto);
		System.out.println(home_dto);
		
		HomeDto find_home = homeService.findHome(home_dto);
		
		if(find_home == null) {
			homeService.insertHome(home_dto);
			find_home = homeService.findHome(home_dto);
		}
		
		req_dto.setReq_HCode(find_home.getHome_Code()); 
		int res = boardService.insertRequest(req_dto);
		
		if(res>0) {
			return "redirect:/board/list";
		} else {
			return "redirect:/board/request";
		}
	}
	
	
}
