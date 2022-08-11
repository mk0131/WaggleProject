package com.probee.waggle.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UserRatingDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.dto.VolunteerDto;
import com.probee.waggle.model.service.BoardService;
import com.probee.waggle.model.service.HomeService;
import com.probee.waggle.model.service.MypageService;
import com.probee.waggle.model.service.PointService;
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
	
	@Autowired
	private PointService pointService;
	
	@Autowired
	private MypageService mypageService;
	
	@GetMapping("/list")
	public String selectList(Model model, Criteria cri, HttpSession session) {
		
		int boardListCnt = boardService.boardListCnt();
		// 페이징 객체
		Paging paging = new Paging();
		
		cri.setPerPageNum(4);
		
		paging.setCri(cri);
		paging.setTotalCount(boardListCnt);
		
		List<RequestDto2> list = boardService.selectList(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		// 사용자 위치 
		int user_code = 0;
		try {
			user_code = (int)session.getAttribute("user_Code");			
		} catch (Exception e) {
			return "redirect:/login";
		}
		if(user_code > 0) {
			// 유저 코드로 좌표 가져오기
			UserAddressDto add_dto = boardService.selectUserAddr(user_code);

			if(add_dto != null) {
				model.addAttribute("user_add",add_dto);
				model.addAttribute("checking",1);
				
			} else {
				UserAddressDto add_dto1 = new UserAddressDto();
				add_dto1.setUa_Lat(0.0);
				add_dto1.setUa_Lng(0.0);
				model.addAttribute("user_add",add_dto1);
				model.addAttribute("checking",0);
			}
		}
		
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
		
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		model.addAttribute("req_dto", req_dto);
		return "updateForm";
	}
	
	@PostMapping("/update")
	public String updateRequest(RequestDto2 req_dto, String req_WDate2, HomeDto home_dto, String home_Addr, String ji_Addr, String road_Addr, String home_DAddr) {		
		HomeDto find_home = homeService.findHome(home_Addr, ji_Addr, road_Addr, home_DAddr);
		
		if(find_home == null) {
			homeService.insertHome(home_dto);
			find_home = homeService.findHome(home_Addr, ji_Addr, road_Addr, home_DAddr);
		}
		
		req_dto.setReq_HCode(find_home.getHome_Code()); 
		
		// LocatDateTime 형식으로 인한 error 해결
		req_WDate2 = req_WDate2.replace('T', ' ');
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime ldt = LocalDateTime.parse(req_WDate2, formatter);
		req_dto.setReq_WDate(ldt);
		
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
		
		// 유저 코드로 좌표 가져오기
		UserAddressDto add_dto = boardService.selectUserAddr(user_Code);

		if(add_dto != null) {
			model.addAttribute("user_add",add_dto);
			model.addAttribute("checking",1);
			
		} else {
			UserAddressDto add_dto1 = new UserAddressDto();
			add_dto1.setUa_Lat(0.0);
			add_dto1.setUa_Lng(0.0);
			model.addAttribute("user_add",add_dto1);
			model.addAttribute("checking",0);
		}
		
		// 요청글 정보
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		model.addAttribute("req_dto", req_dto);
		// 사용자 정보
		UsersDto user_dto = boardService.selectUser(req_dto.getReq_UCode());
		model.addAttribute("user_dto", user_dto);
		
		// 요청글 작성자 정보
		int OtherUserPro = user_dto.getUser_Pro();
		if(OtherUserPro !=0) {
			FileDto ProfileFile = mypageService.SelectConfirmFile(OtherUserPro);
			model.addAttribute("Pro_fi_Nm", ProfileFile.getFi_Nm());
		}
		
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
			
			//수행자 정보
			int WorkUserCode = result.getRes_UCode();
			UsersDto WorkUserDto = boardService.selectUser(WorkUserCode); 
			int WorkUserPro = WorkUserDto.getUser_Pro();
			if(WorkUserPro !=0) {
				FileDto ProfileFile = mypageService.SelectConfirmFile(WorkUserPro);
				model.addAttribute("bee_img", ProfileFile.getFi_Nm());
			}
			model.addAttribute("bee_dto", WorkUserDto);
			//수행자 정보 끝
			
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
				List<PointsDto> po_list = boardService.selectPoint(req_No, user_Code);
				PointsDto po = null;
				try { 
					po = po_list.get(0);
				} catch (Exception e) {
					
				}
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
	
	
	@GetMapping("/accept")  // 수락하기 요청자 코드, 수행자 코드, 글번호
	public String Accept(int req_UCode, int res_UCode, int req_No, HttpSession session, HttpServletResponse response) {
		
		
		// 포인트 부족하면 충전페이지로 이동
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		int user_Code = (int)session.getAttribute("user_Code");
		int point = boardService.selectUser(user_Code).getUser_Point();
		int po_Point = req_dto.getReq_Point();
		
		if(point - po_Point < 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			String redirect = "/point/use";
			String redirect2 = "/board/detail?req_No="+req_No;
			
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("if(confirm('포인트가 부족합니다.')){"
						+ "window.location.href='"+redirect+"';"
						+ "} else {"
						+ "window.location.href='"+redirect2+"';"
						+ "}");
				out.println("</script>");
				out.flush();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
				return "redirect:/point/use";
			}
		}
		
		int res =  boardService.CreateRes(req_No, res_UCode); // 결과글 생성
		
		if(res > 0) {
			boardService.Progress(req_No); // 진행중 으로 변경
		}
		// 요청자 포인트 소모
		int po_No = req_dto.getReq_No();
		// Points DB 업데이트
		pointService.insertPoints(po_Point, req_UCode, po_No);
		// Users DB 업데이트
		pointService.updateUserPoint(point - po_Point, req_UCode);
		
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
		
		// 포인트 되돌려 받음
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		int req_Point = req_dto.getReq_Point();
		int req_UCode = req_dto.getReq_UCode();
		pointService.insertPay(req_Point, req_UCode, "획득");
		// user 정보 point update
		int user_point = pointService.selectUserPoint(req_UCode);
		pointService.updateUserPoint(user_point + req_Point, req_UCode);
		
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
		// 수행자 Users DB에서 user_Grade 업데이트
		int res_UCode = res_dto.getRes_UCode();								// 수행자 코드
		int grade = boardService.selectUser(res_UCode).getUser_Grade();		// 수행자 현재 등급
		boardService.updateUserGrade(res_UCode, grade+tmp1+tmp2+tmp3);
		
		// 확인중 -> 완료로 업데이트
		boardService.complete(req_No);
		
		// Result 시간 업데이트 및 상태 완료로 업데이트
		boardService.updateResultWDate(res_dto.getRes_Code());
		
		// 꿀벌 포인트 업데이트
		
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		
		
		pointService.insertPay(req_dto.getReq_Point(), res_UCode, "획득");
		
		int user_point = pointService.selectUserPoint(res_UCode);
		
		pointService.updateUserPoint(user_point + req_dto.getReq_Point(), res_dto.getRes_UCode());
		
		
		return "redirect:/board/detail?req_No="+req_No;
	}
	
	@PostMapping("/reRatingForm") // 완료 게시글에서 작성자가 꿀벌을 다시한번 평가하는 폼으로 이동시켜줌
	public String goReRatingForm(int req_No, Model model) {
		// 요청 결과값
		ResultDto res_dto = boardService.selectResult(req_No);
		List<UserRatingDto> tmplist = boardService.selectUserRating(res_dto.getRes_Code());
		UserRatingDto userRating_dto = tmplist.get(0);
		
		// 요청글 정보
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		model.addAttribute("req_dto", req_dto);
		
				
		// 요청글 사용자 정보
		UsersDto user_dto = boardService.selectUser(req_dto.getReq_UCode());
		model.addAttribute("user_dto", user_dto);
		
		// 요청글 작성자 정보
		int OtherUserPro = user_dto.getUser_Pro();
		if(OtherUserPro !=0) {
			FileDto ProfileFile = mypageService.SelectConfirmFile(OtherUserPro);
			model.addAttribute("Pro_fi_Nm", ProfileFile.getFi_Nm());
		}
		
		//수행자 정보
		ResultDto result = boardService.selectResult(req_No);
		int WorkUserCode = result.getRes_UCode();
		UsersDto WorkUserDto = boardService.selectUser(WorkUserCode); 
		int WorkUserPro = WorkUserDto.getUser_Pro();
		if(WorkUserPro !=0) {
			FileDto ProfileFile = mypageService.SelectConfirmFile(WorkUserPro);
			model.addAttribute("bee_img", ProfileFile.getFi_Nm());
		}
		model.addAttribute("bee_dto", WorkUserDto);
		//수행자 정보 끝
		
		List<FileDto> fi_list = boardService.selectResultFile(res_dto.getRes_Code());
		
		Gson gson = new Gson();
		
		model.addAttribute("res_dto", gson.toJson(res_dto));
		model.addAttribute("user_rating", gson.toJson(userRating_dto));
		model.addAttribute("fi_list", fi_list);
		
		// 이전 평가 점수 보내주기
		List<String> tmplist2 = new ArrayList<String>();
		tmplist2.add(userRating_dto.getUr_Attr1());
		tmplist2.add(userRating_dto.getUr_Attr2());
		tmplist2.add(userRating_dto.getUr_Attr3());
		int sum_val = 0;
		for(String val: tmplist2) {
			if(val.equals("좋아요")) {
				sum_val += 1;
			} else if(val.equals("별로에요")) {
				sum_val -= 1;
			}
		}
		
		model.addAttribute("sum_val", sum_val);
		
		return "reRatingForm";
	}
	
	@PostMapping("/rerating")
	public String reratingBee(int req_No, UserRatingDto userRating_dto, int sum_val) {
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
		
		// 수행자 Users DB에서 user_Grade 업데이트
		int res_UCode = res_dto.getRes_UCode();								// 수행자 코드
		int grade = boardService.selectUser(res_UCode).getUser_Grade();		// 수행자 현재 등급
		boardService.updateUserGrade(res_UCode, grade-sum_val+tmp1+tmp2+tmp3);

		boardService.insertReRatingBee(userRating_dto);
		
		return "redirect:/board/detail?req_No="+req_No;
	}
	
	@GetMapping("/completeform")
	public String goCompleteForm(String userName, int req_No, Model model) {
		// 요청글 정보
		RequestDto2 req_dto = boardService.selectRequest(req_No);
		model.addAttribute("req_dto", req_dto);
		
		// 요청글 사용자 정보
		UsersDto user_dto = boardService.selectUser(req_dto.getReq_UCode());
		model.addAttribute("user_dto", user_dto);
		
		// 요청글 작성자 정보
		int OtherUserPro = user_dto.getUser_Pro();
		if(OtherUserPro !=0) {
			FileDto ProfileFile = mypageService.SelectConfirmFile(OtherUserPro);
			model.addAttribute("Pro_fi_Nm", ProfileFile.getFi_Nm());
		}
		
		model.addAttribute("userName", userName);
		
		return "detail/completeform";
	}
	
	@PostMapping("/complete")
	public String complete(int req_No, ResultDto res_dto, MultipartHttpServletRequest request) {
		// 글번호로 result dto 가져오기
		ResultDto dto = boardService.selectResult(req_No);
		
		// result dto 내용 업데이트 (result stat 확인중으로 변경)
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
		
		// 요청글 사용자 정보
		UsersDto user_dto = boardService.selectUser(req_dto.getReq_UCode());
		model.addAttribute("user_dto", user_dto);
		
		// 요청글 작성자 정보
		int OtherUserPro = user_dto.getUser_Pro();
		if(OtherUserPro !=0) {
			FileDto ProfileFile = mypageService.SelectConfirmFile(OtherUserPro);
			model.addAttribute("Pro_fi_Nm", ProfileFile.getFi_Nm());
		}
		model.addAttribute("userName", userName);
		
		ResultDto result = boardService.selectResult(req_No);
		List<FileDto> fi_list = boardService.selectResultFile(result.getRes_Code());

		Gson gson = new Gson();
		
		model.addAttribute("res_dto", gson.toJson(result));
		model.addAttribute("fi_list", fi_list);
		
		return "detail/recompleteform";
	}
	

	
}
