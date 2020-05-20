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

	//��¼
	public String Login(String name, String password) {
		try {
			return adminMapper.Login(name,password);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//��ȡ�û���Ϣ
	public List<Map<String, Object>> AdminDomesticConsume() {
		try {
			return adminMapper.AdminDomesticConsume();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//��Ʒ����
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

	//����ͳ��
	public List<Map<String, Object>> AdminSalesVolume() {
		try {
			return adminMapper.AdminSalesVolume();
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//��д������Ϣ
	public Integer logistics(Integer Oid, String logistics) {
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//�������ڸ�ʽ
			System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
			String loID = df.format(new Date());
			return adminMapper.logistics(Oid,logistics,loID);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//�ϼ���Ʒ
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

	//�¼�
	public Integer Del(Integer Mid) {
		try {
			return adminMapper.Del(Mid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//��ȡ�û���ϸ��Ϣ
	public List<Map<String, Object>> detailedInformation(String name) {
		try {
			return adminMapper.detailedInformation(name);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//ɾ���û�
	public Integer removeUser(Integer id) {
		try {
			List<Map<String, Object>> user = adminMapper.removeUser(id);//��ȡ
			Integer cin = adminMapper.cin(String.valueOf(user.get(0).get("name")),String.valueOf(user.get(0).get("password")));//����
			if(cin == 1) {
				return adminMapper.remove(id);//ɾ��
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
