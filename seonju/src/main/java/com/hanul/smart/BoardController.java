package com.hanul.smart;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.service.BoardService;
import board.vo.BoardPageVO;
import board.vo.BoardVO;
import common.service.CommonService;
import member.vo.MemberVO;

@Controller @SessionAttributes({"category", "appTitle"})
public class BoardController {
	
	//다운로드요청
		@ResponseBody @RequestMapping("/download.bo")
		public File download(@RequestParam int id,
							@RequestParam String subject,
								HttpSession session,
								HttpServletResponse response) {
			//해당id의 첨부파일정보를 DB에서 조회해와
			//다운로드한다.
			
			//id값과 게시판 이름 같이 넣어서보낸다
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("subject", subject);
			BoardVO vo = service.detail(map);
			return common.download(vo.getFilepath(), 
							vo.getFilename(), 
							session, response);
		}
		
		//게시글변경저장처리 요청
		@RequestMapping("/update.bo")
		public String update(BoardVO vo, RedirectAttributes redirect,
					@RequestParam MultipartFile file, HttpSession ss,
					@RequestParam String delete) {
			vo.setFilename("");
			vo.setFilepath("");
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", vo.getId());
			map.put("subject", vo.getSubject());
			BoardVO board = service.detail(map);
			String uuid = ss.getServletContext().getRealPath("resources")
							+ board.getFilepath();
			
			if( file.getSize()>0 ) {
				vo.setFilename( file.getOriginalFilename() );
				vo.setFilepath( common.upload(vo.getSubject(), file, ss) );
				
				//원래 첨부된 파일이 있었다면 삭제
				File f = new File( uuid );
				if( f.exists() ) f.delete();
			}else {
				if( delete.equals("y") ) {
					//원래 첨부된 파일 있었는데 삭제하는 경우
					File f = new File( uuid );
					if( f.exists() ) f.delete();
				}else {
					//원래 첨부된 파일 있었고 그걸 그대로 사용하는 경우
					if( board.getFilename()!=null )
						vo.setFilename( board.getFilename() );
					if( board.getFilepath()!=null )
						vo.setFilepath( board.getFilepath() );
				}
			}
			
			//화면에서 변경입력한 정보를 DB에 저장한 후 
			service.update(vo);
			//상세화면으로 연결
			//redirect 방식으로 데이터를 보이지 않게 전송하려면
			redirect.addFlashAttribute("id", vo.getId());
			redirect.addFlashAttribute("subject", vo.getSubject());
			return "redirect:detail.bo";
		}
		
		//게시글상세화면 요청
		@RequestMapping("/detail.bo")
		public String detail(@ModelAttribute("id") int id , @ModelAttribute("subject") String subject , Model model) {
			//해당 id의 글정보를 DB에서 조회한 후
			//상세화면으로 연결하여 데이터를 출력
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("subject", subject);
			model.addAttribute("vo", service.detail(map));
			model.addAttribute("crlf", "\r\n");
			model.addAttribute("page", page);
			
			return "board/detail";
		}
			
		//게시글변경화면 요청
		@RequestMapping("/modify.bo")
		public String modify(@RequestParam int id, Model model, @ModelAttribute("subject") String subject) {
			//해당 글의 정보를 DB에서 조회해와
			//변경화면에 출력
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("subject", subject);
			model.addAttribute("vo", service.detail(map)); 
			return "board/modify";
		}
		
		
		//게시글 삭제처리
		@RequestMapping("/delete.bo")
		public String delete(@RequestParam int id, @ModelAttribute("subject") String subject) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("subject", subject);
			service.delete(map);
			
			return "redirect:list.bo";
		}
		
		@Autowired private CommonService common;
		
		//신규게시글저장처리 요청
		@RequestMapping("/insert.bo")
		public String insert(BoardVO vo, HttpSession session,
					@RequestParam MultipartFile file, Model model) {
			vo.setFilename("");
			vo.setFilepath("");
			if( file.getSize()>0 ) {
				vo.setFilename(file.getOriginalFilename());
				vo.setFilepath( common.upload(vo.getSubject(), file, session) );
			}
			//화면에서 입력한 정보를 DB에 저장한 후
			vo.setUserid( 
					((MemberVO)session.getAttribute("login_info"))
						.getUserid() );
			service.insert(vo);
			//목록화면으로 연결
			model.addAttribute("subject", vo.getSubject());
			return "redirect:list.bo";
		}
		
		//신규게시글작성화면 요청
		@RequestMapping("/new.bo")
		public String board(@ModelAttribute("subject") String subject) {
			return "board/new";
		}
		
		@Autowired private BoardPageVO page;
		@Autowired private BoardService service;
		
		//게시글목록화면 요청
		@RequestMapping("/list.bo")
		public String list(Model model, 
				@RequestParam(defaultValue="cs") String subject,
				@RequestParam(defaultValue="1") int curPage,
				@RequestParam(required=false) String search, 
				@RequestParam(defaultValue="") String keyword) {
			
			
			model.addAttribute("appTitle", "게시글-");
			model.addAttribute("category", "qu");
			//DB에서 게시글목록을 조회해와 화면에 출력

			page.setCurPage(curPage);
			page.setSearch(keyword.isEmpty() ? "" : search);
			page.setKeyword(keyword);
			
			page.setSubject(subject);
			
			model.addAttribute( "page", service.list(page) );
			model.addAttribute( "subject", subject );
			
			return "board/list";
		}
	
	
	@RequestMapping("/board.bo")
	public String board(){
		
		return "board/board";
	}
}
