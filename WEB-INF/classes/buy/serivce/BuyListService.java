package buy.serivce;

import java.util.List;

import buy.vo.BuyListVO;

public interface BuyListService {
	List<BuyListVO> list(BuyListVO vo);
}
