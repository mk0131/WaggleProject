package com.probee.waggle.model.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.service.BoardService;
import com.probee.waggle.model.service.PointService;
import com.probee.waggle.model.service.VolunteerService;

@Controller
@RequestMapping("/vol")
public class VolunteerController {
	
	@Autowired
	VolunteerService volunteerService;
	@Autowired
	BoardService boardService;
	@Autowired
	PointService pointService;
	
	@GetMapping("/submit") //지원하기
	public String Vol(int vo_UCode, int vo_No, HttpServletResponse response) {
		
		// 지원자의 주소 여부 확인후 없으면 마이페이지 주소 업데이트 폼으로 이동
		UserAddressDto add_dto = boardService.selectUserAddr(vo_UCode);

		if(add_dto == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			String redirect = "/mypage/profileEdit?ua_UCode="+vo_UCode;
			String redirect2 = "/board/detail?req_No="+vo_No;
			
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("if(confirm('내정보 수정에서 주소를 입력해 주세요.')){"
						+ "window.location.href='"+redirect+"';"
						+ "} else {"
						+ "window.location.href='"+redirect2+"';"
						+ "}");
				out.println("</script>");
				out.flush();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
				return "redirect:/board/list";
			}
		}
		
		int res = volunteerService.Submit(vo_UCode, vo_No);
		
		if(res>0) {
			return "redirect:/board/detail?req_No=" +vo_No;
		}
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/cancel") // 지원취소
	public String Cancel(int vo_UCode, int vo_No , HttpSession session) {
		
		int res = volunteerService.Cancel(vo_No,vo_UCode);
		
		if(res>0) {
			session.setAttribute("vo_UCode", -1);
			return "redirect:/board/detail?req_No=" +vo_No;
		}
		return "redirect:/board/detail?req_No=" +vo_No;
	}
	
	@GetMapping("/undo") // 24시간전 수행취소
	public String Undo(int vo_UCode, int vo_No , HttpSession session) {
		
		int res = volunteerService.Block(vo_No,vo_UCode); // 수행자 차단
		volunteerService.ResCancel(vo_No, vo_UCode); // 결과물 취소(0) 상태
		
		// 작성자 포인트 환급
		RequestDto2 req_dto = boardService.selectRequest(vo_No);
		int req_Point = req_dto.getReq_Point();
		int req_UCode = req_dto.getReq_UCode();
		pointService.insertPay(req_Point, req_UCode, "획득");
		// user 정보 point update
		int user_point = pointService.selectUserPoint(req_UCode);
		pointService.updateUserPoint(user_point + req_Point, req_UCode);
		
		if(res>0) {
			session.setAttribute("vo_UCode", -1);
			boardService.Recruit(vo_No); // 모집중으로 변환
			return "redirect:/board/detail?req_No=" +vo_No;
		}
		return "redirect:/board/detail?req_No=" +vo_No;
	}
	
	@GetMapping("/lateundo") // 24시간후 수행취소
	public String LateUndo(int vo_UCode, int vo_No , HttpSession session) {
		
		int res = volunteerService.Block(vo_No,vo_UCode); // 수행자 차단
		volunteerService.ResRevoke(vo_No, vo_UCode); // 결과물 취소 상태
		
		// 작성자 포인트 환급
		RequestDto2 req_dto = boardService.selectRequest(vo_No);
		int req_Point = req_dto.getReq_Point();
		int req_UCode = req_dto.getReq_UCode();
		pointService.insertPay(req_Point, req_UCode, "획득");
		// user 정보 point update
		int user_point = pointService.selectUserPoint(req_UCode);
		pointService.updateUserPoint(user_point + req_Point, req_UCode);
		
		if(res>0) {
			session.setAttribute("vo_UCode", -1);
			boardService.Recruit(vo_No); // 모집중으로 변환
			return "redirect:/board/detail?req_No=" +vo_No;
		}
		return "redirect:/board/detail?req_No=" +vo_No;
	}

}
