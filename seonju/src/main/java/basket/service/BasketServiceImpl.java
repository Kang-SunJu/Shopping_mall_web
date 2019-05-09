package basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import basket.dao.BasketDAO;
import basket.vo.BasketVO;

@Service
public class BasketServiceImpl implements BasketService {
@Autowired private BasketDAO dao;
	@Override
	public void update(BasketVO vo) {
		// TODO Auto-generated method stub
		 dao.update(vo);
	}
	@Override
	public List<BasketVO> select(BasketVO vo) {
		// TODO Auto-generated method stub
		return dao.select(vo);
	}
	@Override
	public BasketVO select_product(BasketVO vo) {
		// TODO Auto-generated method stub
		return dao.select_product(vo);
	}
	@Override
	public boolean delete(BasketVO vo) {
		// TODO Auto-generated method stub
		return dao.delete(vo);
	}

}
