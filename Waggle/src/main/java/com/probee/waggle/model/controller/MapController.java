package com.probee.waggle.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.probee.waggle.model.dto.MapDto;
import com.probee.waggle.model.service.MapService;


@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@GetMapping("/map")
	public String selectList(Model model, String search_post) {
		List<MapDto> list = mapService.selectList();
		model.addAttribute("list", list);
		model.addAttribute("search_post", search_post);
		return "map";
	}

}

01234
02345
03456


02345