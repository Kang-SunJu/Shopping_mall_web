package map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import map.dao.MapDAO;
import map.vo.MapVO;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired private MapDAO dao;

	@Override
	public List<MapVO> mapList() {
		return dao.mapList();
	}

	@Override
	public boolean mapFirstImgUpdate(int storeNum) {
		return dao.mapFirstImgUpdate(storeNum);
	}
	
}
