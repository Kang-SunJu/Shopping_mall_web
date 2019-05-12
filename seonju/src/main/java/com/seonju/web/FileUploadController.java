package com.hanul.smart;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.service.CommonService;
import home.service.HomeService;
import home.vo.HomeMainSlideVO;
import home.vo.HomeMenuSlideVO;
import home.vo.HomeVideoVO;
import map.service.MapService;
import map.vo.MapVO;

@Controller
@SessionAttributes({ "category", "appTitle" })
public class FileUploadController {
	@Autowired
	private CommonService common;
	@Autowired
	private HomeService service;
	@Autowired
	private MapService mapService;
	
	/*������Ʈ*/
	
	@RequestMapping("/mainSlideUpdate.fi")
	public String mainSlideUpdate(@RequestParam HomeMainSlideVO vo, RedirectAttributes redirect, 
											@RequestParam MultipartFile file, HttpSession ss, @RequestParam String mainslidedelete) {
		vo.setMsname("");
		vo.setMspath("");
		
		HomeMainSlideVO mainSlide = service.mainSlideDetail(vo.getMsId());
		String uuid = ss.getServletContext().getRealPath("resources") + mainSlide.getMspath();
		
		if(file.getSize() > 0) {
			vo.setMsname(file.getOriginalFilename());
			vo.setMspath(common.upload("mainSlide", file, ss));
			
			// ���� ÷�ε� ������ �־��ٸ� ����
			File f = new File(uuid);
			if(f.exists()) f.delete();
		} else {
			if( mainslidedelete.equals("y")) {
				//���� ÷�ε� ���� �־��µ� �����ϴ� ���
				File f = new File( uuid );
				if( f.exists() ) f.delete();
			} else {
				if(mainSlide.getMsname()!=null) vo.setMsname(mainSlide.getMsname());
				if(mainSlide.getMspath()!=null) vo.setMspath(mainSlide.getMspath());
			}
		}
		
		service.mainSlideUpdate(vo);
		
		return "redirect:mainSlideList.fi";
	}
	
	@RequestMapping("/mainSlideDetail.fi")
	public String mainSlideDetail(@ModelAttribute("msId") int msId, Model model, @RequestParam MultipartFile file) {
		// �ش� id�� �������� DB���� ��ȸ�ؿ´�.
		model.addAttribute("mainSlideDetail", service.mainSlideDetail(msId));
		
		return null;
	}
	
	// �� ������Ʈ
	@RequestMapping("/mapFirstImgUpdate.fi")
	public String mapFirstImgUpdate(@RequestParam int storeNum) {
		mapService.mapFirstImgUpdate(storeNum);
		return null;
	}
	
	/*����*/
	
	// ���� ���� ����
	@RequestMapping("/mainvideodelete.fi")
	public String mainvideodelete(@RequestParam int videoNum) {
		service.mainVideoDelete(videoNum);
		return "redirect:videoList.fi";
	}
	
	// �޴� �����̵� ����
	@RequestMapping("/menuDelete.fi")
	public String menuDelete(@RequestParam int menuId) {
		service.menuDelete(menuId);

		return "redirect:menuSlideList.fi";
	}
	
	// ���� �����̵� ����
	@RequestMapping("/mainslidedelete.fi")
	public String mainslidedelete(@RequestParam int msId) {
		service.mainSlideDelete(msId);

		return "redirect:mainSlideList.fi";
	}
	
	/*���� ���ε�� ����Ʈ ȭ�� ��û*/
	
	// ���� ȭ�� ��û
	@RequestMapping("/mapList.fi")
	public String mapList(Model model) {
		List<MapVO> mapList = service.mapList();
		model.addAttribute("mapList", mapList);
		model.addAttribute("index", 4);

		return "fileupload/fileList";
	}
	
	// ���� ����Ʈ ȭ�� ��û
	@RequestMapping("/videoList.fi")
	public String videoList(Model model) {
		List<HomeVideoVO> videoList = service.videoList();
		model.addAttribute("videoList", videoList);
		model.addAttribute("index", 3);

		return "fileupload/fileList";
	}
	
	// �޴� �����̵� ����Ʈ ȭ�� ��û
	@RequestMapping("/menuSlideList.fi")
	public String menuSlideList(Model model) {
		List<HomeMenuSlideVO> menuSlideList = service.menuSlideList();
		model.addAttribute("menuSlideList", menuSlideList);
		model.addAttribute("index", 2);

		return "fileupload/fileList";
	}
	
	// ���� �����̵� ����Ʈ ȭ�� ��û
	@RequestMapping("/mainSlideList.fi")
	public String mainSlideList(Model model) {

		List<HomeMainSlideVO> mainSlideList = service.mainSlideList();
		model.addAttribute("mainSlideList", mainSlideList);
		model.addAttribute("index", 1);

		return "fileupload/fileList";
	}
	
	/*���� ����*/
	
	// ���� ���� ����
	@RequestMapping("/mainVideoinsert.fi")
	public String mainVideoinsert(HomeVideoVO videoVo, HttpSession session, @RequestParam MultipartFile file) {
		videoVo.setVideoNum(0);
		videoVo.setVideoPath("");
		if (file.getSize() > 0) {
			videoVo.setVideoNum(1);
			videoVo.setVideoPath(common.upload("fileupload", file, session));
		}
		service.mainvideoinsert(videoVo);
		return "redirect:fileupload";
	}
	
	// �޴� �����̵� ����
	@RequestMapping("/menuslideinsert.fi")
	public String menuslideinsert(HomeMenuSlideVO menuVo, HttpSession session, @RequestParam MultipartFile file) {
		menuVo.setMenuName("");
		menuVo.setMenupath("");
		if (file.getSize() > 0) {
			menuVo.setMenuName(file.getOriginalFilename());
			menuVo.setMenupath(common.upload("fileupload", file, session));
		}
		service.menuslideinsert(menuVo);
		return "redirect:fileupload";
	}
	
	// ���� �����̵� ����
	@RequestMapping("/mainslideinsert.fi")
	public String mainslideinsert(HomeMainSlideVO vo, HttpSession session, @RequestParam MultipartFile file) {
		vo.setMsname("");
		vo.setMspath("");
		if (file.getSize() > 0) {
			vo.setMsname(file.getOriginalFilename());
			vo.setMspath(common.upload("fileupload", file, session));
		}
		service.mainslideinsert(vo);
		return "redirect:fileupload";
	}

	@RequestMapping("/fileupload")
	public String list(Model model) {
		model.addAttribute("appTitle", "���� ���ε� - ");
		model.addAttribute("category", "fi");

		return "fileupload/fileupload";
	}
}
