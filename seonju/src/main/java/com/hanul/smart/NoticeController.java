package com.hanul.smart;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller @SessionAttributes({"appTitle", "category"})
public class NoticeController {
	
	
	//set����
	@RequestMapping("/buy.no")
	public String buy() {
		return"notice/buy";
	}
	
	//�ӷ���Ű ��ǰ�ȳ�
	@RequestMapping("/mrdetail.no")
	public String mrdetail() {
		return "notice/mrdetail";
	}
	
	//������� ��ǰ�ȳ�
	@RequestMapping("/dakudetail.no")
	public String dakudetail() {
		return "notice/dakudetail";
	}
	
	//�������� ��ǰ�ȳ�
	@RequestMapping("/chokodetail.no")
	public String chokodetail(Model model) {
		model.addAttribute("appTitle", "��ǰ�ȳ� - ");
		model.addAttribute("category", "no");
		
		return "notice/chokodetail";
	}
	
}
