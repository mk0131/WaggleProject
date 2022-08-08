package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.NoticeDto;

public interface NoticeService {

	public int insert(String no_Type, String no_Title, String no_Content);
	public List<NoticeDto> list();
}
