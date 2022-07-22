package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.component.FileSaver;
import com.probee.waggle.model.component.SeleniumCrawler;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.RequestDto;
import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.dto.ResultDto;
import com.probee.waggle.model.dto.UserRatingDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.dto.VolunteerDto;
import com.probee.waggle.model.mapper.BoardMapper;
import com.probee.waggle.model.mapper.FileMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	FileMapper fileMapper;
	
	@Autowired
	SeleniumCrawler seleniumCrawler;
	
	@Autowired
	FileSaver fileSaver;
	
	@Override
	public List<RequestDto2> selectList() {
		return boardMapper.selectList();
	}

	@Override
	public RequestDto2 selectRequest(int req_No) {
		return boardMapper.selectRequest(req_No);
	}

	@Override
	public int insertRequest(RequestDto2 dto) {
		return boardMapper.insertRequest(dto);
	}

	@Override
	public ResultDto selectResult(int req_No) {
		return boardMapper.selectResult(req_No);
	}

	@Override
	public UsersDto selectUser(int user_Code) {
		return boardMapper.selectUser(user_Code);
	}

	@Override
	public String crawlImgUrl(String url) {
		return seleniumCrawler.GetImgUrl(url);
	}

	@Override
	public int saveImg(String img_url, String path) {
		// url to 이미지 & 로컬에 저장
		int res1 = fileSaver.saveCrawlImg(img_url, path);
		
		if(res1 == 0) {
			System.out.println("url 이미지로 저장 실패");
			return 0;
		}
		// File DB에 이미지 경로 저장 및 file code 리턴
		FileDto dto = new FileDto();
		dto.setFi_Nm(path);
		dto.setFi_Type("img");
		int res2 = fileMapper.insertFile(dto);
		
		if(res2 > 0) {
			System.out.println("이미지 경로 DB 저장 성공!");
			int fi_code = fileMapper.selectFile(path).getFi_Code();
			return fi_code;
		} else {
			System.out.println("이미지 경로 DB 저장 실패");
			return 0;
		}
		
	}

	@Override
	public int updateFCode(int req_No, int req_FCode) {
		return boardMapper.updateFCode(req_No, req_FCode);
	}

	@Override
	public List<UsersDto> FindVol(int vo_No) {
		return boardMapper.FindVol(vo_No);
	}

	@Override
	public List<UserRatingDto> selectUserRating(int req_No) {
		return boardMapper.selectUserRating(req_No);
	}

	@Override	
	public int CreateRes(int res_No, int res_UCode) {
		return boardMapper.CreateRes(res_No, res_UCode);
	}

	@Override
	public int Progress(int req_No) {
		return boardMapper.Progress(req_No);
	}

	@Override
	public List<FileDto> selectResultFile(int res_Code) {
		return boardMapper.selectResultFile(res_Code);
	}

	@Override
	public int Cancel(int req_No) {
		return boardMapper.Cancel(req_No);
	}

	@Override
	public int Recruit(int req_No) {
		return boardMapper.Recruit(req_No);
	}

	@Override
	public int Revoke(int req_No) {
		return boardMapper.Revoke(req_No);
	}

	public int updateRequest(RequestDto2 dto) {
		return boardMapper.updateRequest(dto);
	}
	
	@Override
	public int selectLastRequestNo() {
		return boardMapper.selectLastRequestNo();

	}


}
