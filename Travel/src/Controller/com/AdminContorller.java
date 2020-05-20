package Controller.com;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ServiceInterface.com.AdminInterface;
import Unit.FileUtil;
import net.sf.json.JSONArray;

@Controller
public class AdminContorller {

	@Resource
	private AdminInterface adminInterface;
	
	@RequestMapping("/AdimLogin")
	public String AdminLogin(String name,String password,HttpServletRequest request,Model mm) {
		String sign = adminInterface.Login(name,password);
		
		if(sign != null) {
			if("0".equals(sign)) {
				HttpSession session = request.getSession();
				session.setAttribute("adminname", name);
				return "AdminIndex";
				
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("adminname", name);
				return "SuperAdmin";
			}
		}else {
			return "forward:/AdmLogin.jsp";//失败路径处理
		}
	}
	//主页
	@RequestMapping("/AdminIndex")
	public String AdminIndex() {
		
		return "AdminIndex";
	}
	 
	
	//用户管理
	@RequestMapping("/AdminDomesticConsumer")
	public String AdminDomesticConsume(Model mm) {
		List<Map<String, Object>> retList = adminInterface.AdminDomesticConsume();
		JSONArray UserMessage = JSONArray.fromObject(retList);
		mm.addAttribute("UserMessage", UserMessage);
		return "AdminDomesticConsumer";
	}
	
	//商品管理
	@RequestMapping("/AdminCommodity")
	public String AdminCommodity(Model mm) {
		List<Map<String, Object>> retList = adminInterface.AdminCommodity();
		JSONArray json = JSONArray.fromObject(retList);
		mm.addAttribute("AdminCommodity", json);
		return "AdminCommodity";
	}
	//商品上架
	@RequestMapping("/putaway")
	public String putaway() {
		
		return "AdminPutaway";
	}
	//订单管理
	@RequestMapping("/AdminOrderForm")
	public String AdminOrderForm(Model mm) {
		List<Map<String, Object>> retList = adminInterface.AdminOrderForm();//获取待处理订单
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> i :retList) {
			if((i.get("logisticsID") == null || i.get("logisticsID") =="") && (i.get("payID") != null || i.get("payID") != "")) {
				list.add(i);
			}
		}
		JSONArray json = JSONArray.fromObject(list);
		mm.addAttribute("AdminOrderForm", json);
		return "AdminOrderForm";
	}
	
	//销量统计管理
	@RequestMapping("/AdminSalesVolume")
	public String AdminSalesVolume(Model mm) {
		List<Map<String, Object>> retList = adminInterface.AdminSalesVolume();
		JSONArray json = JSONArray.fromObject(retList);
		mm.addAttribute("AdminSalesVolume", json);
		return "AdminSalesVolume";
	}
	
	//upOrder
	@RequestMapping("/upOrder")
	@ResponseBody
	public Integer upOrder(String Oid,String logistics) {
		return adminInterface.logistics(Integer.valueOf(Oid),logistics);
		
	}
	
	//Putaway上架商品
	@RequestMapping("/Putaway")
	@ResponseBody
	public Integer Putaway(String pp,String lx,String fl,String pm,String clq,String xk,String ms,String bq,String pz,String sj,String img) {
		
		return adminInterface.Putaway(pp,lx,fl,pm,clq,xk,ms,bq,pz,sj,img);
	}
	@RequestMapping("/fileClass")
	@ResponseBody
	//标题头图片上传
	public void uploadImg(HttpServletRequest request, HttpServletResponse response)throws IllegalStateException, IOException {
		System.out.println("upload start work.....");		
		new FileUtil().copyimgFile(request,response);

	}
	
	//下架
	@RequestMapping("/Del")
	@ResponseBody
	public Integer Del(String Mid) {
		return adminInterface.Del(Integer.valueOf(Mid));
	}
	
	//获取用户的详细信息
	@RequestMapping("/detailedInformation")
	@ResponseBody
	public JSONArray detailedInformation(String name) {
		List<Map<String, Object>> ret = adminInterface.detailedInformation(name);
		JSONArray json = JSONArray.fromObject(ret);
		return json;
		
	}
	//删除用户
	@RequestMapping("/remove")
	@ResponseBody
	public Integer removeUser(String id) {
		return adminInterface.removeUser(Integer.valueOf(id));
	}
}
