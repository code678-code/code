package ControllerMapper.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ComputerMapper {

	List<Map<String, Object>> ComputerMeassage(@Param("option")String option);

	List<Map<String, Object>> buyShopping(@Param("id")Integer id);

	List<Map<String, Object>> Computer(@Param("id")Integer id);

	List<Map<String, Object>> buyOrder(@Param("id")Integer id);

	Integer createOrder(@Param("username")String username, @Param("name")String name, @Param("phone")String phone, 
			@Param("address")String address, @Param("orderID")String orderID, @Param("total")String total,
			@Param("OMid")String OMid, @Param("setUpTime")String setUpTime, @Param("dt")String dt);

	void UpOrder(@Param("orderID")String orderID, @Param("payID")String payID, @Param("payTime")String payTime);

	List<Map<String, Object>> MessageGroup(@Param("one")String one, @Param("two")String two, @Param("three")String three, 
			@Param("four")String four, @Param("five")String five, @Param("six")String six);

	List<Map<String, Object>> SalesOrder(@Param("primarygroup")String primarygroup);

	List<Map<String, Object>> AscOrder(@Param("primarygroup")String primarygroup);

	List<Map<String, Object>> shopping(@Param("Mid")Integer Mid, @Param("username")String username);

	Integer insertShopping(@Param("Mid")Integer Mid, @Param("username")String username, @Param("data")Integer data);

	void upDataString(@Param("id")Integer id, @Param("dt")Integer dt);

	List<Map<String, Object>> retData(@Param("orderID")String orderID);

	Integer sales(@Param("Mid")Integer Mid);

	void upData(@Param("Mid")Integer Mid, @Param("sum")Integer sum);

	List<Map<String, Object>> MyRefund(@Param("Oid")Integer Oid);

	Integer cancelOrder(@Param("Oid")Integer Oid);

	Integer RefundOrder(@Param("payID")String payID);




}
