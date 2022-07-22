package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;

public interface MypageService {
	
	public UsersDto SelectUsersInfo(int ucode); 
	
	public int DescUpdate(String description, int code);
	
	public String SelectDesc(int code);
	
	public List<MypageFinishlistDto> SelectReqRoom(String stat, int ucode);
	
	public List<FileDto> SelectLastFiCode();
	
	public int ImageFileInsert(int fi_Code);
	
	public int UserProChange(int user_Pro, int ucode);
	
	public UserAddressDto SelectAddr(int ua_UCode);

	public List<MypageFinishlistDto> SelectMyRequest(int ucode);
	
	public List<MypageFinishlistDto> SelectMyPerform(int ucode);
	
	public int PwChange(String user_Pw, int user_Code);
	
	public int EmailChange(String user_Email, int user_Code);
	
	public int NmChange(String user_Nm, int user_Code);
	
	public int AgeChange(int user_Age, int user_Code);
	
	public int AddrChange(String ua_Post, String ua_Addr, String ua_DAddr, int ua_UCode);
	
	public int GenderChange(String user_Gender, int user_Code);

}
