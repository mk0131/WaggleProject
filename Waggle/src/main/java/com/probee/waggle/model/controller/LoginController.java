package com.probee.waggle.model.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.service.LoginService;

@Controller
@RequestMapping("/login") // 일반 로그인
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value =  "/Normal", method = RequestMethod.POST)
	public String LoginUser(HttpServletRequest requst, Model model , UsersDto dto, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = requst.getSession(); // 세션 초기화
		UsersDto user = loginService.UserLogin(dto);
		
		if( user == null) { // id, pw 가 일치하지 않으면 user 값은 null 이고 null 값이면 로그인 페이지를 리다이렉트 한다.
			int result = 0;
			rttr.addFlashAttribute("result",result);
			return "redirect:/login";
			
		}
		
		session.setAttribute("user_Code", user.getUser_Code());
		session.setMaxInactiveInterval(-1); // 세션 시간 무한대
		
		System.out.println(session.getAttribute("user_Code")); // 세션에 저장된 값 확인
		return "redirect:/home";
	}

}
