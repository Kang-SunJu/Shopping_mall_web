package basket.dao;

import java.util.List;

import basket.vo.BasketVO;

public interface BasketDAO {
	void update(BasketVO vo);
	List<BasketVO> select(BasketVO vo);
	BasketVO select_product(BasketVO vo);
	boolean delete(BasketVO vo);
}
