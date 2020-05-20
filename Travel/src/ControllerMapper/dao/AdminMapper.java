package ControllerMapper.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

	
	//µÇÂ¼
	String Login(@Param("name")String name, @Param("password")String password);

	List<Map<String, Object>> AdminDomesticConsume();

	List<Map<String, Object>> AdminCommodity();

	List<Map<String, Object>> AdminOrderForm();

	List<Map<String, Object>> AdminSalesVolume();

	Integer logistics(@Param("Oid")Integer oid, @Param("logistics")String logistics, @Param("loID")String loID);

	Integer Putaway(@Param("pp")String pp, @Param("lx")String lx, @Param("fl")String fl, @Param("pm")String pm, @Param("clq")String clq, 
			@Param("xk")String xk, @Param("img")String img, @Param("ms")String ms,@Param("bq")String bq);

	List<Map<String, Integer>> id();

	Integer incomputer(@Param("computerid")Integer computerid, @Param("pz")String pz, @Param("sj")Double sj);

	Integer Del(@Param("Mid")Integer Mid);

	List<Map<String, Object>> detailedInformation(@Param("name")String name);

	List<Map<String, Object>> removeUser(@Param("id")Integer id);

	Integer cin(@Param("name")String name, @Param("password")String password);

	Integer remove(@Param("id")Integer id);

}
