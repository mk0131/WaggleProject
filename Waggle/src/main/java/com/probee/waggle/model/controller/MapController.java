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
import com.probee.waggle.model.service.MapService;


@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;

	/*
	@GetMapping("/map")
	public String selectList(Model model) {
		List<MapDto> list = mapService.selectList();
		model.addAttribute("list", list);
		return "map";
	
	}
	*/
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	@ResponseBody
	public List<MapDto> selectList(String search_post) {
		List<MapDto> searchlist = mapService.selectSearchList(search_post);
		
		return searchlist;
		
	}
	
	
}
