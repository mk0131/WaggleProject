package com.probee.waggle.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.probee.waggle.model.component.FileSaver;
import com.probee.waggle.model.component.SeleniumCrawler;
import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.PointsDto;
import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.dto.ResultDto;
import com.probee.waggle.model.dto.ResultFileDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UserRatingDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.dto.UsersDto2;
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
	public List<RequestDto2> selectList(Criteria cri) {
		return boardMapper.selectList(cri);
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
			List<FileDto> tmp_list = fileMapper.selectFile(path);
			int fi_code = tmp_list.get(tmp_list.size()-1).getFi_Code();
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
	public List<UsersDto2> FindVol(int vo_No) {
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
	
	@Override
	public int complete(int req_No) {
		return boardMapper.complete(req_No);
	}
	
	@Override
	public int confirm(int req_No) {
		return boardMapper.confirm(req_No);
	}
	
	@Override
	public int updateRequest(RequestDto2 dto) {
		return boardMapper.updateRequest(dto);
	}
	
	@Override
	public int selectLastRequestNo() {
		return boardMapper.selectLastRequestNo();

	}

	@Override
	public int insertRatingBee(UserRatingDto userRating_dto) {
		return boardMapper.insertRatingBee(userRating_dto);
	}
	
	@Override
	public int insertReRatingBee(UserRatingDto userRating_dto) {
		return boardMapper.insertReRatingBee(userRating_dto);
	}

	@Override
	public List<PointsDto> selectPoint(int req_No, int user_Code) {
		return boardMapper.selectPoint(req_No, user_Code);
	}

	@Override
	public int saveLocal(int req_No, List<MultipartFile> files, int res_Code, HttpServletRequest request) {
		List<Integer> fileCodes = new ArrayList<Integer>();
		List<String> res_saveLocal = new ArrayList<String>();
		
		if(files.size() == 1 && files.get(0).getSize()==0) {
			System.out.println("저장할 파일이 없습니다.");
			fileMapper.deleteResultFile(res_Code);
			return 0;
		}
		
		// 이미지 동영상 로컬 저장
		try {
			res_saveLocal = fileSaver.saveLocal(files, req_No, request);
			System.out.println("파일 저장 성공");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일 저장 실패...");
			return 0;
		}
		
		// return 된 path list를 통해 File DB에 데이터 추가
		for(String fi_nm: res_saveLocal) {
			FileDto fi_dto = new FileDto();
			
			fi_dto.setFi_Nm(fi_nm);
			
			int pos = fi_nm.lastIndexOf(".");
			String ext = fi_nm.substring(pos + 1);

			if(ext.equals("mp4") || ext.equals("avi")) {
				fi_dto.setFi_Type("video");				
			} else {
				fi_dto.setFi_Type("img");
			}
			// DB 저장
			fileMapper.insertFile(fi_dto);
			
			// DB에서 파일코드 가져오기
			List<FileDto> tmp_list = fileMapper.selectFile(fi_nm);
			FileDto tmp_dto = tmp_list.get(tmp_list.size()-1);
			fileCodes.add(tmp_dto.getFi_Code());
		}
		// ResultFile DB 데이터 추가전에 관련 사진 없애기
		fileMapper.deleteResultFile(res_Code);
		
		// 파일코드와 탐색결과 코드를 통해 ResultFile DB 데이터 추가
		for(int file_code: fileCodes) {
			ResultFileDto rf_dto = new ResultFileDto(file_code, res_Code);
			fileMapper.insertResultFile(rf_dto);
		}
		
		return 1;
	}

	@Override
	public int updateResult(ResultDto dto) {
		return boardMapper.updateResult(dto);
	}
	
	@Override
	public int boardListCnt() {
		return boardMapper.boardListCnt();
	}

	@Override
	public UserAddressDto selectUserAddr(int ua_Ucode) {
		return boardMapper.selectUserAddr(ua_Ucode);
	}

	@Override
	public int updateResultWDate(int res_Code) {
		return boardMapper.updateResultWDate(res_Code);
	}

	@Override
	public int updateUserGrade(int user_Code, int user_Grade) {
		return boardMapper.updateUserGrade(user_Code, user_Grade);
	}

}
