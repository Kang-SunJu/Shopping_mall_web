package com.hanul.smart;

import java.io.File;

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


import common.service.CommonService;
import cs.service.CsService;
import cs.vo.CsPageVO;
import cs.vo.CsVO;
import member.vo.MemberVO;

@Controller @SessionAttributes({"category", "appTitle"})
public class CsController {
	
	//다운로드요청
		@ResponseBody @RequestMapping("/download.qu")
		public File download(@RequestParam int id,
							@RequestParam String subject,
								HttpSession session,
								HttpServletResponse response) {
			//해당id의 첨부파일정보를 DB에서 조회해와
			//다운로드한다.
			CsVO vo = service.detail(id,subject);
			return common.download(vo.getFilepath(), 
							vo.getFilename(), 
							session, response);
		}
		
		//게시글변경저장처리 요청
		@RequestMapping("/update.qu")
		public String update(CsVO vo, RedirectAttributes redirect,
				@RequestParam String subject,
					@RequestParam MultipartFile file, HttpSession ss,
					@RequestParam String delete) {
			vo.setFilename("");
			vo.setFilepath("");
			
			CsVO cs = service.detail(vo.getId(),subject);
			String uuid = ss.getServletContext().getRealPath("resources")
							+ cs.getFilepath();
			
			if( file.getSize()>0 ) {
				vo.setFilename( file.getOriginalFilename() );
				vo.setFilepath( common.upload("cs", file, ss) );
				
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
					if( cs.getFilename()!=null )
						vo.setFilename( cs.getFilename() );
					if( cs.getFilepath()!=null )
						vo.setFilepath( cs.getFilepath() );
				}
			}
			
			//화면에서 변경입력한 정보를 DB에 저장한 후 
			service.update(vo,subject);
			//상세화면으로 연결
			//redirect 방식으로 데이터를 보이지 않게 전송하려면
			redirect.addFlashAttribute("id", vo.getId());
			redirect.addFlashAttribute("subject", subject);
			return "redirect:detail.qu";
		}
		
		//게시글상세화면 요청
		@RequestMapping("/detail.qu")
		public String detail(@ModelAttribute("id") int id , @ModelAttribute("subject") String subject , Model model) {
			//해당 id의 글정보를 DB에서 조회한 후
			//상세화면으로 연결하여 데이터를 출력
			model.addAttribute("vo", service.detail(id,subject));
			model.addAttribute("crlf", "\r\n");
			model.addAttribute("page", page);
			
			return "cs/detail";
		}
			
		//게시글변경화면 요청
		@RequestMapping("/modify.qu")
		public String modify(@RequestParam int id, Model model, @ModelAttribute("subject") String subject) {
			//해당 글의 정보를 DB에서 조회해와
			//변경화면에 출력
			model.addAttribute("vo", service.detail(id,subject)); 
			return "cs/modify";
		}
		
		
		//게시글 삭제처리
		@RequestMapping("/delete.qu")
		public String delete(@RequestParam int id, @ModelAttribute("subject") String subject) {
			
			service.delete(id,subject);
			
			return "redirect:list.qu";
		}
		
		@Autowired private CommonService common;
		
		//신규게시글저장처리 요청
		@RequestMapping("/insert.qu")
		public String insert(@ModelAttribute("subject") String subject, CsVO vo, HttpSession session,
					@RequestParam MultipartFile file) {
			vo.setFilename("");
			vo.setFilepath("");
			if( file.getSize()>0 ) {
				vo.setFilename(file.getOriginalFilename());
				vo.setFilepath( common.upload(subject, file, session) );
			}
			//화면에서 입력한 정보를 DB에 저장한 후
			vo.setUserid( 
					((MemberVO)session.getAttribute("login_info"))
						.getUserid() );
			service.insert(vo,subject);
			//목록화면으로 연결
			return "redirect:list.qu";
		}
		
		//신규게시글작성화면 요청
		@RequestMapping("/new.qu")
		public String board(@ModelAttribute("subject") String subject) {
			return "cs/new";
		}
		
		@Autowired private CsPageVO page;
		@Autowired private CsService service;
		
		//게시글목록화면 요청
		@RequestMapping("/list.qu")
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
			
			model.addAttribute( "page", service.list(page,subject) );
			model.addAttribute( "subject", subject );
			
			return "cs/list";
		}
	
	
	@RequestMapping("/cs.qu")
	public String cs(){
		
		return "cs/cs";
	}
}
