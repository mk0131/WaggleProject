package com.probee.waggle.model.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probee.waggle.model.component.FileSaver;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.service.MypageService;
import com.probee.waggle.model.service.RegistService;

@Controller
@RequestMapping("/mypage") // 회원가입
public class MypageController {

	@Autowired
	MypageService mypageService;

	@Autowired
	RegistService registService;
	
	@Autowired
	FileSaver fileSaver;
	
	@GetMapping("/other")
	public String selectOtherInfo(int ucode, Model model) {
		UsersDto UserList = mypageService.SelectUsersInfo(ucode);
		model.addAttribute("dto",UserList);
		return "mypage_other";
	}
	
	@PostMapping(value="/imageEdit")
	public String ImageEdit(HttpServletRequest request, String imgUrl) {
		HttpSession session = request.getSession();
		int user_Code = (int)session.getAttribute("user_Code");
		List<FileDto> lastFileLowList = mypageService.SelectLastFiCode();
		
		int new_Fi_Code = lastFileLowList.get(0).getFi_Code() + 1;
		
		int res = 0;
		res = mypageService.ImageFileInsert(new_Fi_Code);
		if (res > 0) {
			System.out.println("이미지 파일 insert 성공");
		} else {
			System.out.println("이미지 파일 insert 실패");
		}
		
		int res1 = 0;
		res1 = mypageService.UserProChange(new_Fi_Code, user_Code);
		if (res1 > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
		
		int res2 =fileSaver.saveCrawlImg(imgUrl, "/images/profile/profile_"+new_Fi_Code);
		if(res2 >0) {
			System.out.println("로컬에 이미지 저장 성공");
		}else {
			System.out.println("로컬에 이미지 저장 실패");
		}
		return "redirect:/mypage/profileEdit?ua_UCode=" + user_Code;
	}
	
	
	@RequestMapping(value = "/descInsert", method = RequestMethod.POST)
	public String InsertUserInfo(HttpServletRequest request, int code, String description) {

		// 자기소개 db에 삽입
		int res = 0;
		res = mypageService.DescUpdate(description, code);
		if (res > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}

		// 세션에 자기소개 저장
		HttpSession session = request.getSession();
		String editDesc = mypageService.SelectDesc(code);
		session.setAttribute("user_Intro", editDesc);
		session.setMaxInactiveInterval(-1);

		return "redirect:/mypage_me";
	}

	@RequestMapping(value = "/descEdit", method = RequestMethod.POST)
	public String selectUserInfo(HttpServletRequest request, int code, String description) {

		// 기존에 자기소개 저장되어있는거 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("user_Intro");

		// 자기소개 수정
		int res = 0;
		res = mypageService.DescUpdate(description, code);
		if (res > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}

		// 수정된 자기소개 세션에 다시 저장
		String editDesc = mypageService.SelectDesc(code);
		session.setAttribute("user_Intro", editDesc);
		session.setMaxInactiveInterval(-1);

		return "redirect:/mypage_me";
	}

	// 마이페이지 완료된리스트 컨트롤러
	@RequestMapping(value = "/reqroom", method = RequestMethod.POST)
	@ResponseBody
	public List<MypageFinishlistDto> requestFinish(String stat, int ucode) {
		List<MypageFinishlistDto> finishlist = mypageService.SelectReqRoom(stat, ucode);

		return finishlist;
	}

	@GetMapping("/profileEdit") // 회원정보 수정 버튼
	public String ProfileEdit(int ua_UCode, UserAddressDto dto, Model model) {
		UserAddressDto user = mypageService.SelectAddr(ua_UCode);

		model.addAttribute("dto", user);

		return "profileEdit";
	}

	// 이용내역페이지 나의 요청 컨트롤러
	@RequestMapping(value = "/reqhistory", method = RequestMethod.POST)
	@ResponseBody
	public List<MypageFinishlistDto> reqhistory(int ucode) {
		List<MypageFinishlistDto> myReqList = mypageService.SelectMyRequest(ucode);
		return myReqList;
	}

	@RequestMapping(value = "/performhistory", method = RequestMethod.POST)
	@ResponseBody
	public List<MypageFinishlistDto> performhistory(int ucode) {
		List<MypageFinishlistDto> myPerformList = mypageService.SelectMyPerform(ucode);
		return myPerformList;

	}

	@PostMapping("/pwchange") // 비밀번호 변경
	public String PwChange(int user_Code, String user_Pw) {

		mypageService.PwChange(user_Pw, user_Code);

		return "redirect:/mypage/profileEdit?ua_UCode=" + user_Code;
	}

	@PostMapping("/emailchange") // 이메일 변경
	public String EmailChange(int user_Code, String user_Email, HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("user_Email");

		mypageService.EmailChange(user_Email, user_Code);

		session.setAttribute("user_Email", user_Email);
		session.setMaxInactiveInterval(-1);

		return "redirect:/mypage/profileEdit?ua_UCode=" + user_Code;
	}

	@PostMapping("/nmchange") // 닉네임 변경
	public String NmChange(int user_Code, String user_Nm, HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("user_Nm");

		mypageService.NmChange(user_Nm, user_Code);

		session.setAttribute("user_Nm", user_Nm);
		session.setMaxInactiveInterval(-1);

		return "redirect:/mypage/profileEdit?ua_UCode=" + user_Code;
	}

	@PostMapping("/agechange") // 나이 변경
	public String AgeChange(int user_Code, int user_Age, HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("user_Age");

		mypageService.AgeChange(user_Age, user_Code);

		session.setAttribute("user_Age", user_Age);
		session.setMaxInactiveInterval(-1);

		return "redirect:/mypage/profileEdit?ua_UCode=" + user_Code;
	}

	@GetMapping("/addrchange") // 주소 변경
	public String AddrChange(int ua_UCode, UserAddressDto dto, Model model, String ua_Post, String ua_Addr,
			String ua_DAddr) {

		UserAddressDto user = mypageService.SelectAddr(ua_UCode);
		if (user == null) {
			registService.AddressJoin(dto);
			UserAddressDto users = mypageService.SelectAddr(ua_UCode);
			model.addAttribute("dto", users);
		} else {
			mypageService.AddrChange(ua_Post, ua_Addr, ua_DAddr, ua_UCode);
			model.addAttribute("dto", user);
		}

		return "redirect:/mypage/profileEdit?ua_UCode=" + ua_UCode;
	}

	@PostMapping("/genderchange") // 성별 변경
	public String GenderChange(int user_Code, String user_Gender, HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("user_Gender");

		mypageService.GenderChange(user_Gender, user_Code);

		session.setAttribute("user_Gender", user_Gender);
		session.setMaxInactiveInterval(-1);

		return "redirect:/mypage/profileEdit?ua_UCode=" + user_Code;
	}
}
