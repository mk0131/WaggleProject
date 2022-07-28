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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.probee.waggle.model.component.FileSaver;
import com.probee.waggle.model.dto.ConfirmDto;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.MypageOtherDto;
import com.probee.waggle.model.dto.MypageUsageDto;
import com.probee.waggle.model.dto.UserAddressDto;
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
		MypageOtherDto UserList = mypageService.SelectUsersInfo(ucode);
		MypageUsageDto reqCancel = mypageService.reqCancel(ucode);
		MypageUsageDto reqTotal = mypageService.reqTotal(ucode);
		MypageUsageDto resCancel = mypageService.resCancel(ucode);
		MypageUsageDto resTotal = mypageService.resTotal(ucode);
		
		int OtherUserPro = UserList.getUser_Pro();
		if(OtherUserPro !=0) {
			FileDto ProfileFile = mypageService.SelectConfirmFile(OtherUserPro);
			model.addAttribute("Pro_fi_Nm", ProfileFile.getFi_Nm());
		}
		
		double reqRatio = 0;
		double resRatio = 0;
		
		if (reqTotal.getReqTotal() != 0) {
			reqRatio = (double)(reqCancel.getReqCancel()/reqTotal.getReqTotal())*100;
		}else {
			reqRatio = 0;
		}
		if(resTotal.getResTotal() != 0) {
			resRatio = (double)(resCancel.getResCancel()/resTotal.getResTotal())*100;
		}else {
			resRatio = 0;
		}
		
		model.addAttribute("dto",UserList);
		model.addAttribute("reqCancel", reqCancel.getReqCancel());
		model.addAttribute("reqTotal", reqTotal.getReqTotal());
		model.addAttribute("resCancel", resCancel.getResCancel());
		model.addAttribute("resTotal", resTotal.getResTotal());
		model.addAttribute("ratio", Math.round(reqRatio));
		model.addAttribute("ratio2", Math.round(resRatio));
		return "mypage_other";
	}
	
	@GetMapping("/me")
	public String selectUsage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int ucode = (int)session.getAttribute("user_Code");
		int user_Pro = (int)session.getAttribute("user_Pro");
		
		MypageUsageDto reqCancel = mypageService.reqCancel(ucode);
		MypageUsageDto reqTotal = mypageService.reqTotal(ucode);
		MypageUsageDto resCancel = mypageService.resCancel(ucode);
		MypageUsageDto resTotal = mypageService.resTotal(ucode);
		ConfirmDto MyConfirm = mypageService.SelectMyConfirm(ucode);
		
		if (MyConfirm != null) {
			int ConF_Code = MyConfirm.getCo_FCode();
			//공인중개사 사진 파일 이름 db에서 가져오기 위함.
			FileDto ConfirmFile = mypageService.SelectConfirmFile(ConF_Code);
			model.addAttribute("con_file_Name",ConfirmFile.getFi_Nm());
			model.addAttribute("condto", MyConfirm.getCo_UCode());
		} else {
			model.addAttribute("condto",0);
		}
		
		if(user_Pro != 0) {
			//프로필 사진 파일 이름 db에서 가져오기 위함
			FileDto ProfileFile = mypageService.SelectConfirmFile(user_Pro);
			model.addAttribute("Pro_fi_Nm", ProfileFile.getFi_Nm());
		}
		
		double reqRatio = 0;
		double resRatio = 0;
		
		if (reqTotal.getReqTotal() != 0) {
			reqRatio = (double)(reqCancel.getReqCancel()/reqTotal.getReqTotal())*100;
		}else {
			reqRatio = 0;
		}
		if(resTotal.getResTotal() != 0) {
			resRatio = (double)(resCancel.getResCancel()/resTotal.getResTotal())*100;
		}else {
			resRatio = 0;
		}

		model.addAttribute("reqCancel", reqCancel.getReqCancel());
		model.addAttribute("reqTotal", reqTotal.getReqTotal());
		model.addAttribute("resCancel", resCancel.getResCancel());
		model.addAttribute("resTotal", resTotal.getResTotal());
		model.addAttribute("ratio", Math.round(reqRatio));
		model.addAttribute("ratio2", Math.round(resRatio));
		
		return "mypage_me";
	}
	
	
	//프로필 사진 수정 컨트롤러
	@PostMapping(value="/imageEdit")
	public String ImageEdit(HttpServletRequest request, MultipartHttpServletRequest request2) {
		HttpSession session = request.getSession();
		
		int user_Code = (int)session.getAttribute("user_Code");
		List<FileDto> lastFileLowList = mypageService.SelectLastFiCode();
		
		int new_Fi_Code = lastFileLowList.get(0).getFi_Code() + 1;
		
		MultipartFile file = request2.getFile("myfile");
		String fileName = file.getOriginalFilename();
		int pos = fileName.lastIndexOf(".");
		String ext = fileName.substring(pos + 1);
		
		// 프로필 사진 수정하기 버튼 누를때 fileDB에 형식 맞춰서 INSERT 됨.
		int res = 0;
		res = mypageService.ImageFileInsert(new_Fi_Code, ext);
		if (res > 0) {
			System.out.println("이미지 파일 insert 성공");
		} else {
			System.out.println("이미지 파일 insert 실패");
		}
		
		// 프로필 사진 수정하기 버튼 누를때 USERS DB의 프로필 코드 수정됨.
		int res1 = 0;
		res1 = mypageService.UserProChange(new_Fi_Code, user_Code);
		if (res1 > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
		
		// 업로드 된 이미지를 로컬에 저장하는 코드
		int res2 = mypageService.saveLocalProfile(new_Fi_Code, file, request2);
		if(res2 >0) {
			System.out.println("로컬에 이미지 저장 성공");
		}else {
			System.out.println("로컬에 이미지 저장 실패");
		}
		session.removeAttribute("user_Pro");
		session.setAttribute("user_Pro", new_Fi_Code);
		return "redirect:/mypage/profileEdit?ua_UCode=" + user_Code;
	}
	
	//공인중개사 인증 업로드 컨트롤러
	@PostMapping(value="/confirm")
	public String Confirm(HttpServletRequest request, MultipartHttpServletRequest request2) {
		HttpSession session = request.getSession();
		int user_Code = (int)session.getAttribute("user_Code");
		List<FileDto> lastFileLowList = mypageService.SelectLastFiCode();
		
		int new_Fi_Code = lastFileLowList.get(0).getFi_Code() + 1;
		
		ConfirmDto MyConfirm = mypageService.SelectMyConfirm(user_Code);
		
		MultipartFile file = request2.getFile("myfile");
		String fileName = file.getOriginalFilename();
		int pos = fileName.lastIndexOf(".");
		String ext = fileName.substring(pos + 1);
		
		if(MyConfirm == null) {
			//Confirm DB에 파일 없으면 파일 db 먼저 INSERT
			int res = mypageService.InsertFileConfirm(new_Fi_Code, user_Code, ext);
			if (res>0) {
				System.out.println("파일DB INSERT 성공");
			}else {
				System.out.println("파일DB INSERT 실패");
			};
			
			//file db insert 후 confirm db insert
			int res1 = mypageService.InsertConfirm(user_Code, new_Fi_Code);
			if (res1>0) {
				System.out.println("CONFIRM DB INSERT 성공");
			}else {
				System.out.println("CONFIRM DB INSERT 실패");
			};
			
			//로컬에 이미지 저장
			int res2 = mypageService.saveLocalConfirm(user_Code, file, request);
			if(res2>0) {
				System.out.println("로컬에 자격증 이미지 저장 성공");
			}else {
				System.out.println("로컬에 자격증 이미지 저장 실패");
			};
			
		} else {
			int co_Fcode = MyConfirm.getCo_FCode();
			// 업로드 된 이미지를 로컬에 저장하는 코드
			int res2 = mypageService.saveLocalConfirm(user_Code, file, request);
			if(res2>0) {
				System.out.println("로컬에 자격증 이미지 저장 성공");
			}else {
				System.out.println("로컬에 자격증 이미지 저장 실패");
			}
			
			// File DB에 Fi_Nm 업데이트
			int res1 = mypageService.FileUpdate(user_Code, ext, co_Fcode);
			if(res1>0) {
				System.out.println("FI_NM 수정 성공");
			}else {
				System.out.println("FI_NM 수정 실패");
			}
			
		}
		return "redirect:/mypage/me";
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

		return "redirect:/mypage/me";
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

		return "redirect:/mypage/me";
	}

	// 마이페이지 완료된리스트 컨트롤러
	@RequestMapping(value = "/reqroom", method = RequestMethod.POST)
	@ResponseBody
	public List<MypageFinishlistDto> requestFinish(String stat, int ucode) {
		List<MypageFinishlistDto> finishlist = mypageService.SelectReqRoom(stat, ucode);

		return finishlist;
	}

	@GetMapping("/profileEdit") // 회원정보 수정 버튼
	public String ProfileEdit(int ua_UCode,  Model model, HttpServletRequest request) {
		UserAddressDto user = mypageService.SelectAddr(ua_UCode);
		HttpSession session = request.getSession();
		
		int user_Pro = (int)session.getAttribute("user_Pro");
		FileDto ProfileFile = mypageService.SelectConfirmFile(user_Pro);
		
		model.addAttribute("Pro_Fi_Nm", ProfileFile.getFi_Nm());
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
