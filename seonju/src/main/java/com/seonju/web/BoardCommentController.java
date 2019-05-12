package com.hanul.smart;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.service.BoardCommentService;
import board.vo.BoardCommentVO;
import member.vo.MemberVO;

@Controller
public class BoardCommentController {
	
	//댓글삭제처리 요청
	@ResponseBody @RequestMapping("/board/comment/delete/{id}/{subject}")
	public void delete(@PathVariable int id,@PathVariable String subject) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("subject", subject);
		service.delete(map);
	}
	
	//댓글변경저장처리 요청
	@ResponseBody @RequestMapping(value="/board/comment/update",
					produces="application/text; charset=utf-8")
	public String update(@RequestBody BoardCommentVO vo) {
		return service.update(vo) ? "성공" : "실패";
	}
	
	//댓글목록조회처리 요청
	@RequestMapping("/board/comment/{pid}/{subject}")
	public String list(@PathVariable String pid, Model model, @PathVariable String subject) {
		//해당 원글에 대한 댓글을 DB에서 조회한 후
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pid", pid);
		map.put("subject", subject);
		
		model.addAttribute("subject", subject);
		model.addAttribute( "list", service.list(map) );
		//화면에 출력
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		
		return "board/comment/list";
	}
	
	
	
	//댓글저장처리요청
	@ResponseBody @RequestMapping("/board/comment/insert")
	public boolean insert(@RequestParam String content,
						@RequestParam int pid,
						@RequestParam String subject,
						HttpSession ss) {
		//화면에서 입력한 정보를 DB에 저장처리한 후
		HashMap<String, Object> map
			= new HashMap<String, Object>();
		map.put("content", content);
		map.put("pid", pid);
		map.put("userid", 
				((MemberVO)ss.getAttribute("login_info")).getUserid() );
		map.put("subject", subject);
		return service.insert(map);
	}
	
	@Autowired private BoardCommentService service;
	
	
}
