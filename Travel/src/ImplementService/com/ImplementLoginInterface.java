package ImplementService.com;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ControllerMapper.dao.LoginMapper;
import ServiceInterface.com.LoginServiceInterface;

@Service("loginServiceInterface")
@Transactional
public class ImplementLoginInterface implements LoginServiceInterface{

	@Resource
	private LoginMapper loginMapper;

	//登录事务控制
	public String Login(String name, String password) {
		try {
			System.out.println(name+"--------"+password);
			return loginMapper.Login(name,password);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//用户名注册验证
	public Integer nameVerification(String name) {
		try {
			String ret =  loginMapper.nameVerification(name);
			if(ret !=null) {
				return 1;
			}
			return 0;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	@Override
	public Integer register(String name, String password) {
		try {
			return loginMapper.register(name,password);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	
}
