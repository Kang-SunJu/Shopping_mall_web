package com.hanul.smart;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller @SessionAttributes({"category", "appTitle"})
public class StoryController {

	
	// �����Ұ� û�����
	@RequestMapping("/youth.main")
	public String youth(){
		
		return "story/youth";
	}
	
	// �����Ұ� ���
	@RequestMapping("/back.main")
	public String background() {

		return "story/background";
	}

	// �����Ұ� ���󳻿�
	@RequestMapping("/awards.main")
	public String awards() {

		return "story/awards";
	}

	// �����Ұ� ��������Ʈ�ѷ�
	@RequestMapping("/story.main")
	public String main(Model model) {
		model.addAttribute("appTitle", "����ȳ� - ");
		model.addAttribute("category", "st");
		return "story/main";
	}

}
