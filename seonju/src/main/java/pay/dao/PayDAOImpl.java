package pay.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pay.vo.PayProductVO;
import pay.vo.PayVO;

@Repository
public class PayDAOImpl implements PayDAO {
@Autowired private SqlSession sql;

	@Override
	public boolean insert(PayVO vo) {
		// TODO Auto-generated method stub
		ArrayList<PayProductVO> list = new ArrayList<PayProductVO>();
		for (int idx=0; idx<vo.getProduct_id().length; idx++ ){
			PayProductVO product = new PayProductVO();
			product.setProduct_id(vo.getProduct_id()[idx]);
			product.setPrice(vo.getPrice()[idx]);
			product.setSu(vo.getSu()[idx]);
			list.add( product );
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("list", list);
		
		return sql.insert("order.mapper.order", map) > 0 ? true : false;
	}

	@Override
	public boolean insertdum(PayVO vo) {
		// TODO Auto-generated method stub
		return sql.insert("order.mapper.orderdum", vo) > 0 ? true : false;
	}

	@Override
	public boolean deletedum(String orderid) {
		// TODO Auto-generated method stub
		return sql.delete("order.mapper.deletedum", orderid) > 0 ? true : false;
	}

}
