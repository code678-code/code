package ServiceInterface.com;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ComputerServiceInterface {

	List<Map<String, Object>> ComputerMeassage(String option);

	List<Map<String, Object>> buy_shopping(Integer computerid);

	List<Map<String, Object>> Computer(Integer id);

	List<Map<String, Object>> buyOrder(Integer valueOf);

	void createOrder(String name, String phone, String address, String orderID, String total, String id,
			String username,String dt);

	void UpOrder(String orderID,String payID);

	List<Map<String, Object>> MessageGroup(String one, String two, String three, String four, String five, String six);

	List<Map<String, Object>> SalesOrder(String primarygroup);

	List<Map<String, Object>> AscOrder(String primarygroup);

	Integer shoppingTrolley(String mid, String username, String data);

	List<Map<String, Object>> MyRefund(Integer valueOf);

	List<Map<String, Object>> MyRefundID(String oid);

	Integer cancelOrder(Integer valueOf);

	Integer alipay(List<Map<String, Object>> ret);


}
