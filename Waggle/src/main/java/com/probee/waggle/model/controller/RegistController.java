package com.probee.waggle.model.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.service.RegistService;

@Controller
@RequestMapping("/regist") // 회원가입
public class RegistController {

	@Autowired
	RegistService registService;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/idChk", method = RequestMethod.POST) // 중복아이디 확인
	@ResponseBody
	public String IdChk(String user_Id) {

		int result = registService.idChk(user_Id);

		if (result != 0) {
			return "fail"; // 중복아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}

	}

	@RequestMapping(value = "/mailChk", method = RequestMethod.GET)
	@ResponseBody
	public String MailChk(String user_Email) {

		int result = registService.EmailChk(user_Email);

		if (result != 0) {

			return "fail"; // 중복 메일이 존재
		} else {
			Random random = new Random(); // 인증번호 난수 생성
			int checkNum = random.nextInt(888888) + 111111;

			String setFrom = "waggle_waggle@naver.com";
			String toMail = user_Email;
			String title = "Waggle 회원가입 인증 이메일 입니다.";
			String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
					+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);

			} catch (Exception e) {
				e.printStackTrace();
			}

			String num = Integer.toString(checkNum); // ajax 를 위해 string 으로 변환

			return num;
		}

	}

	@RequestMapping(value = "/nmChk", method = RequestMethod.POST) // 중복 닉네임 확인
	@ResponseBody
	public String NmChk(String user_Nm) {

		int result = registService.nmChk(user_Nm);

		if (result != 0) {
			return "fail"; // 중복닉네임이 존재
		} else {
			return "success"; // 중복 닉네임 x
		}

	}

	@RequestMapping(value = "/join", method = RequestMethod.POST) // 회원가입
	public String Join(UsersDto dto, UserAddressDto dto2, String user_Id) { 
		int regjoin = registService.Join(dto); // 회원정보 입력
		if (regjoin > 0) {
			UsersDto user = registService.SelectOne(user_Id); // 아이디로 코드 확인
			int code = user.getUser_Code();
			dto2.setUa_UCode(code); // user_Code 를 ua_UCode 로 입력
			int addjoin = registService.AddressJoin(dto2); // 입력받은 주소 정보 입력
			if (addjoin > 0) {
				return "redirect:/login"; // 성공시 로그인페이지
			}
		} 
		return "redirect:/home"; // 실패시 홈페이지

	}

}
