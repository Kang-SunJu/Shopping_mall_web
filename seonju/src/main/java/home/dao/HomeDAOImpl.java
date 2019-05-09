package home.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import home.vo.HomeMainSlideVO;
import home.vo.HomeMenuSlideVO;
import home.vo.HomeVO;
import home.vo.HomeVideoVO;
import map.vo.MapVO;


@Repository
public class HomeDAOImpl implements HomeDAO {
	@Autowired private SqlSession sql;

	@Override
	public List<HomeVO> list() {
		return sql.selectList("home.mapper.list");
	}

	@Override
	public List<HomeMenuSlideVO> menuSlideList() {
		return sql.selectList("home.mapper.menuSlideList");
	}

	@Override
	public List<HomeVideoVO> videoList() {
		return sql.selectList("home.mapper.videoList");
	}

	@Override
	public List<HomeMainSlideVO> mainSlideList() {
		return sql.selectList("home.mapper.mainSlideList");
	}

	@Override
	public boolean mainslideinsert(HomeMainSlideVO vo) {
		return sql.insert("home.mapper.mainslideinsert", vo) > 0? true : false;
	}

	@Override
	public boolean menuslideinsert(HomeMenuSlideVO menuVo) {
		return sql.insert("home.mapper.menuslideinsert", menuVo) > 0? true : false;
	}

	@Override
	public boolean mainvideoinsert(HomeVideoVO videoVo) {
		return sql.insert("home.mapper.mainvideoinsert", videoVo) > 0? true : false;
	}

	@Override
	public boolean menuDelete(int menuId) {
		return sql.delete("home.mapper.menuDelete", menuId) > 0 ? true : false;
	}

	@Override
	public boolean mainSlideDelete(int msId) {
		return sql.delete("home.mapper.mainSlideDelete", msId) > 0 ? true : false;
	}

	@Override
	public boolean mainVideoDelete(int videoNum) {
		return sql.delete("home.mapper.mainVideoDelete", videoNum) > 0 ? true : false;
	}

	@Override
	public List<MapVO> mapList() {
		return sql.selectList("home.mapper.mapList");
	}
	
	@Override
	public HomeMainSlideVO mainSlideDetail(int msId) {
		return sql.selectOne("home.mapper.mainSlideDetail");
	}

	@Override
	public boolean mainSlideUpdate(HomeMainSlideVO vo) {
		return sql.update("home.mapper.mainSlideUpdate", vo) > 0 ? true : false;
	}

}
