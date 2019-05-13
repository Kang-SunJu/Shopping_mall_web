package com.seonju.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import home.service.HomeService;
import home.vo.HomeMainSlideVO;
import home.vo.HomeMenuSlideVO;
import home.vo.HomeVO;
import home.vo.HomeVideoVO;


@Controller @SessionAttributes({"appTitle", "category"})
public class HomeController {
	@Autowired private HomeService service;
	@Autowired private HomeVO vo;
	@Autowired private HomeMenuSlideVO menuVo;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("category", "");
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("appTitle", "건강한 디저트" );
		
		// 메인화면 요청시 해당 메서드를 통해 작동하기 때문에 
		//DB에서 공지사항 조회해온 뒤 출력
		List<HomeVO> list = service.list();
		model.addAttribute("list", list );
		
		// DB에서 메뉴 슬라이드 조회해온 뒤 출력
		List<HomeMenuSlideVO> menuSlideList = service.menuSlideList();
		model.addAttribute("menuSlideList", menuSlideList);
		
		List<HomeVideoVO> videoList = service.videoList();
		model.addAttribute("videoList", videoList);
		
		List<HomeMainSlideVO> mainSlideList = service.mainSlideList();
		model.addAttribute("mainSlideList", mainSlideList);
		
		return "home";
	}
	
	@RequestMapping("/error")
	public String error(HttpServletRequest req, Model model) {
		Throwable throwable 
			=(Throwable)req.getAttribute("javax.servlet.error.exception");
		StringBuilder msg = new StringBuilder();
		while( throwable !=null ) {
			msg.append("<p>")
			   .append( throwable.getMessage() )
			   .append("</p>"); 
			throwable = throwable.getCause();
		}
		model.addAttribute("msg", msg.toString());
		int code 
			= (Integer)req.getAttribute(
					"javax.servlet.error.status_code");
		return "error/" 
					+ ( code==404 ? "404" : "default");
	}
	
}
