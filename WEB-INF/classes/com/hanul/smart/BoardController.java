package com.hanul.smart;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import common.service.CommonService;
import product.service.ProductService;
import product.vo.ProductVO;

@Controller @SessionAttributes({"category", "appTitle"})
public class BoardController {


	@Autowired
	private CommonService common;
	@Autowired
	private ProductService proService;
	
	// 온라인주문메인페이지
	@RequestMapping("/list.bo")
	public String list(@RequestParam(defaultValue="초코파이") String kind, Model model) {
		model.addAttribute("appTitle", "온라인주문-");
		model.addAttribute("category", "bo");
		model.addAttribute("list", proService.list(kind));
		return "board/list";
	}
	
	// 상세페이지
		@RequestMapping("/menuPage.bo")
		public String detailPage(@RequestParam int product_id,  Model model) {
			model.addAttribute("list", proService.detailPage(product_id));
			return "board/menuPage";
		}
	
	
	@ResponseBody @RequestMapping("/add_menu.bo")
	public boolean add_menu(ProductVO vo,  @RequestParam MultipartFile file,
			HttpSession ss) {
		boolean succ = false;
		
		succ = proService.insert(vo);

		//이미지가 있다면
		if (file.getSize() > 0) {
			vo.setProduct_img_name(file.getOriginalFilename());
			vo.setProduct_img_path(common.upload2("product", file, ss));
			proService.insertImg(vo);
		}
		return succ;
	}
	
	@ResponseBody @RequestMapping("/delete_menu.bo")
	public boolean delete_menu(@RequestParam int product_id) {
		return proService.delete(product_id);
	}
	

	@ResponseBody @RequestMapping("/update_menu.bo")
	public boolean update_menu(ProductVO vo,  @RequestParam MultipartFile file,
			HttpSession ss, @RequestParam String delete) {
		boolean succ_pro = true;
		boolean succ_img = true;
		
		vo.setProduct_img_name("");
		vo.setProduct_img_path("");

		ProductVO product = proService.detail(vo.getProduct_id());
		String uuid = ss.getServletContext().getRealPath("resources") + product.getProduct_img_path();

		
		//이미지가 있다면
		if (file.getSize() > 0) {
			vo.setProduct_img_name(file.getOriginalFilename());
			vo.setProduct_img_path(common.upload2("product", file, ss));

			// 원래 첨부된 파일이 있었다면 삭제
			File f = new File(uuid);
			if (f.exists())
				f.delete();
		} else {  //이미지가 없다면
			if (delete.equals("y")) {
				// 원래 첨부된 파일 있었는데 삭제하는 경우
				File f = new File(uuid);
				if (f.exists())
					f.delete();
			} else {
				// 원래 첨부된 파일 있었고 그걸 그대로 사용하는 경우
				if (product.getProduct_img_name() != null)
					vo.setProduct_img_name(product.getProduct_img_name());
				if (product.getProduct_img_path() != null)
					vo.setProduct_img_path(product.getProduct_img_path());
			}
		}

		// 화면에서 변경입력한 정보를 DB에 저장한 후
		
		//상품이름이 변경되었거나 가격이 변경되었을때 변경저장
		if(!product.getProduct_name().equals(vo.getProduct_name()) || product.getProduct_price() != vo.getProduct_price()) {
			succ_pro = proService.update(vo);
		}
		
		//이미지쪽 변경 저장 없으면 새로 삽입
		if(vo.getDetail_id() > 0 ) {
			succ_img = proService.updateImg(vo);
		}else {
			succ_img = proService.addImg(vo);
		}
		
		if(succ_pro && succ_img) {
			return true;
		}
		return false;
	}
	
	
	@ResponseBody @RequestMapping("/delete_img.bo")
	public boolean delete_img(
			@RequestParam(defaultValue="0", required=false) int[] delete_id, 
			@RequestParam(defaultValue="", required=false) String[] update_id, 
			@RequestParam(required=false) String[] product_img_path, 
			@RequestParam int product_id, 
			@RequestParam(required=false) MultipartFile[] file,
			@RequestParam MultipartFile[] nfile,
			HttpSession ss) {
		boolean succ_up = true;
		boolean succ_del = true;
		boolean succ_new = true;
		
		
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		for (int i=0; i<update_id.length; i++) {
			if(!update_id[i].equals("")) {
				String uuid = ss.getServletContext().getRealPath("resources") + product_img_path[i];
				File f = new File(uuid);
					if (f.exists())
						f.delete();
				
				ProductVO vo = new ProductVO();
				vo.setDetail_id(Integer.parseInt(update_id[i]));
				vo.setProduct_img_path(common.upload2("product", file[i], ss));
				vo.setProduct_img_name(file[i].getOriginalFilename());
				list.add(vo);
			}
		} 
		
		
		if(!list.isEmpty()) {
			Map<String, Object > map = new HashMap<String, Object>();
			map.put("list_up", list);
			succ_up = proService.update_imgs(map);
		}
		
		if(delete_id.length>0 && delete_id[0] != 0) {
			Map<String, Object > map = new HashMap<String, Object>();
			map.put("list_del", delete_id);
			succ_del = proService.delete_imgs(map);
		}
		
		if(nfile[0].getSize() > 0) {
			ArrayList<ProductVO> nlist = new ArrayList<ProductVO>();
			for(MultipartFile nf : nfile) {
				ProductVO vo = new ProductVO();
				vo.setProduct_id(product_id);
				vo.setProduct_img_name(nf.getOriginalFilename());
				vo.setProduct_img_path(common.upload2("product", nf, ss));
				nlist.add(vo);
			}
			Map<String, Object > map = new HashMap<String, Object>();
			map.put("list_new", nlist);
			succ_new = proService.new_imgs(map);
		}
		
		
		if(succ_up && succ_del && succ_new) {
			return true;
		}
		return false;
	}
}
