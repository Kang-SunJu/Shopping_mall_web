package com.hanul.smart;

import java.util.Random;
import java.util.HashMap;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import common.service.CommonService;
import member.service.MemberService;
import member.vo.MemberVO;

@Controller @SessionAttributes("category")
public class MemberController {
	@Autowired private MemberService service;
	
	//고객정보삭제처리 요청
		@RequestMapping("/delete.mb")
		public String delete(@RequestParam String userid) {
			//선택한 고객정보를 삭제한 후
			service.delete(userid);
			//고객목록화면으로 연결
			return "redirect:list.mb";
		}
	
	//고객목록화면 요청
		@RequestMapping("/list.mb")
		public String list(Model model) {
			model.addAttribute("category", "mb");
			model.addAttribute("appTitle", "고객관리-");
			//DB에서 고객목록정보를 조회해와
			model.addAttribute("list", service.list() );
			//화면에 출력
			return "member/list";
		}
	
	//메인페이지 요청
		@RequestMapping("/home")
		public String home() {
			return"home";
		}
	
	//고객정보변경저장처리 요청
			@RequestMapping("/update")
			public String update(MemberVO vo) {
				//화면에서 변경입력한 정보를 DB에 변경저장한 후
				service.update(vo);
				//상세화면으로 연결
				return "redirect:mypage?userid=" + vo.getUserid();
			}
	
	//고객정보변경화면 요청
			@RequestMapping("/modify")
			public String modify(Model model, @RequestParam String userid) {
				//선택한 고객의 정보를 DB에서 조회해 온 후
				model.addAttribute("vo", service.mypage(userid) );
				//정보변경화면에 출력
				return "member/modify";
			}
	
	//마이페이지 요청
		@RequestMapping("/mypage")
		public String mypage(Model model, @RequestParam String userid) {
			//화면에서 선택한 고객의 정보를 DB에서 조회해와
			model.addAttribute("vo", service.mypage(userid) );
			
			//고객상세정보화면으로 연결
			return "member/mypage";
		}
	
	//로그아웃처리 요청
	@ResponseBody @RequestMapping("/logout")
	public void logout(HttpSession session) {
		//세션에 있는 로그인정보를 삭제한다.
		session.removeAttribute("login_info");
	}
	
	//로그인처리 요청
	@ResponseBody @RequestMapping("/login")
	public boolean login(@RequestParam String userid,
						@RequestParam String userpwd,
						HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpwd", userpwd);
		MemberVO vo = service.select(map);
		//아이디,비번이 일치하는 회원이 DB에 있는지 확인하여
		//일치하는 회원이 있다면 로그인되게 한다.: 로그인정보는 세션에 담는다.
		session.setAttribute("login_info", vo);
		//orderid 에 로그인한 유저의 id를 넣는다.
		session.setAttribute("orderid", userid);
		return vo == null ? false : true;
	}
	
	
	//카카오 로그인 프로필 조회(닉네임만 우선)
	@RequestMapping("/kakaologin")
	public String kakaologin(@RequestParam String name,
						HttpSession session, Model model) {

		//kakaologin 정보에서 닉네임을 vo에 담아서 세션처리해서 메인페이지로 보낸다.
		MemberVO vo = new MemberVO();
		vo.setName(name);
		session.setAttribute("login_info", vo);
		return "redirect:index";
	}
	
	@Autowired private CommonService common;
	
	//회원가입처리 요청
	@ResponseBody @RequestMapping(value="/join", 
						produces="text/html; charset=utf-8")
	public String join(MemberVO vo, HttpSession session) {
		//화면에서 입력한 정보를 DB에 저장한 후
		String msg = "<script type='text/javascript'>";
		if( service.insert(vo) ) {
			common.emailSend(
					vo.getEmail(), vo.getName(), session);
			msg += "alert('회원가입을 축하합니다^^'); location='index'";
		}else {
			msg += "alert('회원가입 실패ㅠㅠ'); history.go(-1)";
		}
		msg += "</script>";
		return msg;
	}
	
	//아이디중복확인 요청
	@ResponseBody @RequestMapping("/id_check")
	public String id_check(@RequestParam String userid) {
		//화면에서 전송된 아이디가 DB에 존재여부를 판단하여
		//그 결과를 화면으로 반환시킨다.
		return String.valueOf( service.id_usable(userid) );
	}
	
	//회원가입화면 요청
	@RequestMapping("/member")
	public String member(Model model) {
		model.addAttribute("category", "");
		return "member/join";
	}
	
	//로그인화면
	@RequestMapping("/logintest.me")
	public String logintest(@RequestParam(required=false)String subject,
							@RequestParam(required=false)String id, Model model) {
		if(subject != null) {
			model.addAttribute("subject", subject);
		}
		if(id != null) {
			model.addAttribute("id", id);
		}
		//model.addAttribute("category", "");
		return "member/logintest";
	}
	
	//회원가입 약관동의화면
	@RequestMapping("/agree")
	public String agreetest() {
		//model.addAttribute("category", "");
		return "member/agree";
	}
	
	@RequestMapping("/find")
	public String find() {
		//model.addAttribute("category", "");
		return "member/find";
	}
	//아이디찾기팝업창
			@RequestMapping("/idfind")
			public String idfind() {
				//model.addAttribute("category", "");
				return "member/idfind";
			}
			//아이디 검색			 
			@RequestMapping(value = "/id_find", method= {RequestMethod.POST, RequestMethod.GET})
			public String idfind(HttpServletResponse response, 
					@RequestParam("user_email1") String user_email1,
					@RequestParam("user_email2") String user_email2,
					Model md,
					HttpSession session) throws Exception{
				String email = user_email1 + "@" + user_email2;
				System.out.println(email);
				
				/*HashMap<String, String> map = new HashMap<String, String>();
				map.put("email", email);*/
				
				MemberVO vo =  service.id_find2(email);
				 
				//MemberVO vo = service.id_find(map);
				
				if(vo != null) {
					System.out.println(vo.getUserid());
					//session.setAttribute("id", vo.getUserid());
					md.addAttribute("vo", vo);
				}
				else {
				//id 없는 경우 처리
				}
				//md.addAttribute("vo", vo);
				//반환이 url만 반환되니 모델이 안넘어가지 않나요 여기 ㅋㅋㅋㅋ
				
				return "member/id_find";
			}
		//비밀번호찾기 팝업창
		@RequestMapping("/pwfind")
		public String pwfind() {
			//model.addAttribute("category", "");
			return "member/pwfind";
		}
		
		
		//비밀번호 검색			
		@RequestMapping(value = "/pw_find", method= {RequestMethod.POST, RequestMethod.GET})
		public String pwfind(HttpServletResponse response, 
				@RequestParam("user_email1") String user_email1,
				@RequestParam("user_email2") String user_email2,
				@RequestParam("user_id") String user_id,
				Model md,
				HttpSession session) throws Exception{
			String email = user_email1 + "@" + user_email2;
			System.out.println(email);
			//String userid = user_id ;
			//System.out.println(userid);
			 
			
			/*HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);*/
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("userid", user_id);
			MemberVO vo =  service.pw_find1(map);
			//MemberVO vo1 =  service.pw_find2(userid);
			
			//MemberVO vo = service.id_find(map);
			//System.out.println(vo1.???());
			
			StringBuffer tmpPw = new StringBuffer();
			Random rnd = new Random();
			int len = 8; //임시암호 길이 8자.
			for (int i=0; i< len;i++) {
				//홀수는 소문자 짝수는 숫자로 구성된 임시비번 생성
				if(i%2==0) tmpPw.append((char)((int)(rnd.nextInt(26))+97));
				else tmpPw.append((int)(rnd.nextInt(10)));
			}
			System.out.println(tmpPw);
			
			
			
			if(vo != null) {
				
				
				System.out.println(vo.getUserid());
				//session.setAttribute("id", vo.getUserid());
				md.addAttribute("vo", vo);
				md.addAttribute("tmpPw",tmpPw);
			
			}
			else {
			//id 없는 경우 처리
			}
			//md.addAttribute("vo", vo);
			//반환이 url만 반환되니 모델이 안넘어가지 않나요 여기 ㅋㅋㅋㅋ
			
			return "member/pw_find";
		}
	
				
		@RequestMapping("/callbackview")
		public String callbackview(@RequestParam String code, @RequestParam String state, Model model) {
			model.addAttribute("category", "");
			//System.out.println("code" + code);
			//System.out.println("state" + state);
			return "member/callbackview";
			}

				
				
		
				/*@ResponseBody @RequestMapping(value="/idfind", produces="text/html; charset=utf-8")
				public String id_find(HttpServletResponse response, String email) throws Exception {
					PrintWriter out = response.getWriter();
					String id = MemberController.id_find(email);
					
					if (id == null) {
						out.println("<script>");
						out.println("alert('가입된 아이디가 없습니다.');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
						return null;
					} else {
						return id;
					}
					
					return "/member/idfind";
				}*/
				
			/*// 아이디 찾기 폼
				@ResponseBody @RequestMapping(value = "/idfind", method= {RequestMethod.POST, RequestMethod.GET})
				public String idfind(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
					md.addAttribute("id", service.id_find(response, email));
					
					return "/member/idfind";
			


				}
				*/
				
				
			/*	//아이디 찾기
				@Override
				public String id_find(HttpServletResponse response, String email) throws Exception {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					String id = MemberController.id_find(email);
					
					if (id == null) {
						out.println("<script>");
						out.println("alert('가입된 아이디가 없습니다.');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
						return null;
					} else {
						return id;
					}
				}*/
			
				
				
				
	//
		
	
	
	

}

