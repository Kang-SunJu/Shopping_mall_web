package com.hanul.smart;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import common.service.CommonService;
import notice.service.NoticeService;
import notice.vo.NoticePageVO;
import notice.vo.NoticeVO;

@Controller @SessionAttributes({"appTitle", "category"})
public class NoticeController {
	
	
	
	
	@Autowired private NoticeService service;
	
	@Autowired private CommonService common;
	
	@Autowired private NoticePageVO page;
	
	
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
