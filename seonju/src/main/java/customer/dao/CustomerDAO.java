package customer.dao;

import java.util.List;

import customer.vo.CustomerVO;

public interface CustomerDAO {
	//CRUD
	boolean insert(CustomerVO vo);
	List<CustomerVO> list();
	CustomerVO detail(int id);
	boolean update(CustomerVO vo);
	boolean delete(int id);
}
