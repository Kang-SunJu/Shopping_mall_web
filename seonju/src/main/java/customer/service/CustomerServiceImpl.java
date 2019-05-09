package customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import customer.dao.CustomerDAO;
import customer.vo.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired private CustomerDAO dao;
	
	@Override
	public List<CustomerVO> list() {
		return dao.list();
	}

	@Override
	public CustomerVO detail(int id) {
		return dao.detail(id);
	}

	@Override
	public boolean insert(CustomerVO vo) {
		//파라미터로 가져온 정보를 DB에 저장하는 처리 
		return dao.insert(vo);
	}

	@Override
	public boolean update(CustomerVO vo) {
		return dao.update(vo);
	}

	@Override
	public boolean delete(int id) {
		return dao.delete(id);
	}

}
