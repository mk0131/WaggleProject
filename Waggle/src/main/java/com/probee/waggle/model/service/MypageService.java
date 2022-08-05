package com.probee.waggle.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.probee.waggle.model.dto.ConfirmDto;
import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.MypageOtherDto;
import com.probee.waggle.model.dto.MypageUsageDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;

public interface MypageService {
	
	public MypageOtherDto SelectUsersInfo(int ucode); 
	
	public int DescUpdate(String description, int code);
	
	public String SelectDesc(int code);
	
	public List<MypageFinishlistDto> SelectReqRoom(String stat, int ucode);
	
	public List<FileDto> SelectLastFiCode();
	
	public int ImageFileInsert(int fi_Code, String ext);
	
	public int UserProChange(int user_Pro, int ucode);
	
	public UserAddressDto SelectAddr(int ua_UCode);

	// 페이징 카운트
	public int historyReqListCnt(int ucode);
	public int historyPerListCnt(int ucode);

	public List<MypageFinishlistDto> SelectMyRequest(int ucode, Criteria cri);
	public List<MypageFinishlistDto> SelectMyPerform(int ucode, Criteria cri);
	
	
	public int PwChange(String user_Pw, int user_Code);
	
	public int EmailChange(String user_Email, int user_Code);
	
	public int NmChange(String user_Nm, int user_Code);
	
	public int AgeChange(int user_Age, int user_Code);
	
	public int AddrChange(String ua_Post, String ua_Addr, String ua_DAddr, int ua_UCode, double ua_Lat, double ua_Lng);
	
	public int GenderChange(String user_Gender, int user_Code);
	
	public MypageUsageDto reqCancel(int ucode);
	public MypageUsageDto reqFinish(int ucode);
	public MypageUsageDto reqTotal(int ucode);
	public MypageUsageDto resFinish(int ucode);
	public MypageUsageDto resCancel(int ucode);
	public MypageUsageDto resCancelZero(int ucode);
	public MypageUsageDto resTotal(int ucode);
	
	public MypageUsageDto reqCancel3M(int ucode);
	public MypageUsageDto reqFinish3M(int ucode);
	public MypageUsageDto reqTotal3M(int ucode);
	public MypageUsageDto resFinish3M(int ucode);
	public MypageUsageDto resCancel3M(int ucode);
	public MypageUsageDto resCancelZero3M(int ucode);
	public MypageUsageDto resTotal3M(int ucode);
	
	public int saveLocalProfile(int new_Fi_Code, MultipartFile file, HttpServletRequest request);
	
	public ConfirmDto SelectMyConfirm(int ucode);
	
	public int saveLocalConfirm(int user_Code, MultipartFile file, HttpServletRequest request);
	
	public int FileUpdate(int ucode, String ext, int fi_code);
	
	public int InsertFileConfirm(int new_fi_Code, int ucode, String ext);
	
	public int InsertConfirm(int ucode, int new_fi_Code);
	
	public FileDto SelectConfirmFile(int fi_code);
	
	public UsersDto SelectMyInfo(int ucode);
	
	public int DeleteMyDesc(int ucode);
}
