package com.probee.waggle.model.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.MypageOtherDto;
import com.probee.waggle.model.dto.MypageUsageDto;
import com.probee.waggle.model.dto.Paging;
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
		MypageOtherDto UserList = mypageService.SelectUsersInfo(ucode);
		//이용횟수 모든기간
		MypageUsageDto reqCancel = mypageService.reqCancel(ucode);
		MypageUsageDto reqFinish = mypageService.reqFinish(ucode);
		MypageUsageDto reqTotal = mypageService.reqTotal(ucode);
		MypageUsageDto resCancel = mypageService.resCancel(ucode);
		MypageUsageDto resCancelZero = mypageService.resCancelZero(ucode);
		MypageUsageDto resFinish = mypageService.resFinish(ucode);
		MypageUsageDto resTotal = mypageService.resTotal(ucode);
		//이용횟수 3개월
		MypageUsageDto reqCancel3M = mypageService.reqCancel3M(ucode);
		MypageUsageDto reqFinish3M = mypageService.reqFinish3M(ucode);
		MypageUsageDto reqTotal3M = mypageService.reqTotal3M(ucode);
		MypageUsageDto resCancel3M = mypageService.resCancel3M(ucode);
		MypageUsageDto resCancelZero3M = mypageService.resCancelZero3M(ucode);
		MypageUsageDto resFinish3M = mypageService.resFinish3M(ucode);
		MypageUsageDto resTotal3M = mypageService.resTotal3M(ucode);
		
		int OtherUserPro = UserList.getUser_Pro();
		if(OtherUserPro !=0) {
			FileDto ProfileFile = mypageService.SelectConfirmFile(OtherUserPro);
			model.addAttribute("Pro_fi_Nm", ProfileFile.getFi_Nm());
		}
		
		double reqRatio = 0;
		double resRatio = 0;
		double reqRatio3M = 0;
		double resRatio3M = 0;
		
		
		if (reqTotal.getReqTotal() != 0) {
			reqRatio = ((double)reqFinish.getReqFinish()/(double)reqTotal.getReqTotal())*100;
		}else {
			reqRatio = 0;
		}
		if(resTotal.getResTotal() != 0) {
			resRatio = ((double)resFinish.getResFinish()/(double)resTotal.getResTotal())*100;
		}else {
			resRatio = 0;
		}
		if (reqTotal3M.getReqTotal() != 0) {
			reqRatio3M = ((double)reqFinish3M.getReqFinish()/(double)reqTotal3M.getReqTotal())*100;
		}else {
			reqRatio3M = 0;
		}
		if(resTotal3M.getResTotal() != 0) {
			resRatio3M = ((double)resFinish3M.getResFinish()/(double)resTotal3M.getResTotal())*100;
		}else {
			resRatio3M = 0;
		}
		
		model.addAttribute("dto",UserList);
		model.addAttribute("reqCancel", reqCancel.getReqCancel());
		model.addAttribute("reqTotal", reqTotal.getReqTotal());
		model.addAttribute("resCancel", resCancel.getResCancel());
		model.addAttribute("resCancelZero", resCancelZero.getResCancelZero());
		model.addAttribute("resTotal", resTotal.getResTotal());
		model.addAttribute("reqFinish", reqFinish.getReqFinish());
		model.addAttribute("resFinish", resFinish.getResFinish());
		model.addAttribute("ratio", Math.round(reqRatio));
		model.addAttribute("ratio2", Math.round(resRatio));
		model.addAttribute("reqCancel3M", reqCancel3M.getReqCancel());
		model.addAttribute("reqTotal3M", reqTotal3M.getReqTotal());
		model.addAttribute("resCancel3M", resCancel3M.getResCancel());
		model.addAttribute("resCancelZero3M", resCancelZero3M.getResCancelZero());
		model.addAttribute("resTotal3M", resTotal3M.getResTotal());
		model.addAttribute("reqFinish3M", reqFinish3M.getReqFinish());
		model.addAttribute("resFinish3M", resFinish3M.getResFinish());
		model.addAttribute("ratio3M", Math.round(reqRatio3M));
		model.addAttribute("ratio2_3M", Math.round(resRatio3M));
		return "mypage_other";
	}
	
	@GetMapping("/me")
	public String selectUsage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int ucode = (int)session.getAttribute("user_Code");
		int user_Pro = (int)session.getAttribute("user_Pro");
		System.out.println(user_Pro);
		//마이페이지 유저 정보
		UsersDto myinfo = mypageService.SelectMyInfo(ucode);
		//이용횟수 모든기간
		MypageUsageDto reqCancel = mypageService.reqCancel(ucode);
		MypageUsageDto reqFinish = mypageService.reqFinish(ucode);
		MypageUsageDto reqTotal = mypageService.reqTotal(ucode);
		MypageUsageDto resCancel = mypageService.resCancel(ucode);
		MypageUsageDto resCancelZero = mypageService.resCancelZero(ucode);
		MypageUsageDto resFinish = mypageService.resFinish(ucode);
		MypageUsageDto resTotal = mypageService.resTotal(ucode);
		//이용횟수 3개월
		MypageUsageDto reqCancel3M = mypageService.reqCancel3M(ucode);
		MypageUsageDto reqFinish3M = mypageService.reqFinish3M(ucode);
		MypageUsageDto reqTotal3M = mypageService.reqTotal3M(ucode);
		MypageUsageDto resCancel3M = mypageService.resCancel3M(ucode);
		MypageUsageDto resCancelZero3M = mypageService.resCancelZero3M(ucode);
		MypageUsageDto resFinish3M = mypageService.resFinish3M(ucode);
		MypageUsageDto resTotal3M = mypageService.resTotal3M(ucode);
		//공인중개사자격증
		ConfirmDto MyConfirm = mypageService.SelectMyConfirm(ucode);
		
		if (MyConfirm != null) {
			int ConF_Code = MyConfirm.getCo_FCode();
			//공인중개사 사진 파일 이름 db에서 가져오기 위함.
			FileDto ConfirmFile = mypageService.SelectConfirmFile(ConF_Code);
			model.addAttribute("con_file_Name",ConfirmFile.getFi_Nm());
			model.addAttribute("con_stat", MyConfirm.getCo_Confirm());
			model.addAttribute("con_ucode", MyConfirm.getCo_UCode());
		} else {
			model.addAttribute("condto",0);
		}
		
		if(user_Pro != 0) {
			//프로필 사진 파일 이름 db에서 가져오기 위함
			FileDto ProfileFile = mypageService.SelectConfirmFile(user_Pro);
			if(ProfileFile == null) {
				model.addAttribute("Pro_fi_Nm", "/images/importToJsp/profile_default.jpg");
			}else {
				model.addAttribute("Pro_fi_Nm", ProfileFile.getFi_Nm());
			}
		}
		
		double reqRatio = 0;
		double resRatio = 0;
		double reqRatio3M = 0;
		double resRatio3M = 0;
		
		
		if (reqTotal.getReqTotal() != 0) {
			reqRatio = ((double)reqFinish.getReqFinish()/(double)reqTotal.getReqTotal())*100;
		}else {
			reqRatio = 0;
		}
		if(resTotal.getResTotal() != 0) {
			resRatio = ((double)resFinish.getResFinish()/(double)resTotal.getResTotal())*100;
		}else {
			resRatio = 0;
		}
		if (reqTotal3M.getReqTotal() != 0) {
			reqRatio3M = ((double)reqFinish3M.getReqFinish()/(double)reqTotal3M.getReqTotal())*100;
		}else {
			reqRatio3M = 0;
		}
		if(resTotal3M.getResTotal() != 0) {
			resRatio3M = ((double)resFinish3M.getResFinish()/(double)resTotal3M.getResTotal())*100;
		}else {
			resRatio3M = 0;
		}
		System.out.println("취소0" + resCancelZero3M.getResCancelZero());
		model.addAttribute("dto", myinfo);
		model.addAttribute("reqCancel", reqCancel.getReqCancel());
		model.addAttribute("reqTotal", reqTotal.getReqTotal());
		model.addAttribute("resCancel", resCancel.getResCancel());
		model.addAttribute("resCancelZero", resCancelZero.getResCancelZero());
		model.addAttribute("resTotal", resTotal.getResTotal());
		model.addAttribute("reqFinish", reqFinish.getReqFinish());
		model.addAttribute("resFinish", resFinish.getResFinish());
		model.addAttribute("ratio", Math.round(reqRatio));
		model.addAttribute("ratio2", Math.round(resRatio));
		model.addAttribute("reqCancel3M", reqCancel3M.getReqCancel());
		model.addAttribute("reqTotal3M", reqTotal3M.getReqTotal());
		model.addAttribute("resCancel3M", resCancel3M.getResCancel());
		model.addAttribute("resCancelZero3M", resCancelZero3M.getResCancelZero());
		model.addAttribute("resTotal3M", resTotal3M.getResTotal());
		model.addAttribute("reqFinish3M", reqFinish3M.getReqFinish());
		model.addAttribute("resFinish3M", resFinish3M.getResFinish());
		model.addAttribute("ratio3M", Math.round(reqRatio3M));
		model.addAttribute("ratio2_3M", Math.round(resRatio3M));
		
		return "mypage_me";
	}
	
	
	//프로필 사진 수정 컨트롤러
	@PostMapping(value="/imageEdit")
	public String ImageEdit(HttpServletResponse response, HttpServletRequest request, MultipartHttpServletRequest request2) {
		HttpSession session = request.getSession();
		
		int user_Code = (int)session.getAttribute("user_Code");
		List<FileDto> lastFileLowList = mypageService.SelectLastFiCode();
		int new_Fi_Code = 1;
		if(lastFileLowList.size() !=0 ) {
			new_Fi_Code = lastFileLowList.get(0).getFi_Code() + 1;			
		}
		
		MultipartFile file = request2.getFile("myfile");
		String fileName = file.getOriginalFilename();
		int pos = fileName.lastIndexOf(".");
		String ext = fileName.substring(pos + 1);
		
		System.out.println(fileName);
		// 업로드 된 이미지를 로컬에 저장하는 코드
		int res2 = mypageService.saveLocalProfile(new_Fi_Code, file, request2);
		if(res2 >0) {
			System.out.println("로컬에 이미지 저장 성공");
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
		}else {
			System.out.println("로컬에 이미지 저장 실패");
			alertAndGo(response, "이미지 저장 실패");
		}
		
		session.removeAttribute("user_Pro");
		session.setAttribute("user_Pro", new_Fi_Code);
		return "redirect:/mypage/profileEdit?ua_UCode=" + user_Code;
	}
	
	//공인중개사 인증 업로드 컨트롤러
	@PostMapping(value="/confirm")
	public String Confirm(HttpServletResponse response, HttpServletRequest request, MultipartHttpServletRequest request2) {
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
			//로컬에 이미지 저장
			int res2 = mypageService.saveLocalConfirm(user_Code, file, request);
			if(res2>0) {
				System.out.println("로컬에 자격증 이미지 저장 성공");
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
			}else {
				System.out.println("로컬에 자격증 이미지 저장 실패");
				alertAndGo(response, "이미지 저장 실패");
			};
			
			
		} else {
			int co_Fcode = MyConfirm.getCo_FCode();
			// 업로드 된 이미지를 로컬에 저장하는 코드
			int res2 = mypageService.saveLocalConfirm(user_Code, file, request);
			if(res2>0) {
				System.out.println("로컬에 자격증 이미지 저장 성공");
				// File DB에 Fi_Nm 업데이트
				int res1 = mypageService.FileUpdate(user_Code, ext, co_Fcode);
				if(res1>0) {
					System.out.println("FI_NM 수정 성공");
				}else {
					System.out.println("FI_NM 수정 실패");
				}
				
			}else {
				System.out.println("로컬에 자격증 이미지 저장 실패");
				alertAndGo(response, "이미지 저장 실패");
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

		// 자기소개 수정
		int res = 0;
		res = mypageService.DescUpdate(description, code);
		if (res > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}

		return "redirect:/mypage/me";
	}
	
	
	@RequestMapping(value = "/descDelete", method = RequestMethod.POST)
	public String selectUserInfo(HttpServletRequest request, int code) {
		
		// 자기소개 수정
		int res = 0;
		res = mypageService.DeleteMyDesc(code);
		if (res > 0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		
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
		
		if(user_Pro != 0) {
			FileDto ProfileFile = mypageService.SelectConfirmFile(user_Pro);
			if(ProfileFile == null) {
				model.addAttribute("Pro_Fi_Nm", "/images/importToJsp/profile_default.jpg");
			}else {
				model.addAttribute("Pro_Fi_Nm", ProfileFile.getFi_Nm());
			}
		}
		
		model.addAttribute("dto", user);

		return "profileEdit";
	}

	@GetMapping("/history")
	public String history(Model model, HttpServletRequest request, Criteria cri) {
		HttpSession session = request.getSession();
		
		Criteria cri2 = new Criteria();
		cri2.setPage(cri.getSub_page());
		
		int ucode = (int)session.getAttribute("user_Code");
		
		int historyReqListCnt = mypageService.historyReqListCnt(ucode);
		int historyPerListCnt = mypageService.historyPerListCnt(ucode);
		
		// 페이징 객체
		Paging paging1 = new Paging();
		Paging paging2 = new Paging();
		
		cri.setPerPageNum(4);
		cri2.setPerPageNum(4);
		
		paging1.setCri(cri);
		paging2.setCri(cri2);
		paging1.setTotalCount(historyReqListCnt);
		paging2.setTotalCount(historyPerListCnt);
		
		
		//나의 요청
		List<MypageFinishlistDto> myReqList = mypageService.SelectMyRequest(ucode, cri);
		
		//나의 수행
		List<MypageFinishlistDto> myPerformList = mypageService.SelectMyPerform(ucode, cri2);
		
//		System.out.println(myReqList);
		
		model.addAttribute("Request", myReqList);
		model.addAttribute("Perform", myPerformList);
		
		model.addAttribute("paging1", paging1);
		model.addAttribute("paging2", paging2);
	
//		System.out.println("Req 게시글 수 : " + historyReqListCnt);
//		System.out.println("Per 게시글 수 : " + historyPerListCnt);
//		System.out.println(paging1);
//		System.out.println(paging2);
		
		return "history";
	
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
			String ua_DAddr, double ua_Lat, double ua_Lng) {

		UserAddressDto user = mypageService.SelectAddr(ua_UCode);
		if (user == null) {
			registService.AddressJoin(dto);
			UserAddressDto users = mypageService.SelectAddr(ua_UCode);
			model.addAttribute("dto", users);
		} else {
			mypageService.AddrChange(ua_Post, ua_Addr, ua_DAddr, ua_UCode, ua_Lat, ua_Lng);
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
	
	//화면에 alert 창 띄우기
	public static void alertAndGo(HttpServletResponse response, String msg) {
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			w.write("<script>alert('"+msg+"');history.go(-1);</script>");
			w.flush();
			w.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
