package com.probee.waggle.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.PointsDto;
import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.dto.ResultDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UserRatingDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.dto.UsersDto2;

public interface BoardService {

	public List<RequestDto2> selectList(Criteria cri);
	public RequestDto2 selectRequest(int req_No);
	public int updateFCode(int req_No, int req_FCode);
	public int insertRequest(RequestDto2 dto);
	public ResultDto selectResult(int req_No);
	public List<UsersDto2> FindVol(int vo_No);
	public UsersDto selectUser(int user_Code);
	public String crawlImgUrl(String url);
	public int saveImg(String img_url, String path);
	public List<UserRatingDto> selectUserRating(int req_No);
	public int CreateRes(int res_No, int res_UCode);
	public int Progress(int req_No);
	public List<FileDto> selectResultFile(int res_Code);

	public int Cancel(int req_No);
	public int Recruit(int req_No);
	public int Revoke(int req_No);
	public int complete(int req_No);
	public int confirm(int req_No);

	public int updateRequest(RequestDto2 dto);
	public int selectLastRequestNo();
	
	public int insertRatingBee(UserRatingDto userRating_dto);
	public int insertReRatingBee(UserRatingDto userRating_dto);
	
	public List<PointsDto> selectPoint(int req_No, int user_Code);
	
	public int saveLocal(int req_No, List<MultipartFile> files, int res_Code, HttpServletRequest request);
	public int updateResult(ResultDto dto);

	public int boardListCnt();
	
	public UserAddressDto selectUserAddr(int ua_Ucode);
	
	public int updateResultWDate(int res_Code);
	
	public int updateUserGrade(int user_Code, int user_Grade);
}
