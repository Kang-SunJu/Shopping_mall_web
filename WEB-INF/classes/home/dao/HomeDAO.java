package home.dao;

import java.util.List;

import home.vo.HomeMainSlideVO;
import home.vo.HomeMenuSlideVO;
import home.vo.HomeVO;
import home.vo.HomeVideoVO;
import map.vo.MapVO;

public interface HomeDAO {
	List<HomeVO> list();
	List<HomeMenuSlideVO> menuSlideList();
	List<HomeVideoVO> videoList();
	List<HomeMainSlideVO> mainSlideList();
	List<MapVO> mapList();
	
	boolean mainslideinsert(HomeMainSlideVO vo);
	boolean menuslideinsert(HomeMenuSlideVO menuVo);
	boolean mainvideoinsert(HomeVideoVO videoVo);
	
	boolean menuDelete(int menuId);
	boolean mainSlideDelete(int msId);
	boolean mainVideoDelete(int videoNum);
	
	HomeMainSlideVO mainSlideDetail(int msId);
	boolean mainSlideUpdate(HomeMainSlideVO vo);
}
