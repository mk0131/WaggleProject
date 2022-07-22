package com.probee.waggle.model.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.service.LoginService;
import com.probee.waggle.model.service.OAuthService;

@Controller
@RequestMapping("/login") // 일반 로그인
public class LoginController {

	@Autowired
	LoginService loginService;
	@Autowired
	OAuthService oAuthService;

	@RequestMapping(value = "/Normal", method = RequestMethod.POST)
	public String LoginUser(HttpServletRequest request, Model model, UsersDto dto, RedirectAttributes rttr)
			throws Exception {

		HttpSession session = request.getSession(); // 세션 생성
		UsersDto user = loginService.UserLogin(dto);

		if (user == null) { // id, pw 가 일치하지 않으면 user 값은 null 이고 null 값이면 로그인 페이지를 리다이렉트 한다.
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/login";

		}

		session.setAttribute("user_Code", user.getUser_Code());
		session.setAttribute("user_Nm", user.getUser_Nm());
		session.setAttribute("user_Email", user.getUser_Email());
		session.setAttribute("user_Gender", user.getUser_Gender());
		session.setAttribute("user_Age", user.getUser_Age());
		session.setAttribute("user_Grade", user.getUser_Grade());
		session.setAttribute("user_Intro", user.getUser_Intro());
		session.setAttribute("user_Point", user.getUser_Point());
		session.setAttribute("user_Pro", user.getUser_Pro());
		session.setMaxInactiveInterval(-1); // 세션 시간 무한대

		return "redirect:/home";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET) // 로그아웃
	public String LogOut(HttpServletRequest request) {

		HttpSession session = request.getSession();

		session.invalidate(); // 로그아웃

		return "redirect:/login";
	}

	@RequestMapping(value = "/naver", method = RequestMethod.POST) // 네이버 로그인 & 회원가입
	public String NaverLogin(HttpServletRequest request, UsersDto dto) {

		HttpSession session = request.getSession();
		UsersDto user = loginService.Naver(dto);

		if (user == null) { // 동일한 이메일이 없으면 회원가입
			loginService.NaverRegist(dto);
			UsersDto naver = loginService.Naver(dto);
			session.setAttribute("user_Code", naver.getUser_Code());
			session.setAttribute("user_Nm", naver.getUser_Nm());
			session.setAttribute("user_Email", naver.getUser_Email());
			session.setAttribute("user_Gender", naver.getUser_Gender());
			session.setAttribute("user_Age", naver.getUser_Age());
			session.setAttribute("user_Grade", naver.getUser_Grade());
			session.setAttribute("user_Intro", naver.getUser_Intro());
			session.setAttribute("user_Point", naver.getUser_Point());
			session.setAttribute("user_Pro", naver.getUser_Pro());
			session.setMaxInactiveInterval(-1);
			return "redirect:/home";

		} else { // 동일한 이메일이 있으면 회원정보 불러오기
			session.setAttribute("user_Code", user.getUser_Code());
			session.setAttribute("user_Nm", user.getUser_Nm());
			session.setAttribute("user_Email", user.getUser_Email());
			session.setAttribute("user_Gender", user.getUser_Gender());
			session.setAttribute("user_Age", user.getUser_Age());
			session.setAttribute("user_Grade", user.getUser_Grade());
			session.setAttribute("user_Intro", user.getUser_Intro());
			session.setAttribute("user_Point", user.getUser_Point());
			session.setAttribute("user_Pro", user.getUser_Pro());
			session.setMaxInactiveInterval(-1);
			return "redirect:/home";

		}

	}

	@ResponseBody
	@GetMapping("/kakao") // 카카오 로그인 & 회원가입
	public String kakaoCallback(String code, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UsersDto users = new UsersDto();

		String res = oAuthService.createKakaoUser(oAuthService.getKakaoAccessToken(code));

		String[] user = res.split(",");

		if (user[3].equals("male")) {
			user[3] = "M";
		} else {
			user[3] = "F";
		}

		users.setUser_Kakao(user[0]);
		users.setUser_Nm(user[1]);
		users.setUser_Email(user[2]);
		users.setUser_Gender(user[3]);
		
		UsersDto dto2 = loginService.Naver(users);
		
		if (dto2 == null) {
			loginService.KakaoRegist(users);
			UsersDto kakao = loginService.Naver(users);
			System.out.println(kakao);
			session.setAttribute("user_Code", kakao.getUser_Code());
			session.setAttribute("user_Nm", kakao.getUser_Nm());
			session.setAttribute("user_Email", kakao.getUser_Email());
			session.setAttribute("user_Gender", kakao.getUser_Gender());
			session.setAttribute("user_Age", kakao.getUser_Age());
			session.setAttribute("user_Grade", kakao.getUser_Grade());
			session.setAttribute("user_Intro", kakao.getUser_Intro());
			session.setAttribute("user_Point", kakao.getUser_Point());
			session.setAttribute("user_Pro", kakao.getUser_Pro());
			session.setMaxInactiveInterval(-1);
			return "redirect:/home";
		} else {
			System.out.println(dto2);
			session.setAttribute("user_Code", dto2.getUser_Code());
			session.setAttribute("user_Nm", dto2.getUser_Nm());
			session.setAttribute("user_Email", dto2.getUser_Email());
			session.setAttribute("user_Gender", dto2.getUser_Gender());
			session.setAttribute("user_Age", dto2.getUser_Age());
			session.setAttribute("user_Grade", dto2.getUser_Grade());
			session.setAttribute("user_Intro", dto2.getUser_Intro());
			session.setAttribute("user_Point", dto2.getUser_Point());
			session.setAttribute("user_Pro", dto2.getUser_Pro());
			session.setMaxInactiveInterval(-1);
			return "redirect:/home";
		}

	}
	

}
