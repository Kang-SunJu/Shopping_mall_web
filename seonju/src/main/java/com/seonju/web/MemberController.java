package com.seonju.web;

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
	
	//壱梓舛左肢薦坦軒 推短
		@RequestMapping("/delete.mb")
		public String delete(@RequestParam String userid) {
			//識澱廃 壱梓舛左研 肢薦廃 板
			service.delete(userid);
			//壱梓鯉系鉢檎生稽 尻衣
			return "redirect:list.mb";
		}
	
	//壱梓鯉系鉢檎 推短
		@RequestMapping("/list.mb")
		public String list(Model model) {
			model.addAttribute("category", "mb");
			model.addAttribute("appTitle", "壱梓淫軒-");
			//DB拭辞 壱梓鯉系舛左研 繕噺背人
			model.addAttribute("list", service.list() );
			//鉢檎拭 窒径
			return "member/list";
		}
	
	//五昔凪戚走 推短
		@RequestMapping("/home")
		public String home() {
			return"home";
		}
	
	//壱梓舛左痕井煽舌坦軒 推短
			@RequestMapping("/update")
			public String update(MemberVO vo) {
				//鉢檎拭辞 痕井脊径廃 舛左研 DB拭 痕井煽舌廃 板
				service.update(vo);
				//雌室鉢檎生稽 尻衣
				return "redirect:mypage?userid=" + vo.getUserid();
			}
	
	//壱梓舛左痕井鉢檎 推短
			@RequestMapping("/modify")
			public String modify(Model model, @RequestParam String userid) {
				//識澱廃 壱梓税 舛左研 DB拭辞 繕噺背 紳 板
				model.addAttribute("vo", service.mypage(userid) );
				//舛左痕井鉢檎拭 窒径
				return "member/modify";
			}
	
	//原戚凪戚走 推短
		@RequestMapping("/mypage")
		public String mypage(Model model, @RequestParam String userid) {
			//鉢檎拭辞 識澱廃 壱梓税 舛左研 DB拭辞 繕噺背人
			model.addAttribute("vo", service.mypage(userid) );
			
			//壱梓雌室舛左鉢檎生稽 尻衣
			return "member/mypage";
		}
	
	//稽益焼数坦軒 推短
	@ResponseBody @RequestMapping("/logout")
	public void logout(HttpSession session) {
		//室芝拭 赤澗 稽益昔舛左研 肢薦廃陥.
		session.removeAttribute("login_info");
	}
	
	//稽益昔坦軒 推短
	@ResponseBody @RequestMapping("/login")
	public boolean login(@RequestParam String userid,
						@RequestParam String userpwd,
						HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpwd", userpwd);
		MemberVO vo = service.select(map);
		//焼戚巨,搾腰戚 析帖馬澗 噺据戚 DB拭 赤澗走 溌昔馬食
		//析帖馬澗 噺据戚 赤陥檎 稽益昔鞠惟 廃陥.: 稽益昔舛左澗 室芝拭 眼澗陥.
		session.setAttribute("login_info", vo);
		//orderid 拭 稽益昔廃 政煽税 id研 隔澗陥.
		session.setAttribute("orderid", userid);
		return vo == null ? false : true;
	}
	
	
	//朝朝神 稽益昔 覗稽琶 繕噺(莞革績幻 酔識)
	@RequestMapping("/kakaologin")
	public String kakaologin(@RequestParam String name,
						HttpSession session, Model model) {

		//kakaologin 舛左拭辞 莞革績聖 vo拭 眼焼辞 室芝坦軒背辞 五昔凪戚走稽 左浬陥.
		MemberVO vo = new MemberVO();
		vo.setName(name);
		session.setAttribute("login_info", vo);
		return "redirect:index";
	}
	
	@Autowired private CommonService common;
	
	//噺据亜脊坦軒 推短
	@ResponseBody @RequestMapping(value="/join", 
						produces="text/html; charset=utf-8")
	public String join(MemberVO vo, HttpSession session) {
		//鉢檎拭辞 脊径廃 舛左研 DB拭 煽舌廃 板
		String msg = "<script type='text/javascript'>";
		if( service.insert(vo) ) {
			common.emailSend(
					vo.getEmail(), vo.getName(), session);
			msg += "alert('噺据亜脊聖 逐馬杯艦陥^^'); location='index'";
		}else {
			msg += "alert('噺据亜脊 叔鳶ばば'); history.go(-1)";
		}
		msg += "</script>";
		return msg;
	}
	
	//焼戚巨掻差溌昔 推短
	@ResponseBody @RequestMapping("/id_check")
	public String id_check(@RequestParam String userid) {
		//鉢檎拭辞 穿勺吉 焼戚巨亜 DB拭 糎仙食採研 毒舘馬食
		//益 衣引研 鉢檎生稽 鋼発獣轍陥.
		return String.valueOf( service.id_usable(userid) );
	}
	
	//噺据亜脊鉢檎 推短
	@RequestMapping("/member")
	public String member(Model model) {
		model.addAttribute("category", "");
		return "member/join";
	}
	
	//稽益昔鉢檎
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
	
	//噺据亜脊 鉦淫疑税鉢檎
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
	//焼戚巨達奄橡穣但
			@RequestMapping("/idfind")
			public String idfind() {
				//model.addAttribute("category", "");
				return "member/idfind";
			}
			//焼戚巨 伊事			 
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
				//id 蒸澗 井酔 坦軒
				}
				//md.addAttribute("vo", vo);
				//鋼発戚 url幻 鋼発鞠艦 乞季戚 照角嬢亜走 省蟹推 食奄 せせせせ
				
				return "member/id_find";
			}
		//搾腔腰硲達奄 橡穣但
		@RequestMapping("/pwfind")
		public String pwfind() {
			//model.addAttribute("category", "");
			return "member/pwfind";
		}
		
		
		//搾腔腰硲 伊事			
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
			int len = 8; //績獣章硲 掩戚 8切.
			for (int i=0; i< len;i++) {
				//筈呪澗 社庚切 側呪澗 収切稽 姥失吉 績獣搾腰 持失
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
			//id 蒸澗 井酔 坦軒
			}
			//md.addAttribute("vo", vo);
			//鋼発戚 url幻 鋼発鞠艦 乞季戚 照角嬢亜走 省蟹推 食奄 せせせせ
			
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
						out.println("alert('亜脊吉 焼戚巨亜 蒸柔艦陥.');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
						return null;
					} else {
						return id;
					}
					
					return "/member/idfind";
				}*/
				
			/*// 焼戚巨 達奄 廿
				@ResponseBody @RequestMapping(value = "/idfind", method= {RequestMethod.POST, RequestMethod.GET})
				public String idfind(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
					md.addAttribute("id", service.id_find(response, email));
					
					return "/member/idfind";
			


				}
				*/
				
				
			/*	//焼戚巨 達奄
				@Override
				public String id_find(HttpServletResponse response, String email) throws Exception {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					String id = MemberController.id_find(email);
					
					if (id == null) {
						out.println("<script>");
						out.println("alert('亜脊吉 焼戚巨亜 蒸柔艦陥.');");
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

