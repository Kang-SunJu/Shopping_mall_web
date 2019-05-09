package buy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import buy.vo.BuyListVO;

@Repository
public class BuyListDAOImpl implements BuyListDAO {

	@Autowired SqlSession sql;
	
	@Override
	public List<BuyListVO> list(BuyListVO vo) {
		// TODO Auto-generated method stub
		return sql.selectList("order.mapper.buyList", vo);
	}

}
