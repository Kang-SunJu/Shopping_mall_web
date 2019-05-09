package pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pay.dao.PayDAO;
import pay.vo.PayVO;

@Service
public class PayServiceImpl implements PayService {

@Autowired private PayDAO dao;

	@Override
	public boolean insert(PayVO vo) {
		// TODO Auto-generated method stub
		return dao.insert(vo);
	}

	@Override
	public boolean insertdum(PayVO vo) {
		// TODO Auto-generated method stub
		return dao.insertdum(vo);
	}

	@Override
	public boolean deletedum(String orderid) {
		// TODO Auto-generated method stub
		return dao.deletedum(orderid);
	}

}
