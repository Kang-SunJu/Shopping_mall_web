package basket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import basket.vo.BasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO {
	@Autowired
	private SqlSession sql;

	@Override
	public void update(BasketVO vo) {
		// TODO Auto-generated method stub
		 sql.update("basket.mapper.update",vo);
//		return sql.update("basket.mapper.update",vo) > 0 ? true : false;
	}

	@Override
	public List<BasketVO> select(BasketVO vo) {
		// TODO Auto-generated method stub
		return sql.selectList("basket.mapper.select", vo);
	}
	public BasketVO select_product(BasketVO vo) {
		// TODO Auto-generated method stub
		return sql.selectOne("basket.mapper.select_product", vo);
	}

	@Override
	public boolean delete(BasketVO vo) {
		// TODO Auto-generated method stub
		return sql.delete("basket.mapper.delete", vo) > 0 ? true : false;
	}

}
