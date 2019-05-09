package product.service;

import java.util.List;
import java.util.Map;

import product.vo.ProductVO;

public interface ProductService {
	//CRUD
	boolean insert(ProductVO vo);
	boolean insertImg(ProductVO vo);
	boolean addImg(ProductVO vo);
	ProductVO detail(int product_id);
	boolean update(ProductVO vo);
	boolean updateImg(ProductVO vo);
	boolean delete(int product_id);
	List<ProductVO> list(String kind);
	List<ProductVO> detailPage(int product_id);
	boolean delete_imgs (Map<String, Object > map);
	boolean update_imgs (Map<String, Object > map);
	boolean new_imgs (Map<String, Object > map);
}

