package ControllerMapper.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MyMapper {

	List<Map<String, Object>> ShoppingCart(@Param("username")String username);

	Integer UpDataShopping(@Param("Sid")Integer Sid, @Param("data")Integer data);

	List<Map<String, Object>> MyOrder(@Param("username")String username);

	Integer NewAddress(@Param("username")String username, @Param("name")String name, @Param("phone")String phone, @Param("address")String address);

	List<Map<String, Object>> addressMessage(@Param("username")String username);

	Integer MyupdataMessage(@Param("Aid")Integer Aid, @Param("label")Integer label, @Param("data")String data);

	List<Map<String, Object>> MyAddressMessage(@Param("username")String username);

	List<Map<String, Object>> Mylogistics(@Param("username")String username);

}
