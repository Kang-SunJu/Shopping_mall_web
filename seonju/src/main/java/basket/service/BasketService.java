package basket.service;

import java.util.List;

import basket.vo.BasketVO;

public interface BasketService {
	void update(BasketVO vo);
	List<BasketVO> select(BasketVO vo);
	BasketVO select_product(BasketVO vo);
	boolean delete(BasketVO vo);
	}
