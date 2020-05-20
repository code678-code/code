package ImplementService.com;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ControllerMapper.dao.MyMapper;
import ServiceInterface.com.MyServiceInterface;

@Service("myServiceInterface")
@Transactional
public class ImplementMyServiceInterface implements MyServiceInterface{
	
	
	@Resource
	private MyMapper myMapper;

	//��ȡ���ﳵ������
	public List<Map<String, Object>> ShoppingCart(String username) {
		try {
			return myMapper.ShoppingCart(username);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//�޸Ĺ��ﳵ����������
	public Integer UpDataShopping(Integer Sid, Integer data) {
		try {
			return myMapper.UpDataShopping(Sid,data);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//�ҵĶ�������
	public List<Map<String, Object>> MyOrder(String username) {
		try {
			return myMapper.MyOrder(username);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//����  �ҵĵ�ַ
	public Integer NewAddress(String username, String name, String phone, String address) {
		try {
			return myMapper.NewAddress(username,name,phone,address);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//��ȡ�ҵĵ�ַ��Ϣ
	public List<Map<String, Object>> addressMessage(String username) {
		try {
			return myMapper.addressMessage(username);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//���µ�ַ������Ϣ
	public Integer MyupdataMessage(Integer valueOf, Integer valueOf2, String data) {
		try {
			return myMapper.MyupdataMessage(valueOf,valueOf2,data);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//��ȡ�ҵĵ�ַ��Ϣ
	public List<Map<String, Object>> MyAddressMessage(String username) {
		try {
			return myMapper.MyAddressMessage(username);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//�ҵ�������Ϣ
	public List<Map<String, Object>> Mylogistics(String name) {
		try {
			return myMapper.Mylogistics(name);
		} catch (Exception e) {
			System.out.println();
		}
		return null;
	}

	

}
