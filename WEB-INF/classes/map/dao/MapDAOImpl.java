package map.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import map.vo.MapVO;

@Repository
public class MapDAOImpl implements MapDAO {
	@Autowired private SqlSession sql;

	@Override
	public List<MapVO> mapList() {
		return sql.selectList("map.mapper.list");
	}

	@Override
	public boolean mapFirstImgUpdate(int storeNum) {
		return sql.update("map.mapper.mapFirstImgUpdate", storeNum) > 0? true : false;
	}

}
