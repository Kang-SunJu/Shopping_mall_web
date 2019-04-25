package customer.service;

import java.util.List;

import customer.vo.CustomerVO;

public interface CustomerService {
	//�������ȸ, ����������ȸ, �ű԰�����, ����������, ����������
	//CRUD (Create, Read, Update, Delete)  
	List<CustomerVO> list();
	CustomerVO detail(int id);
	boolean insert(CustomerVO vo);
	boolean update(CustomerVO vo);
	boolean delete(int id);
}
