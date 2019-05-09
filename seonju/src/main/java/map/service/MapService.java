package map.service;

import java.util.List;

import map.vo.MapVO;

public interface MapService {
	List<MapVO> mapList();
	boolean mapFirstImgUpdate(int storeNum);
}
