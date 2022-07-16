package com.probee.waggle.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
import com.probee.waggle.model.dto.ResultDto;
import com.probee.waggle.model.dto.VolunteerDto;
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
		model.addAttribute("list", list);
//		model.addAttribute("list", list.subList(start, end));
		return "board";
	}
	
	@GetMapping("/requestform")
	public String goRequestForm(Model model, HttpSession session) {
		model.addAttribute("user_Code",session.getAttribute("user_Code"));
		return "requestForm";
	}
	
	@PostMapping("/request")
	public String updateRequest(RequestDto2 req_dto, HomeDto home_dto) {
		
//		System.out.println(req_dto);
//		System.out.println(home_dto);
		
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
	
	@GetMapping("/detail")
	public String goDetailPage(Model model, HttpSession session, HttpServletResponse response, int req_No) {
		
		int user_Code = 0;
		Object storedValue = session.getAttribute("user_Code");
		if (storedValue instanceof Integer) {
			user_Code = (int) storedValue;
		}
		
		RequestDto req_dto = boardService.selectRequest(req_No);
		model.addAttribute("req_dto", req_dto);
		
		int req_UCode = req_dto.getReq_UCode();
		String req_Stat = req_dto.getReq_Stat();
		
		if(req_Stat.equals("모집중")) {
			if(user_Code==req_UCode) {
				List<VolunteerDto> vol_dto = boardService.selectVolunteer(req_No);
				List<String> code_list = new ArrayList<String>();
				
				for(VolunteerDto dto : vol_dto) {
					code_list.add(Integer.toString(dto.getVo_UCode()));
				}

				model.addAttribute("vol", boardService.selectUsers(code_list));
				return "detail/detail_11";	
			} else {
				return "detail/detail_12";
			}
			
		} else if(req_Stat.equals("취소")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;

			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('취소된 글입니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.flush();
				return null;
				
			} catch (IOException e) {
				e.printStackTrace();
				return "redirect:/board/list";
			}
			
		} else {
			// 모집중, 취소 상태가 아니라면 무조건 Result 생성되어있고 수행자도 null이 아님
			ResultDto res_dto = boardService.selectResult(req_dto.getReq_No());
			int bee_Code = res_dto.getRes_UCode();

			String who = null;
			if(user_Code==req_UCode) {
				who = "작성자";
			} else if(user_Code==bee_Code) {
				who = "수행자";
			} else {
				who = "제3자";
			}
			model.addAttribute("who", who);
			
			if(req_Stat.equals("진행중")) {
				return "detail/detail_21";

			} else if(req_Stat.equals("확인중")) {
				if(who.equals("작성자")) {
					return "detail/detail_31";
				} else if(who.equals("수행자")) {
					return "detail/detail_32";
				} else {
					return "detail/detail_21";
				}
				
			} else { //완료
				return "detail/detail_41";
			}			
		}

	}
	
	
}
