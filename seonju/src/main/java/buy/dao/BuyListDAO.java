package buy.dao;

import java.util.List;

import buy.vo.BuyListVO;

public interface BuyListDAO {
	List<BuyListVO> list(BuyListVO vo);
}
