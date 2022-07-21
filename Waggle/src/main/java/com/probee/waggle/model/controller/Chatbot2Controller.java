package com.probee.waggle.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.probee.waggle.model.service.ChatbotService;

@RestController
public class Chatbot2Controller {
	
	@Autowired
	ChatbotService chatbotService;
	
    @RequestMapping("/chatbotSend")
    public String chatbotSend(@RequestParam("message") String inputText) {
        String msg = "";
        msg = chatbotService.main(inputText);
        return msg;
    }

}
