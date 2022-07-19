package com.probee.waggle.model.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.service.MypageService;

@Controller
@RequestMapping("/mypage") // 회원가입
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping(value="/descInsert", method=RequestMethod.POST)
	public String InsertUserInfo(HttpServletRequest request, int code, String description) {
		
		//자기소개 db에 삽입
		int res=0;
		res = mypageService.DescUpdate(description, code);
		if (res>0) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
		}
		
		
		//세션에 자기소개 저장
		HttpSession session = request.getSession();
		String editDesc = mypageService.SelectDesc(code);
		session.setAttribute("user_Intro", editDesc);
		session.setMaxInactiveInterval(-1);
		
		
		return "redirect:/mypage_me";
	}
	
	@RequestMapping(value="/descEdit", method=RequestMethod.POST)
	public String selectUserInfo(HttpServletRequest request, int code, String description) {
		
		//기존에 자기소개 저장되어있는거 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("user_Intro");
		
		
		//자기소개 수정
		int res=0;
		res = mypageService.DescUpdate(description, code);
		if (res>0) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
		}
		
		
		//수정된 자기소개 세션에 다시 저장
		String editDesc = mypageService.SelectDesc(code);
		session.setAttribute("user_Intro", editDesc);
		session.setMaxInactiveInterval(-1);
		
		
		return "redirect:/mypage_me";
	}
	
	//마이페이지 완료된리스트 컨트롤러
	@RequestMapping(value="/reqroom", method=RequestMethod.POST)
	@ResponseBody
	public List<MypageFinishlistDto> requestFinish(String stat, int ucode) {
		List<MypageFinishlistDto> finishlist = mypageService.SelectReqRoom(stat, ucode);
		
		return finishlist;
	}
	
	//이용내역페이지 나의 요청 컨트롤러
	@RequestMapping(value="/reqhistory", method=RequestMethod.POST)
	@ResponseBody
	public List<MypageFinishlistDto> reqhistory(int ucode) {
		List<MypageFinishlistDto> myReqList = mypageService.SelectMyRequest(ucode);
		return myReqList;
	}
	
	@RequestMapping(value="/performhistory", method=RequestMethod.POST)
	@ResponseBody
	public List<MypageFinishlistDto> performhistory(int ucode) {
		List<MypageFinishlistDto> myPerformList = mypageService.SelectMyPerform(ucode);
		return myPerformList;
	}
}
