package ImplementService.com;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.config.AlipayConfig;

import ControllerMapper.dao.ComputerMapper;
import ServiceInterface.com.ComputerServiceInterface;
import net.sf.json.JSONObject;


@Service("computerServiceInterface")
@Transactional
public class ImplementComputerInterface implements ComputerServiceInterface{

	@Resource
	private ComputerMapper computerMapper;
	
	//选择获取全部数据  List 集合
	public List<Map<String, Object>> ComputerMeassage(String option) {
		try {
			
			
			return computerMapper.ComputerMeassage(option);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//购买商品详细信息
	public List<Map<String, Object>> buy_shopping(Integer computerid) {
		try {
			return computerMapper.buyShopping(computerid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//商品
	public List<Map<String, Object>> Computer(Integer id) {
		try {
			return computerMapper.Computer(id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//下单获取商品信息
	public List<Map<String, Object>> buyOrder(Integer valueOf) {
		try {
			return computerMapper.buyOrder(valueOf);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//创建订单
	public void createOrder(String name, String phone, String address, String orderID, String total, String id,
			String username,String dt) {
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			String SetUpTime = df.format(new Date());//订单创建时间
			Integer ret = computerMapper.createOrder(username,name,phone,address,orderID,total,id,SetUpTime,dt);
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	//支付成功更新订单
	public void UpOrder(String orderID, String payID) {
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			String payTime = df.format(new Date());//订单支付时间
			computerMapper.UpOrder(orderID,payID,payTime);
			List<Map<String, Object>> ret = computerMapper.retData(orderID);
			Integer Mid = Integer.valueOf(String.valueOf(ret.get(0).get("OMid")));//商品id
			Integer sales = computerMapper.sales(Mid);
			Integer data = Integer.valueOf(String.valueOf(ret.get(0).get("data")));//数量
			Integer sum = sales + data;
			computerMapper.upData(Mid,sum);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	//组合信息筛选
	public List<Map<String, Object>> MessageGroup(String one, String two, String three, String four, String five,
			String six) {
		try {	
			return computerMapper.MessageGroup(one,two,three,four,five,six);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//销量排序
	public List<Map<String, Object>> SalesOrder(String primarygroup) {
		try {
			return computerMapper.SalesOrder(primarygroup);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//价格升序排序
	public List<Map<String, Object>> AscOrder(String primarygroup) {
		try {
			return computerMapper.AscOrder(primarygroup);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//加入购物车
	public Integer shoppingTrolley(String mid, String username, String data) {
		try {
			System.out.println(mid+","+username+","+data);
			Integer dt =0;
			if("".equals(data) || data == null) {
				dt =1;
			}else {
				dt = Integer.valueOf(data);
			}
			//先判断是否已经收藏数据
			List<Map<String, Object>> ret = computerMapper.shopping(Integer.valueOf(mid),username);//获取数量
			System.out.println(ret+"-----------");
			if(ret.size() == 0) {//不存在---添加数据
				System.out.println("---------无数据---------");
				computerMapper.insertShopping(Integer.valueOf(mid),username,dt);//插入
				return 1;
			}else {//存在 ---更新数据
				System.out.println(dt+"-----------");
				Integer in = Integer.valueOf(String.valueOf(ret.get(0).get("data"))) + dt;
				System.out.println(Integer.valueOf(String.valueOf(ret.get(0).get("Sid")))+"-----------"+in);
				computerMapper.upDataString(Integer.valueOf(String.valueOf(ret.get(0).get("Sid"))),in);
				return 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
		return 0;
	}

	//取消订单
	public List<Map<String, Object>> MyRefund(Integer Oid) {
		try {
			return computerMapper.MyRefund(Oid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	
	public List<Map<String, Object>> MyRefundID(String oid) {
		try {
			List<Map<String, Object>> ret = computerMapper.MyRefund(Integer.valueOf(oid));
			return ret;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	
	public Integer cancelOrder(Integer Oid) {
		try {
			return computerMapper.cancelOrder(Oid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	@Override
	public Integer alipay(List<Map<String, Object>> ret) {
				String ID = String.valueOf(ret.get(0).get("payID"));
				String total_amount = String.valueOf(ret.get(0).get("total"));
				//获得初始化的AlipayClient
				///alipay.trade.page.pay-JAVA-UTF-8/WebContent/index.jsp
				AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
				
				//设置请求参数
				AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();
				try {
					String text ="其他";
					//商户订单号，商户网站订单系统中唯一订单号
					//String out_trade_no = new String(out_trade.getBytes("ISO-8859-1"),"UTF-8");
					//支付宝交易号
					String trade_no = new String(ID.getBytes("ISO-8859-1"),"UTF-8");
					//请二选一设置
					//需要退款的金额，该金额不能大于订单金额，必填
					String refund_amount = new String(total_amount.getBytes("ISO-8859-1"),"UTF-8");
					//退款的原因说明
					String refund_reason = new String(text.getBytes("ISO-8859-1"),"UTF-8");
					//标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
					//String out_request_no = new String(request.getParameter("WIDTRout_request_no").getBytes("ISO-8859-1"),"UTF-8");
					
					alipayRequest.setBizContent("{\"trade_no\":\""+ trade_no +"\"," 					
							+ "\"refund_amount\":\""+ refund_amount +"\"," 
							+ "\"refund_reason\":\""+ refund_reason +"\"}");
					try {
						//请求
						String result = alipayClient.execute(alipayRequest).getBody();
						
						Map<String, String> mapend = Refund(result);//转map数组方法
						System.out.println("---------"+mapend);
						if(mapend.get("code").equals("10000")) {//退款成功
							return computerMapper.RefundOrder(trade_no);
						}else {//退款失败
							return 0;
						}
					} catch (AlipayApiException e) {				
						e.printStackTrace();
					}
				} catch (UnsupportedEncodingException e) {
					
					e.printStackTrace();
				}
				return 0;
	}
	//退款json字符串转map数组
		private Map<String, String> Refund(String result) {			
			Map<String, String> data = new HashMap<String, String>();
		    // 将json字符串转换成jsonObject
		    JSONObject jsonObject = JSONObject.fromObject(result);
		    Iterator ite = jsonObject.keys();
		    // 遍历jsonObject数据,添加到Map对象
		    while (ite.hasNext()) {
		        String key = ite.next().toString();
		        String value = jsonObject.get(key).toString();
		        data.put(key, value);
		    }
		    String alipay_trade_refund_response = data.get("alipay_trade_refund_response");	  
		    System.out.println(alipay_trade_refund_response+"----alipay_trade_refund_response----");		    
		    Map<String, String> data1 = new HashMap<String, String>();
		    // 将json字符串转换成jsonObject
		    JSONObject jsonObject1 = JSONObject.fromObject(alipay_trade_refund_response);
		    Iterator ite1 = jsonObject1.keys();
		    // 遍历jsonObject数据,添加到Map对象
		    while (ite1.hasNext()) {
		        String key = ite1.next().toString();
		        String value = jsonObject1.get(key).toString();
		        data1.put(key, value);
		    }
		    System.out.println(data1+"=============");
			return data1;
		}

}
