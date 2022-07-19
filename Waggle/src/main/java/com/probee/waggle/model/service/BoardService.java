package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.RequestDto;
import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.dto.ResultDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.dto.VolunteerDto;

public interface BoardService {

	public List<RequestDto2> selectList();
	public RequestDto2 selectRequest(int req_No);
	public int insertRequest(RequestDto2 dto);
	public int deleteRequest(RequestDto dto);
	public int updateRequest(RequestDto dto);
	public ResultDto selectResult(int res_No);
	public List<VolunteerDto> selectVolunteer(int req_No);
	public List<UsersDto> selectUsers(List<String> code_list);

}
