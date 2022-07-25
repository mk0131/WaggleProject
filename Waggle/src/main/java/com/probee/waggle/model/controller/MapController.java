package com.probee.waggle.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probee.waggle.model.dto.MapDto;
import com.probee.waggle.model.dto.MapUserInfoDto;
import com.probee.waggle.model.service.MapService;


@Controller
@RequestMapping("/map")
public class MapController {
	
	@Autowired
	private MapService mapService;

	
	@GetMapping("/user")
	public String selectList(Model model) {
		List<MapUserInfoDto> list = mapService.selectUserAddress();
		model.addAttribute("uaddr", list);
		return "map";
	}
	
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	@ResponseBody
	public List<MapDto> selectList(String search_post) {
		List<MapDto> searchlist = mapService.selectSearchList(search_post);
		
		return searchlist;
		
	}
	
	//클릭한 상세주소에 해당하는 결과 파일만 보여줌
	@RequestMapping(value="/clickDAddr", method=RequestMethod.POST)
	@ResponseBody
	public List<MapDto> clickList(String search_post, String DAddr) {
		List<MapDto> clicklist = mapService.selectClickList(search_post, DAddr);
		return clicklist;
		
	}
	
	
}
