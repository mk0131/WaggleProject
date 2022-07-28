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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.HomeDto;
import com.probee.waggle.model.dto.Paging;
import com.probee.waggle.model.dto.PointsDto;
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
	public String selectList(Model model, Criteria cri) {
		
		int boardListCnt = boardService.boardListCnt();
		
		// 페이징 객체
		Paging paging = new Paging();
		
		cri.setPerPageNum(4);
		
		paging.setCri(cri);
		paging.setTotalCount(boardListCnt);
		
		
		List<RequestDto2> list = boardService.selectList(cri);
//		List<String> res_list = new ArrayList<String>();
		
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
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
	public String createRequest(RequestDto2 req_dto, HomeDto home_dto, String home_Addr, String ji_Addr, String road_Addr, String home_DAddr) {
		
		HomeDto find_home = homeService.findHome(home_Addr, ji_Addr, road_Addr, home_DAddr);
		
		if(find_home == null) {
			homeService.insertHome(home_dto);
			find_home = homeService.findHome(home_Addr, ji_Addr, road_Addr, home_DAddr);
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
	public String updateRequest(RequestDto2 req_dto, HomeDto home_dto, String home_Addr, String ji_Addr, String road_Addr, String home_DAddr) {		
		HomeDto find_home = homeService.findHome(home_Addr, ji_Addr, road_Addr, home_DAddr);
		
		if(find_home == null) {
			homeService.insertHome(home_dto);
			find_home = homeService.findHome(home_Addr, ji_Addr, road_Addr, home_DAddr);
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
				ResultDto result2 = boardService.selectResult(req_No);
				List<UserRatingDto> list = boardService.selectUserRating(result2.getRes_Code());
				List<String> rate_list = new ArrayList<String>();

				for(int i=0; i<list.size(); i++) {
					String tmp = gson.toJson(list.get(i));
					rate_list.add(tmp);
				}
				
				PointsDto po = boardService.selectPoint(req_No, user_Code);
				if(po != null) {
					model.addAttribute("po",po.getPo_UCode());	
				}else {
					model.addAttribute("po",-1);
				}

				model.addAttribute("user_rating", rate_list);
				model.addAttribute("res", result2.getRes_UCode());
				
				
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
		
		volunteerService.delete(req_No); // 지원자목록 삭제
		boardService.Cancel(req_No); // 요청글 삭제
		
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/revoke") // 진행중 일때 작성자가 취소하기
	public String Revoke(int req_No) {
		
		boardService.Revoke(req_No); // 요청글 취소
		volunteerService.delete(req_No); // 지원자들 삭제
		volunteerService.Revoke(req_No); // 모든 결과물 취소(0)
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/rating") // 확인중 페이지에서 작성자가 수행자 평가했을시 업데이트 진행
	public String ratingBee(int req_No, UserRatingDto userRating_dto) {
		ResultDto res_dto = boardService.selectResult(req_No);
		userRating_dto.setUr_Code(res_dto.getRes_Code());
		
		// 1, 0, -1 -> '좋아요', '보통이에요', '별로에요' 값변환
		List<String> indexArray = new ArrayList<String>();
		indexArray.add("별로에요");
		indexArray.add("보통이에요");
		indexArray.add("좋아요");
		int tmp1 = Integer.parseInt(userRating_dto.getUr_Attr1());
		userRating_dto.setUr_Attr1(indexArray.get(tmp1+1));
		
		int tmp2 = Integer.parseInt(userRating_dto.getUr_Attr2());
		userRating_dto.setUr_Attr2(indexArray.get(tmp2+1));
		
		int tmp3 = Integer.parseInt(userRating_dto.getUr_Attr3());
		userRating_dto.setUr_Attr3(indexArray.get(tmp3+1));

		int res = boardService.insertRatingBee(userRating_dto);
		
		if(res>0) {
			System.out.println("꿀벌 평가 DB 저장 성공");
		} else {
			System.out.println("꿀벌 평가 DB 저장 실패...");
			return "redirect:/board/detail?req_No="+req_No;
		}
		// 확인중 -> 완료로 업데이트
		boardService.complete(req_No);
		
		return "redirect:/board/detail?req_No="+req_No;
	}
	
	@PostMapping("/reRatingForm") // 완료 게시글에서 작성자가 꿀벌을 다시한번 평가하는 폼으로 이동시켜줌
	public String goReRatingForm(int req_No, Model model) {
		// 요청 결과값
		ResultDto res_dto = boardService.selectResult(req_No);
		List<UserRatingDto> tmplist = boardService.selectUserRating(res_dto.getRes_Code());
		UserRatingDto userRating_dto = tmplist.get(0);
		
		System.out.println(userRating_dto);
		// 요청글 정보
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		model.addAttribute("req_dto", req_dto);
		
		Gson gson = new Gson();
		
		model.addAttribute("res_dto", gson.toJson(res_dto));
		model.addAttribute("user_rating", gson.toJson(userRating_dto));
		return "reRatingForm";
	}
	
	@PostMapping("/rerating")
	public String reratingBee(int req_No, UserRatingDto userRating_dto) {
		ResultDto res_dto = boardService.selectResult(req_No);
		userRating_dto.setUr_Code(res_dto.getRes_Code());
		
		// 1, 0, -1 -> '좋아요', '보통이에요', '별로에요' 값변환
		List<String> indexArray = new ArrayList<String>();
		indexArray.add("별로에요");
		indexArray.add("보통이에요");
		indexArray.add("좋아요");
		int tmp1 = Integer.parseInt(userRating_dto.getUr_Attr1());
		userRating_dto.setUr_Attr1(indexArray.get(tmp1+1));
		
		int tmp2 = Integer.parseInt(userRating_dto.getUr_Attr2());
		userRating_dto.setUr_Attr2(indexArray.get(tmp2+1));
		
		int tmp3 = Integer.parseInt(userRating_dto.getUr_Attr3());
		userRating_dto.setUr_Attr3(indexArray.get(tmp3+1));

		boardService.insertReRatingBee(userRating_dto);
		
		return "redirect:/board/detail?req_No="+req_No;
	}
	
	@GetMapping("/completeform")
	public String goCompleteForm(String userName, int req_No, Model model) {
		// 요청글 정보
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		model.addAttribute("req_dto", req_dto);
		model.addAttribute("userName", userName);
		
		return "detail/completeform";
	}
	
	@PostMapping("/complete")
	public String complete(int req_No, ResultDto res_dto, MultipartHttpServletRequest request) {
		// 글번호로 result dto 가져오기
		ResultDto dto = boardService.selectResult(req_No);
		
		// result dto 내용 업데이트
		res_dto.setRes_Code(dto.getRes_Code());
		boardService.updateResult(res_dto);
		
		// 파일 서버에 업로드 및 DB 업데이트(File, ResultFile) 
		List<MultipartFile> files = request.getFiles("myfile");
		int dto_code = dto.getRes_Code();
		boardService.saveLocal(req_No, files, dto_code, request);

		// 최종 업데이트 후 글 상태 확인중으로 변경
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		if(req_dto.getReq_Stat().equals("진행중")) {
			boardService.confirm(req_No);			
		}
		
		return "redirect:/board/detail?req_No="+req_No;
	}
	
	@PostMapping("/reCompleteForm")
	public String goReCompleteForm(String userName, int req_No, Model model) {
		// 요청글 정보
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		model.addAttribute("req_dto", req_dto);
		model.addAttribute("userName", userName);
		
		ResultDto result = boardService.selectResult(req_No);
		List<FileDto> fi_list = boardService.selectResultFile(result.getRes_Code());

		Gson gson = new Gson();
		
		model.addAttribute("res_dto", gson.toJson(result));
		model.addAttribute("fi_list", fi_list);
		
		return "detail/recompleteform";
	}
	

	
}
