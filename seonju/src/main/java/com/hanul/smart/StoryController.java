package com.hanul.smart;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller @SessionAttributes({"category", "appTitle"})
public class StoryController {

	
	// 쑥스소개 청년상인
	@RequestMapping("/youth.main")
	public String youth(){
		
		return "story/youth";
	}
	
	// 쑥스소개 배경
	@RequestMapping("/back.main")
	public String background() {

		return "story/background";
	}

	// 쑥스소개 수상내역
	@RequestMapping("/awards.main")
	public String awards() {

		return "story/awards";
	}

	// 쑥스소개 페이지컨트롤러
	@RequestMapping("/story.main")
	public String main(Model model) {
		model.addAttribute("appTitle", "매장안내 - ");
		model.addAttribute("category", "st");
		return "story/main";
	}

}
