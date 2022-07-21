package com.probee.waggle;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@Controller
public class WaggleApplication {

	public static void main(String[] args) {
		SpringApplication.run(WaggleApplication.class, args);
	}
	
	@RequestMapping("/")
	public static String goindex() {
		return "index";
	}
	
	@RequestMapping("/home")
	public static String gohome() {
		return "home";
	}
	
	@RequestMapping("/login")
	public static String gologin() {
		return "login";
	}

	@RequestMapping("/inquiry")
	public static String goinquiry() {
		return "inquiry";
	}
	
	@RequestMapping("/mypage_me")
	public static String gomypageme() {
		return "mypage_me";
	}
	
	@RequestMapping("/profileEdit")
	public static String goprofileedit() {
		return "profileEdit";
	}
	
	@RequestMapping("/history")
	public static String gohistory() {
		return "history";
	}
	
	@RequestMapping("/chatbot")
	public static String gochatbot() {
		return "chatbot";
	}
}
