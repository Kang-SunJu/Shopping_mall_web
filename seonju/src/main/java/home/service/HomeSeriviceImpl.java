package home.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import home.dao.HomeDAO;
import home.vo.HomeMainSlideVO;
import home.vo.HomeMenuSlideVO;
import home.vo.HomeVO;
import home.vo.HomeVideoVO;
import map.vo.MapVO;


@Service
public class HomeSeriviceImpl implements HomeService {
	@Autowired private HomeDAO dao;

	@Override
	public List<HomeVO> list() {
		return dao.list();
	}

	@Override
	public List<HomeMenuSlideVO> menuSlideList() {
		return dao.menuSlideList();
	}

	@Override
	public List<HomeVideoVO> videoList() {
		return dao.videoList();
	}

	@Override
	public List<HomeMainSlideVO> mainSlideList() {
		return dao.mainSlideList();
	}

	@Override
	public boolean mainslideinsert(HomeMainSlideVO vo) {
		return dao.mainslideinsert(vo);
	}

	@Override
	public boolean menuslideinsert(HomeMenuSlideVO menuVo) {
		return dao.menuslideinsert(menuVo);
	}

	@Override
	public boolean mainvideoinsert(HomeVideoVO videoVo) {
		return dao.mainvideoinsert(videoVo);
	}

	@Override
	public boolean menuDelete(int menuId) {
		return dao.menuDelete(menuId);
	}

	@Override
	public boolean mainSlideDelete(int msId) {
		return dao.mainSlideDelete(msId);
	}

	@Override
	public boolean mainVideoDelete(int videoNum) {
		return dao.mainVideoDelete(videoNum);
	}

	@Override
	public List<MapVO> mapList() {
		return dao.mapList();
	}
	
	@Override
	public HomeMainSlideVO mainSlideDetail(int msId) {
		return dao.mainSlideDetail(msId);
	}

	@Override
	public boolean mainSlideUpdate(HomeMainSlideVO vo) {
		return dao.mainSlideUpdate(vo);
	}
}
