package pay.dao;

import pay.vo.PayVO;

public interface PayDAO {
	boolean insert(PayVO vo);

	boolean insertdum(PayVO vo);
	
	boolean deletedum(String orderid);
}
