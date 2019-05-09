package product.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.dao.ProductDAO;
import product.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired private ProductDAO dao;
	
	@Override
	public boolean insert(ProductVO vo) {
		return dao.insert(vo);
	}
	
	@Override
	public boolean insertImg(ProductVO vo) {
		return dao.insertImg(vo);
	}
	
	@Override
	public boolean addImg(ProductVO vo) {
		return dao.addImg(vo);
	}

	@Override
	public ProductVO detail(int product_id) {
		return dao.detail(product_id);
	}

	@Override
	public boolean update(ProductVO vo) {
		return dao.update(vo);
	}

	@Override
	public boolean delete(int product_id) {
		return dao.delete(product_id);
	}

	@Override
	public List<ProductVO> list(String kind) {
		return dao.list(kind);
	}

	@Override
	public List<ProductVO> detailPage(int product_id) {
		return dao.detailPage(product_id);
	}

	@Override
	public boolean updateImg(ProductVO vo) {
		return dao.updateImg(vo);
	}
	
	@Override
	public boolean delete_imgs (Map<String, Object > map) {
		return dao.delete_imgs(map);
	}
	
	@Override
	public boolean update_imgs (Map<String, Object > map) {
		return dao.update_imgs(map);
	}
	
	@Override
	public boolean new_imgs (Map<String, Object > map) {
		return dao.new_imgs(map);
	}
}
