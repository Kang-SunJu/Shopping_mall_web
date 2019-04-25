package customer.service;

import java.util.List;

import customer.vo.CustomerVO;

public interface CustomerService {
	//고객목록조회, 고객상세정보조회, 신규고객저장, 고객정보변경, 고객정보삭제
	//CRUD (Create, Read, Update, Delete)  
	List<CustomerVO> list();
	CustomerVO detail(int id);
	boolean insert(CustomerVO vo);
	boolean update(CustomerVO vo);
	boolean delete(int id);
}
