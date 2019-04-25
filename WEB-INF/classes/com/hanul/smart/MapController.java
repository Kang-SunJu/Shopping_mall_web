package com.hanul.smart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import map.service.MapService;
import map.vo.MapVO;


@Controller @SessionAttributes({"appTitle", "category"})
public class MapController {
	@Autowired private MapService service;
	@Autowired private MapVO vo;
	
	//���� ȭ�� ��û
	@RequestMapping("/list.mp")
	public String mapList(Model model) {
		model.addAttribute("appTitle", "����ȳ� - ");
		model.addAttribute("category", "mp");
		
		List<MapVO> mapList = service.mapList();
		model.addAttribute("mapList", mapList);
		
		return "map/list";
	}
}
