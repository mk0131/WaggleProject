package com.probee.waggle.model.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.probee.waggle.model.component.FileSaver;
import com.probee.waggle.model.dto.ConfirmDto;
import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.MypageOtherDto;
import com.probee.waggle.model.dto.MypageUsageDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageMapper mypageMapper;
	
	@Autowired
	FileSaver fileSaver;
	
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


	// 페이징
	@Override
	public int historyReqListCnt(int ucode) {
		return mypageMapper.historyReqListCnt(ucode);
	}

	@Override
	public int historyPerListCnt(int ucode) {
		return mypageMapper.historyPerListCnt(ucode);
	}
	

	public List<MypageFinishlistDto> SelectMyRequest(int ucode, Criteria cri) {
		return mypageMapper.SelectMyRequest(ucode, cri);
	}

	@Override
	public List<MypageFinishlistDto> SelectMyPerform(int ucode, Criteria cri) {
		return mypageMapper.SelectMyPerform(ucode, cri);
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
	public int AddrChange(String ua_Post, String ua_Addr, String ua_DAddr, int ua_UCode, double ua_Lat, double ua_Lng) {
		return mypageMapper.AddrChange(ua_Post, ua_Addr, ua_DAddr, ua_UCode, ua_Lat, ua_Lng);
	}

	@Override
	public int GenderChange(String user_Gender, int user_Code) {
		return mypageMapper.GenderChange(user_Gender, user_Code);
	}

	@Override
	public int ImageFileInsert(int fi_Code, String ext) {
		return mypageMapper.ImageFileInsert(fi_Code, ext);
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
	public MypageOtherDto SelectUsersInfo(int ucode) {
		return mypageMapper.SelectUsersInfo(ucode);
	}

	@Override
	public MypageUsageDto reqCancel(int ucode) {
		return mypageMapper.reqCancel(ucode);
	}

	@Override
	public MypageUsageDto reqTotal(int ucode) {
		return mypageMapper.reqTotal(ucode);
	}

	@Override
	public MypageUsageDto resCancel(int ucode) {
		return mypageMapper.resCancel(ucode);
	}

	@Override
	public MypageUsageDto resTotal(int ucode) {
		return mypageMapper.resTotal(ucode);
	}

	@Override
	public int saveLocalProfile(int new_Fi_Code, MultipartFile file, HttpServletRequest request) {
		String pro_saveLocal;
		
		if(file.getSize()==0) {
			System.out.println("저장할 파일이 없습니다.");
			return 0;
		}
		
		try {
			pro_saveLocal = fileSaver.saveLocalProfile(file, new_Fi_Code, request);
			System.out.println("파일 저장 성공");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일 저장 실패...");
			return 0;
		}
		
		return 1;
	}

	@Override
	public ConfirmDto SelectMyConfirm(int ucode) {
		return mypageMapper.SelectMyConfirm(ucode);
	}

	@Override
	public int saveLocalConfirm(int user_Code, MultipartFile file, HttpServletRequest request) {
		String con_saveLocal;
		if(file.getSize()==0) {
			System.out.println("저장할 파일이 없습니다.");
			return 0;
		}
		
		try {
			con_saveLocal = fileSaver.saveLocalConfirm(file, user_Code, request);
			System.out.println("파일 저장 성공");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일 저장 실패...");
			return 0;
		}
		return 1;
	}

	@Override
	public int FileUpdate(int ucode, String ext, int fi_code) {
		return mypageMapper.FileUpdate(ucode, ext, fi_code);
	}

	@Override
	public int InsertFileConfirm(int new_fi_Code, int ucode, String ext) {
		return mypageMapper.InsertFileConfirm(new_fi_Code, ucode, ext);
	}

	@Override
	public int InsertConfirm(int ucode, int new_fi_Code) {
		return mypageMapper.InsertConfirm(ucode, new_fi_Code);
	}

	@Override
	public FileDto SelectConfirmFile(int fi_code) {
		return mypageMapper.SelectConfirmFile(fi_code);
	}

	@Override
	public UsersDto SelectMyInfo(int ucode) {
		return mypageMapper.SelectMyInfo(ucode);
	}

	@Override
	public int DeleteMyDesc(int ucode) {
		return mypageMapper.DeleteMyDesc(ucode);
	}

	@Override
	public MypageUsageDto reqFinish(int ucode) {
		return mypageMapper.reqFinish(ucode);
	}

	@Override
	public MypageUsageDto resFinish(int ucode) {
		return mypageMapper.resFinish(ucode);
	}

	@Override
	public MypageUsageDto reqCancel3M(int ucode) {
		return mypageMapper.reqCancel3M(ucode);
	}

	@Override
	public MypageUsageDto reqFinish3M(int ucode) {
		return mypageMapper.reqFinish3M(ucode);
	}

	@Override
	public MypageUsageDto reqTotal3M(int ucode) {
		return mypageMapper.reqTotal3M(ucode);
	}

	@Override
	public MypageUsageDto resFinish3M(int ucode) {
		return mypageMapper.resFinish3M(ucode);
	}

	@Override
	public MypageUsageDto resCancel3M(int ucode) {
		return mypageMapper.resCancel3M(ucode);
	}

	@Override
	public MypageUsageDto resTotal3M(int ucode) {
		return mypageMapper.resTotal3M(ucode);
	}

	@Override
	public MypageUsageDto resCancelZero(int ucode) {
		return mypageMapper.resCancelZero(ucode);
	}

	@Override
	public MypageUsageDto resCancelZero3M(int ucode) {
		return mypageMapper.resCancelZero3M(ucode);
	}
	
	

}
