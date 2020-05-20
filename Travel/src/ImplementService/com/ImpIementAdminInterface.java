package ImplementService.com;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ControllerMapper.dao.AdminMapper;
import ServiceInterface.com.AdminInterface;

@Service("adminInterface")
@Transactional
public class ImpIementAdminInterface implements AdminInterface{
	
	@Resource
	private AdminMapper adminMapper;

	//登录
	public String Login(String name, String password) {
		try {
			return adminMapper.Login(name,password);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//获取用户信息
	public List<Map<String, Object>> AdminDomesticConsume() {
		try {
			return adminMapper.AdminDomesticConsume();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//商品管理
	public List<Map<String, Object>> AdminCommodity() {
		try {
			return adminMapper.AdminCommodity();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	@Override
	public List<Map<String, Object>> AdminOrderForm() {
		try {
			return adminMapper.AdminOrderForm();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//销量统计
	public List<Map<String, Object>> AdminSalesVolume() {
		try {
			return adminMapper.AdminSalesVolume();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//填写物流信息
	public Integer logistics(Integer Oid, String logistics) {
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
			System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			String loID = df.format(new Date());
			return adminMapper.logistics(Oid,logistics,loID);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//上架商品
	public Integer Putaway(String pp, String lx, String fl, String pm, String clq, String xk, String ms, String bq,
			String pz, String sj, String img) {
		try {
			Integer ret = adminMapper.Putaway(pp,lx,fl,pm,clq,xk,img,ms,bq);
			if(ret == 1) {
				List<Map<String, Integer>> id = adminMapper.id();
				Integer computerid = id.get(id.size()-1).get("id");
				return adminMapper.incomputer(computerid,pz,Double.valueOf(sj));
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//下架
	public Integer Del(Integer Mid) {
		try {
			return adminMapper.Del(Mid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//获取用户详细信息
	public List<Map<String, Object>> detailedInformation(String name) {
		try {
			return adminMapper.detailedInformation(name);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//删除用户
	public Integer removeUser(Integer id) {
		try {
			List<Map<String, Object>> user = adminMapper.removeUser(id);//获取
			Integer cin = adminMapper.cin(String.valueOf(user.get(0).get("name")),String.valueOf(user.get(0).get("password")));//备份
			if(cin == 1) {
				return adminMapper.remove(id);//删除
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
