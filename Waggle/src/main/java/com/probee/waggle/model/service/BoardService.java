package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.RequestDto;
import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.dto.ResultDto;
import com.probee.waggle.model.dto.UserRatingDto;
import com.probee.waggle.model.dto.UsersDto;

public interface BoardService {

	public List<RequestDto2> selectList();
	public RequestDto2 selectRequest(int req_No);
	public int updateFCode(int req_No, int req_FCode);
	public int insertRequest(RequestDto2 dto);
	public ResultDto selectResult(int req_No);
	public List<UsersDto> FindVol(int vo_No);
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

	public int updateRequest(RequestDto2 dto);
	public int selectLastRequestNo();


}
