package buy.serivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import buy.dao.BuyListDAO;
import buy.vo.BuyListVO;


@Service
public class BuyListServiceImpl implements BuyListService {

	
	@Autowired BuyListDAO dao;
	
	@Override
	public List<BuyListVO> list(BuyListVO vo) {
		// TODO Auto-generated method stub
		return dao.list(vo);
	}

}
