package com.probee.waggle.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.HomeDto;

/*
@Controller
@RequestMapping("/map")
public class MapController {
	@Autowired
	private MapService mapSerivce;
	
	@GetMapping("/")
	public String selectList(Model model) {
		List<HomeDto> list = mapService.selectList();
		model.addAttribute("list", list);
		return "map";
	}

}
*/