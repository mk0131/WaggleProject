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
	
	@RequestMapping("/map")
	public static String gomap() {
		return "map";
	}
	
	@RequestMapping("/login")
	public static String gologin() {
		return "login";
	}
	
	@RequestMapping("/board")
	public static String goboard() {
		return "board";
	}
	
}
