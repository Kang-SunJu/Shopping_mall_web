package product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired private SqlSession sql;
	
	
	@Override
	public boolean insertImg(ProductVO vo) {
		return sql.insert("product.mapper.insertImg", vo) > 0 ? true : false ;
	}
	
	@Override
	public boolean addImg(ProductVO vo) {
		return sql.insert("product.mapper.addImg", vo) > 0 ? true : false ;
	}
	
	@Override
	public boolean insert(ProductVO vo) {
		return sql.insert("product.mapper.insert", vo) > 0 ? true : false ;
	}

	@Override
	public ProductVO detail(int product_id) {
		return sql.selectOne("product.mapper.detail", product_id);
	}

	@Override
	public boolean update(ProductVO vo) {
		return sql.update("product.mapper.update", vo) > 0 ? true : false ;
	}

	@Override
	public boolean delete(int product_id) {
		return sql.delete("product.mapper.delete", product_id)> 0 ? true : false ;
	}

	@Override
	public List<ProductVO> list(String kind) {
		return sql.selectList("product.mapper.list", kind);
	}

	@Override
	public List<ProductVO> detailPage(int product_id) {
		return sql.selectList("product.mapper.detailPage", product_id);
	}

	@Override
	public boolean updateImg(ProductVO vo) {
		return sql.update("product.mapper.updateImg", vo) > 0 ? true : false ;
	}

	@Override
	public boolean delete_imgs(Map<String, Object > map) {
		return sql.delete("product.mapper.deleteImgs", map) > 0 ? true : false;
	}
	
	@Override
	public boolean update_imgs(Map<String, Object > map) {
		return sql.update("product.mapper.updateImgs", map) > 0 ? true : false;
	}
	
	@Override
	public boolean new_imgs(Map<String, Object > map) {
		return sql.insert("product.mapper.new_imgs", map) > 0 ? true : false;
	}
}
