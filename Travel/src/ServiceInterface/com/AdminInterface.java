package ServiceInterface.com;

import java.util.List;
import java.util.Map;

public interface AdminInterface {

	String Login(String name, String password);

	List<Map<String, Object>> AdminDomesticConsume();

	List<Map<String, Object>> AdminCommodity();


	List<Map<String, Object>> AdminOrderForm();

	List<Map<String, Object>> AdminSalesVolume();

	Integer logistics(Integer valueOf, String logistics);

	Integer Putaway(String pp, String lx, String fl, String pm, String clq, String xk, String ms, String bq, String pz,
			String sj, String img);

	Integer Del(Integer valueOf);

	List<Map<String, Object>> detailedInformation(String name);

	Integer removeUser(Integer valueOf);

}
