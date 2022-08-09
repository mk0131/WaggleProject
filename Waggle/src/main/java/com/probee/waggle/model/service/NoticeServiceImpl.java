package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.NoticeDto;
import com.probee.waggle.model.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeMapper noticeMapper;

	@Override
	public int insert(String no_Type, String no_Title, String no_Content) {
		return noticeMapper.insert(no_Type, no_Title, no_Content);
	}

	@Override
	public List<NoticeDto> list() {
		return noticeMapper.list();
	}

}
