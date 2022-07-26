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
	public List<MapDto> selectList(String jibunAddr, String roadAddr) {
		List<MapDto> searchlist = mapService.selectSearchList(jibunAddr, roadAddr);
		System.out.println(jibunAddr);
		System.out.println(roadAddr);
		System.out.println(searchlist);
		
		
		return searchlist;
		
	}
	
	//클릭한 상세주소에 해당하는 결과 파일만 보여줌
	@RequestMapping(value="/clickDAddr", method=RequestMethod.POST)
	@ResponseBody
	public List<MapDto> clickList(String jibunAddr, String roadAddr, String DAddr) {
		List<MapDto> clicklist = mapService.selectClickList(jibunAddr, roadAddr, DAddr);
		return clicklist;
		
	}
	
	
}
