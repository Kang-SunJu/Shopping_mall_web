package com.hanul.smart;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller @SessionAttributes({"appTitle", "category"})
public class NoticeController {
	
	
	//set구성
	@RequestMapping("/buy.no")
	public String buy() {
		return"notice/buy";
	}
	
	//머랭쿠키 상품안내
	@RequestMapping("/mrdetail.no")
	public String mrdetail() {
		return "notice/mrdetail";
	}
	
	//다쿠아즈 상품안내
	@RequestMapping("/dakudetail.no")
	public String dakudetail() {
		return "notice/dakudetail";
	}
	
	//초코파이 상품안내
	@RequestMapping("/chokodetail.no")
	public String chokodetail(Model model) {
		model.addAttribute("appTitle", "상품안내 - ");
		model.addAttribute("category", "no");
		
		return "notice/chokodetail";
	}
	
}
