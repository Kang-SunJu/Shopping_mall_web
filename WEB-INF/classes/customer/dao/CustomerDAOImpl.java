package customer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import customer.vo.CustomerVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	@Autowired private SqlSession sql;
	
	@Override
	public boolean insert(CustomerVO vo) {
		return sql.insert("customer.mapper.insert",
									vo)>0 ? true : false;
	}

	@Override
	public List<CustomerVO> list() {
		return sql.selectList("customer.mapper.list");
	}

	@Override
	public CustomerVO detail(int id) {
		return sql.selectOne("customer.mapper.detail", id);
	}

	@Override
	public boolean update(CustomerVO vo) {
		return sql.update("customer.mapper.update", 
							vo)>0 ? true : false;
	}

	@Override
	public boolean delete(int id) {
		return sql.delete("customer.mapper.delete", id)>0 ? true : false;
	}

}
