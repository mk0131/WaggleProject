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

import com.google.gson.Gson;
import com.probee.waggle.model.dto.HomeDto;
import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.dto.ResultDto;
import com.probee.waggle.model.dto.UserRatingDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.dto.VolunteerDto;
import com.probee.waggle.model.service.BoardService;
import com.probee.waggle.model.service.HomeService;
import com.probee.waggle.model.service.VolunteerService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private HomeService homeService;
	
	@Autowired
	VolunteerService volunteerService;
	
	@GetMapping("/list")
	public String selectList(Model model, int ...num) {
		List<RequestDto2> list = boardService.selectList();
		List<String> res_list = new ArrayList<String>();
		Gson gson = new Gson();
		
		int current_page;
		
		try {
			current_page = num[0];
		} catch (Exception e) {
			current_page = 1;
		}
		
		for(int i=0; i<list.size(); i++) {
			String tmp = gson.toJson(list.get(i));
			res_list.add(tmp);
		}
		
		model.addAttribute("List",res_list);
		model.addAttribute("Current_page",current_page);
		
		return "board";
	}
	
	@GetMapping("/requestform")
	public String goRequestForm(Model model, HttpSession session) {
		int id = 0;
		try {
			id = (int)session.getAttribute("user_Code");
			model.addAttribute("user_Code",id);
			return "requestForm";
		} catch (Exception e) {
			return "redirect:/board/list";
		}

	}
	
	@PostMapping("/request")
	public String createRequest(RequestDto2 req_dto, HomeDto home_dto) {
		
		HomeDto find_home = homeService.findHome(home_dto);
		
		if(find_home == null) {
			homeService.insertHome(home_dto);
			find_home = homeService.findHome(home_dto);
		}
		
		req_dto.setReq_HCode(find_home.getHome_Code()); 
		int res = boardService.insertRequest(req_dto);
		
		if(res == 0) {
			System.out.println("not saved...");
			return "redirect:/board/requestform";
		}
		
		System.out.println("success saved!");
		
		// 직방 url에서 사진 crawling 
		String img_url = boardService.crawlImgUrl(req_dto.getReq_Link());
		
		// DB 저장, req_FCode return
		if(img_url != null) {
			System.out.println("img_url 발견!");

			int req_num = boardService.selectLastRequestNo();
			
			String path = "/images/request/home"+find_home.getHome_Code()+"_"+req_num+".jpg";
			
			int res_savecode = boardService.saveImg(img_url, path);
			
			if(res_savecode != 0) {
				// update req
				int res2 = boardService.updateFCode(req_num,res_savecode);
				if(res2>0) {
					System.out.println("success update!");
				} else {
					System.out.println("fail update...");
				}
			}
		}
		return "redirect:/board/list";
		
	}
	
	@GetMapping("/updateform")
	public String goUpdateForm(Model model, int req_No) {
		model.addAttribute("req_dto", boardService.selectRequest(req_No));
		return "updateForm";
	}
	
	@PostMapping("/update")
	public String updateRequest(RequestDto2 req_dto, HomeDto home_dto) {		
		HomeDto find_home = homeService.findHome(home_dto);
		
		if(find_home == null) {
			homeService.insertHome(home_dto);
			find_home = homeService.findHome(home_dto);
		}
		
		req_dto.setReq_HCode(find_home.getHome_Code()); 
		
		int res = boardService.updateRequest(req_dto);
		
		if(res == 0) {
			System.out.println("not saved...");
			return "redirect:/board/detail?req_No="+req_dto.getReq_No();
		}
		
		System.out.println("saved!");
		return "redirect:/board/detail?req_No="+req_dto.getReq_No();
	}
	
	
	@GetMapping("/detail")
	public String goDetailPage(Model model, HttpSession session, HttpServletResponse response, int req_No) {

		int user_Code = 0;
		Object storedValue = session.getAttribute("user_Code");
		if (storedValue instanceof Integer) {
			user_Code = (int) storedValue;
		}
		// 요청글 정보
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		model.addAttribute("req_dto", req_dto);
		// 사용자 정보
		UsersDto user_dto = boardService.selectUser(req_dto.getReq_UCode());
		model.addAttribute("user_dto", user_dto);
		
		int req_UCode = req_dto.getReq_UCode();
		String req_Stat = req_dto.getReq_Stat();

		if(req_Stat.equals("모집중")) {
			if(user_Code==req_UCode) {
				
				model.addAttribute("vol", boardService.FindVol(req_No));
				return "detail/detail_11";	
			} else {
				VolunteerDto vols = volunteerService.SelectOne(req_No, user_Code);
				
				if(vols != null) {
					session.setAttribute("vo_UCode", vols.getVo_UCode());
					session.setAttribute("vo_Block", vols.getVo_Block());
				} else {
					session.setAttribute("vo_UCode", -1);
					
				}
				
				return "detail/detail_12";
			}
			
		} else if(req_Stat.equals("취소") || req_Stat.equals("취소(0)")) {
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
			
			ResultDto result = boardService.selectResult(req_No);
			Gson gson = new Gson();
			
			model.addAttribute("res_dto", gson.toJson(result));
			model.addAttribute("res_dto2", result);
			System.out.println(result);
			
			if(req_Stat.equals("진행중")) {
				
				return "detail/detail_21";
			} 
			
			
			// result 관련 file
			model.addAttribute("file", boardService.selectResultFile(result.getRes_Code()));
			if(req_Stat.equals("확인중")) {
				if(who.equals("작성자")) {
					return "detail/detail_31";
				} else if(who.equals("수행자")) {
					return "detail/detail_32";
				} else {
					return "detail/detail_21";
				}
				
			} else { //완료
				// 글 번호에 맞는 유저평가 데이터 json으로 변환하여 넣기
				List<UserRatingDto> list = boardService.selectUserRating(req_No);
				List<String> rate_list = new ArrayList<String>();
				
				for(int i=0; i<list.size(); i++) {
					String tmp = gson.toJson(list.get(i));
					rate_list.add(tmp);
				}
				model.addAttribute("user_rating", rate_list);
				
				return "detail/detail_41";
			}			
		}
	}
	
	
	@GetMapping("/accept")  // 수락하기
	public String Accept(int req_UCode, int res_UCode, int req_No) {
		
		int res =  boardService.CreateRes(req_No, res_UCode);
		
		if(res >0 ) {
			boardService.Progress(req_No);
		}
		
		return "redirect:/board/detail?req_No=" +req_No;
	}
	

	@GetMapping("/cancel") // 모집중 일때 작성자가 취소하기
	public String Cancel(int req_No) {
		
		volunteerService.delete(req_No);
		boardService.Cancel(req_No);
		
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/revoke") // 모집중 일때 작성자가 취소하기
	public String Revoke(int req_No) {
		
		boardService.Revoke(req_No); // 요청글 취소(0)
		volunteerService.delete(req_No); // 지원자들 삭제
		volunteerService.Revoke(req_No); // 결과물 취소(0)
		
		return "redirect:/board/list";
	}
	

	
}
