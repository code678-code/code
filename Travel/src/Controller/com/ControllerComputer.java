package Controller.com;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;

import ServiceInterface.com.ComputerServiceInterface;
import net.sf.json.JSONArray;

@Controller
public class ControllerComputer {

	
	@Resource
	private ComputerServiceInterface computerServiceInterface;
	
	@RequestMapping("/Main")
	public String Main() {		
		return "ComputerPage";
	}
	@RequestMapping("/My")
	public String My() {		
		return "My";
	}
	//加入购物车
	@RequestMapping("/shoppingTrolley")
	@ResponseBody
	public Integer shoppingTrolley(String Mid,HttpServletRequest request,String dt) {
		System.out.println(dt+"--------------------");
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		Integer ret = computerServiceInterface.shoppingTrolley(Mid,username,dt);		
		return ret;
	}
	//电脑选项
	@RequestMapping("/ComputerMessage")
	public String ComputerMeassage(String option,Model mm) {
		List<Map<String, Object>> ret = computerServiceInterface.ComputerMeassage(option);
		System.out.println("-------------ComputerMessage--------------");
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> i :ret) {
			System.out.println(i);
			if(Integer.valueOf(String.valueOf(i.get("tab"))) == 0) {
				list.add(i);
			}
		}		
		JSONArray jsonComputr = JSONArray.fromObject(list);
		mm.addAttribute("ComputerMessage", jsonComputr);
		return "ComputerMessage";
	}
	//选购购买
	@RequestMapping("/buy_shopping")
	public String buy_shopping(String id,Model mm,String Mid) {
		Integer computerid = Integer.valueOf(id);
		System.out.println(computerid+"----id--");
		List<Map<String, Object>> retComputer = computerServiceInterface.Computer(computerid);//商品信息
		List<Map<String, Object>> ret = computerServiceInterface.buy_shopping(computerid);//配置信息
		int le = ret.size()/3;
		int sum = le;
		if(ret.size()%3 ==0) {
			
		}else {
			sum = le+1;
		}
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(int i=0;i<ret.size();i++) {
			ret.get(i).put("echo",Mid);
			ret.get(i).put("sum", sum);
			list.add(ret.get(i));
			
		}
		System.out.println(list);
		JSONArray json1 = JSONArray.fromObject(retComputer);
		JSONArray json2 = JSONArray.fromObject(list);
		
		mm.addAttribute("computer", json1);
		mm.addAttribute("computerMessage", json2);
		System.out.println(retComputer+"\n"+ret);
		return "ComputerBook";
	}
	//下单
	@RequestMapping("/buy")
	public String Buy_Order(String id,String data,HttpServletRequest request,Model mm) {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		List<Map<String, Object>> ret = computerServiceInterface.buyOrder(Integer.valueOf(id));
		ret.get(0).put("data", data);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		int it = (int)(1+Math.random()*(10000000-1+1));
		String dt = String.valueOf(it);
		String IDorder = df.format(new Date())+dt;
		ret.get(0).put("orderID", IDorder);
		JSONArray jsonret = JSONArray.fromObject(ret);
		mm.addAttribute("Order", jsonret);
		return "ComputerOrder";
	}
	
	//提交订单
	@RequestMapping("/Order")
	@ResponseBody
	public String Order(String name,String phone,String address,String orderID,String dt,String total,HttpServletRequest request,String id) {
		try {
       		//获得初始化的AlipayClient
    		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);   		
    		//设置请求参数
    		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
    		alipayRequest.setReturnUrl(AlipayConfig.return_url);
    		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);    		
    		System.out.println(orderID+"--------------");
    		//商户订单号，商户网站订单系统中唯一订单号，必填
    		String out_trade_no = new String(orderID.getBytes("ISO-8859-1"),"UTF-8");
    		//付款金额，必填
    		String total_amount = new String(total.getBytes("ISO-8859-1"),"UTF-8");
    		//订单名称id，必填
    		String subject = new String(id.getBytes("ISO-8859-1"),"UTF-8");
    		//商品描述，可空
    		String body = new String(orderID.getBytes("ISO-8859-1"),"UTF-8");
    		
    		alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
    				+ "\"total_amount\":\""+ total_amount +"\"," 
    				+ "\"subject\":\""+ subject +"\"," 
    				+ "\"body\":\""+ body +"\"," 
    				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");    		
    		//扫描支付请求
    		String result = alipayClient.pageExecute(alipayRequest).getBody();    		
    		return result;

		} catch (Exception e) {			
			System.out.println(e);
		}finally {
			HttpSession session = request.getSession();
			String username = session.getAttribute("username").toString();
			System.out.println(name+"\n"+phone+"\n"+address+"\n"+orderID+"\n"+total+"\n"+id);
			computerServiceInterface.createOrder(name,phone,address,orderID,total,id,username,dt);
		}
		return "er";
	}
	//computerMessage页面信息组合筛选
	@RequestMapping("/MessageGroup")
	@ResponseBody
	public JSONArray MessageGroup(String one,String two,String three,String four,String five,String six) {
		System.out.println(one+"\n"+two+"\n"+three+"\n"+four+"\n"+five+"\n"+six);
		List<Map<String, Object>> Message = computerServiceInterface.MessageGroup(one,two,three,four,five,six);
		System.out.println(Message);
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> i :Message) {
			System.out.println(i);
			if(Integer.valueOf(String.valueOf(i.get("tab"))) == 0) {
				list.add(i);
			}
		}
		JSONArray json = JSONArray.fromObject(list);
		System.out.println(json);
		return json;
	}
	
	//销量排序
	@RequestMapping("/SalesOrder")
	@ResponseBody
	public JSONArray SalesOrder(String Primarygroup) {
		System.out.println("销量排序"+Primarygroup);
		List<Map<String, Object>> ret = computerServiceInterface.SalesOrder(Primarygroup);
		for(Map<String, Object> i :ret) {
			System.out.println(i);
		}
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> i :ret) {
			System.out.println(i);
			if(Integer.valueOf(String.valueOf(i.get("tab"))) == 0) {
				list.add(i);
			}
		}
		JSONArray json = JSONArray.fromObject(list);
		return json;	
	}
	//价格升序排序
	@RequestMapping("/AscOrder")
	@ResponseBody
	public JSONArray AscOrder(String Primarygroup) {
		List<Map<String, Object>> ret = computerServiceInterface.AscOrder(Primarygroup);
		for(Map<String, Object> i:ret) {
			System.out.println(i);
		}
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> i :ret) {
			System.out.println(i);
			if(Integer.valueOf(String.valueOf(i.get("tab"))) == 0) {
				list.add(i);
			}
		}
		JSONArray json = JSONArray.fromObject(list);		
		return json;
	}
	//价格降序排序
	@RequestMapping("/DescOrder")
	@ResponseBody
	public JSONArray DescOrder(String Primarygroup) {
		List<Map<String, Object>> ret = computerServiceInterface.AscOrder(Primarygroup);
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(int i=ret.size()-1;i>=0;i--) {
			list.add(ret.get(i));			
		}
		for(Map<String, Object> i :list) {
			System.out.println(i);
		}
		List<Map<String, Object>> retlist = new ArrayList<Map<String,Object>>();
		for(Map<String, Object> i :list) {
			System.out.println(i);
			if(Integer.valueOf(String.valueOf(i.get("tab"))) == 0) {
				retlist.add(i);
			}
		}
		JSONArray json = JSONArray.fromObject(retlist);		
		return json;
		
		
		
		
	}
}
