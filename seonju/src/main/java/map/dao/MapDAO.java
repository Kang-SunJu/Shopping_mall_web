package map.dao;

import java.util.List;

import map.vo.MapVO;

public interface MapDAO {
	List<MapVO> mapList();
	boolean mapFirstImgUpdate(int storeNum);
}
