package Controller.com;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ServiceInterface.com.MyServiceInterface;
import net.sf.json.JSONArray;

@Controller
public class ContorllerMy {

	@Resource
	private MyServiceInterface myServiceInterface;
	
	
	//��ȡ�ҵĹ��ﳵ����
	@RequestMapping("/shoppingCart")
	@ResponseBody
	public JSONArray ShoppingCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		List<Map<String, Object>> ret = myServiceInterface.ShoppingCart(username);
		for(Map<String, Object> i:ret) {
			System.out.println(i);
			
		}
		JSONArray json = JSONArray.fromObject(ret);
		return json;
	}
	//���¹��ﳵ��������Ϣ
	@RequestMapping("/updata")
	@ResponseBody
	public Integer UpDataShopping(HttpServletRequest request,String Sid,String data) {
		
		return myServiceInterface.UpDataShopping(Integer.valueOf(Sid),Integer.valueOf(data));
	}
	
	//�ҵĶ�������
	@RequestMapping("/MyOrder")
	@ResponseBody
	public JSONArray MyOrder(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		List<Map<String, Object>> ret = myServiceInterface.MyOrder(username);
		for(Map<String, Object> i:ret) {
			System.out.println(i);
		}
		JSONArray json = JSONArray.fromObject(ret);
		return json;
	}
	
	//�ҵĵ�ַ  ����
	@RequestMapping("/NewAddress")
	@ResponseBody
	public Integer NewAddress(HttpServletRequest request ,String name,String phone,String address) {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		return myServiceInterface.NewAddress(username,name,phone,address);
			
	}
	//��ȡ�ҵĵ�ַ 
	@RequestMapping("/addressMessage")
	@ResponseBody
	public JSONArray addressMessage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		List<Map<String, Object>> ret = myServiceInterface.addressMessage(username);
		JSONArray json = JSONArray.fromObject(ret);
		return json;
		
		
	}
	//���µ�ַ��Ϣ
	@RequestMapping("/MyupdataMessage")
	@ResponseBody
	public Integer MyupdataMessage(String Aid,String label,String data) {
		return myServiceInterface.MyupdataMessage(Integer.valueOf(Aid),Integer.valueOf(label),data);	
	}
	
	//��ȡ�ҵĵ�ַ��Ϣ
	@RequestMapping("/MyAddressMessage")
	@ResponseBody
	public JSONArray MyAddressMessage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		List<Map<String, Object>> ret = myServiceInterface.MyAddressMessage(username);
		JSONArray json = JSONArray.fromObject(ret);
		return json;		
	}
	@RequestMapping("/defaultAddress")
	@ResponseBody
	public JSONArray defaultAddress(String Aid,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		List<Map<String, Object>> ret = myServiceInterface.MyAddressMessage(username);
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> i : ret) {
			if(Aid.equals(String.valueOf(i.get("Aid")))) {
				list.add(i);
			}
			
		}
		System.out.println(list);
		JSONArray json = JSONArray.fromObject(list);
		return json;
	}
	@RequestMapping("/Mylogistics")
	@ResponseBody
	public JSONArray Mylogistics(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String name = session.getAttribute("username").toString();
		List<Map<String, Object>> ret = myServiceInterface.Mylogistics(name);
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> i : ret) {
				if(!"200".equals(i.get("tab")) && !"100".equals(i.get("tab"))) {
					list.add(i);
				}			
		}
		JSONArray json = JSONArray.fromObject(list);
		return json;
	}
}
