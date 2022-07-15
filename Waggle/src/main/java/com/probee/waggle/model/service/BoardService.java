package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.RequestDto;
import com.probee.waggle.model.dto.RequestDto2;

public interface BoardService {

	public List<RequestDto2> selectList();
	public RequestDto selectRequest(RequestDto dto);
	public int insertRequest(RequestDto2 dto);
	public int deleteRequest(RequestDto dto);
	public int updateRequest(RequestDto dto);

}
