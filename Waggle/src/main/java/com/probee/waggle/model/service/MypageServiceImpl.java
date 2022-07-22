package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageMapper mypageMapper;
	
	@Override
	public int DescUpdate(String description, int code) {
		return mypageMapper.DescUpdate(description, code);
	}

	@Override
	public String SelectDesc(int code) {
		return mypageMapper.SelectDesc(code);
	}

	@Override
	public List<MypageFinishlistDto> SelectReqRoom(String stat, int ucode) {
		return mypageMapper.SelectReqRoom(stat, ucode);
	}

	@Override

	public UserAddressDto SelectAddr(int ua_UCode) {
		return mypageMapper.SelectAddr(ua_UCode);
	}


	public List<MypageFinishlistDto> SelectMyRequest(int ucode) {
		return mypageMapper.SelectMyRequest(ucode);
	}

	@Override
	public List<MypageFinishlistDto> SelectMyPerform(int ucode) {
		return mypageMapper.SelectMyPerform(ucode);
	}

	@Override
	public int PwChange(String user_Pw, int user_Code) {
		return mypageMapper.PwChange(user_Pw, user_Code);
	}

	@Override
	public int EmailChange(String user_Email, int user_Code) {
		return mypageMapper.EmailChange(user_Email, user_Code);
	}

	@Override
	public int NmChange(String user_Nm, int user_Code) {
		return mypageMapper.NmChange(user_Nm, user_Code);
	}

	@Override
	public int AgeChange(int user_Age, int user_Code) {
		return mypageMapper.AgeChange(user_Age, user_Code);
	}

	@Override
	public int AddrChange(String ua_Post, String ua_Addr, String ua_DAddr, int ua_UCode) {
		return mypageMapper.AddrChange(ua_Post, ua_Addr, ua_DAddr, ua_UCode);
	}

	@Override
	public int GenderChange(String user_Gender, int user_Code) {
		return mypageMapper.GenderChange(user_Gender, user_Code);
	}

	@Override
	public int ImageFileInsert(int fi_Code) {
		return mypageMapper.ImageFileInsert(fi_Code);
	}

	@Override
	public int UserProChange(int user_Pro, int ucode) {
		return mypageMapper.UserProChange(user_Pro, ucode);
	}

	@Override
	public List<FileDto> SelectLastFiCode() {
		return mypageMapper.SelectLastFiCode();
	}

	@Override
	public UsersDto SelectUsersInfo(int ucode) {
		return mypageMapper.SelectUsersInfo(ucode);
	}
	
	

}
