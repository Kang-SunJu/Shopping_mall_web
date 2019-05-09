package pay.service;

import pay.vo.PayVO;

public interface PayService {
	boolean insert(PayVO vo);
	boolean insertdum(PayVO vo);
	boolean deletedum(String orderid);
}
