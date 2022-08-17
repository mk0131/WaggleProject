package com.probee.waggle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.NoticeDto;
import com.probee.waggle.model.dto.RequestDto;
import com.probee.waggle.model.service.HomeService;
import com.probee.waggle.model.service.NoticeService;

@SpringBootApplication
@Controller
public class WaggleApplication extends SpringBootServletInitializer{

	@Autowired
	HomeService homeService;
	
	@Autowired
	NoticeService noticeService;
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(WaggleApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(WaggleApplication.class, args);
	}
	
	@RequestMapping("/")
	public String goindex(Model model) {
		List<RequestDto> FinishReq = homeService.selectFinishReq();
		List<NoticeDto> list = noticeService.homeList();
		
		int finishReqFirst = 0;
		int finishReqSecond = 0;
		int finishReqThird = 0;
		
		if(FinishReq.size()==0) {
			finishReqFirst = 0;
			finishReqSecond = 0;
			finishReqThird = 0;
		}else if(FinishReq.size()==1) {
			finishReqFirst = FinishReq.get(0).getReq_No();
			finishReqSecond = 0;
			finishReqThird = 0;
		}else if(FinishReq.size()==2) {
			finishReqFirst = FinishReq.get(0).getReq_No();
			finishReqSecond = FinishReq.get(1).getReq_No();
			finishReqThird = 0;
		}else {
			finishReqFirst = FinishReq.get(0).getReq_No();
			finishReqSecond = FinishReq.get(1).getReq_No();
			finishReqThird = FinishReq.get(2).getReq_No();
		}
		
		model.addAttribute("req1", finishReqFirst);
		model.addAttribute("req2", finishReqSecond);
		model.addAttribute("req3", finishReqThird);
		model.addAttribute("list", list);
		
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
	
	@RequestMapping("/chatbot")
	public static String gochatbot() {
		return "chatbot";
	}

}
