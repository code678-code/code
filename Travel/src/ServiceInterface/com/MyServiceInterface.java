package ServiceInterface.com;

import java.util.List;
import java.util.Map;

public interface MyServiceInterface {

	List<Map<String, Object>> ShoppingCart(String username);

	Integer UpDataShopping(Integer valueOf, Integer valueOf2);

	List<Map<String, Object>> MyOrder(String username);

	Integer NewAddress(String username, String name, String phone, String address);

	List<Map<String, Object>> addressMessage(String username);

	Integer MyupdataMessage(Integer valueOf, Integer valueOf2, String data);

	List<Map<String, Object>> MyAddressMessage(String username);

	List<Map<String, Object>> Mylogistics(String name);

}
