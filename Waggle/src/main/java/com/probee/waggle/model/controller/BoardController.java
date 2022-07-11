package com.probee.waggle.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.RequestDto;
import com.probee.waggle.model.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public String selectList(Model model) {
		List<RequestDto> list = boardService.selectList();
		model.addAttribute("list", list);
		return "board";
	}
}
