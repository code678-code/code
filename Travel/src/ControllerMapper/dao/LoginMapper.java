package ControllerMapper.dao;

import org.apache.ibatis.annotations.Param;

public interface LoginMapper {

	String Login(@Param("name")String name, @Param("password")String password);

	String nameVerification(@Param("name")String name);

	Integer register(@Param("name")String name, @Param("password")String password);

}
