package Controller.com;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;

import ServiceInterface.com.ComputerServiceInterface;
import net.sf.json.JSONArray;

@Controller
public class ControllerAlipay {

	
	//支付成功返回游客页面
		@RequestMapping("/Return_url")
		public String Return(HttpServletRequest request) throws AlipayApiException, UnsupportedEncodingException{
			System.out.println("支付成功-----返回，首页");		
			//获取支付宝GET过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			Map<String,String[]> requestParams = request.getParameterMap();
			for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			}
			
			boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

			//——请在这里编写您的程序（以下代码仅作参考）——
			if(signVerified) {
				//商户订单号
				String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");		
				//支付宝交易号
				String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");		
				//付款金额
				String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");			
				System.out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
				
				//Integer label = alipayService.DepositSQL(out_trade_no,trade_no,total_amount,request); 
				
				return "Return-url";
			}else {
				System.out.println("支付失败");
				return "";
			}	
		}
		@Resource
		private ComputerServiceInterface computerServiceInterface;
		
		@RequestMapping("/ReturnSH_url")
		public void ReturnSH(HttpServletRequest request) throws UnsupportedEncodingException {
				//获取支付宝POST过来反馈信息
				Map<String,String> params = new HashMap<String,String>();
				Map<String,String[]> requestParams = request.getParameterMap();
				for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
					String name = (String) iter.next();
					String[] values = (String[]) requestParams.get(name);
					String valueStr = "";
					for (int i = 0; i < values.length; i++) {
						valueStr = (i == values.length - 1) ? valueStr + values[i]
								: valueStr + values[i] + ",";
					}
					//乱码解决，这段代码在出现乱码时使用
					valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
					params.put(name, valueStr);
				}
				try {
					boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
					//——请在这里编写您的程序（以下代码仅作参考）——
					
					/* 实际验证过程建议商户务必添加以下校验：
					1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
					2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
					3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
					4、验证app_id是否为该商户本身。
					*/
					if(signVerified) {//验证成功
						//商户订单号
						String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
					
						//支付宝交易号
						String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
					
						//交易状态
						String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
						
						//金额
						String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
						
						if(trade_status.equals("TRADE_FINISHED")){
							//判断该笔订单是否在商户网站中已经做过处理
							//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
							//如果有做过处理，不执行商户的业务程序
								
							//注意：
							//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
						}else if (trade_status.equals("TRADE_SUCCESS")){
							//判断该笔订单是否在商户网站中已经做过处理
							//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
							//如果有做过处理，不执行商户的业务程序
							System.out.println("TRADE_SUCCESS");
							System.out.println(total_amount);
							
							computerServiceInterface.UpOrder(out_trade_no,trade_no);
							//注意：
							//付款完成后，支付宝系统发送该交易状态通知

						}
						
						System.out.println("success");
						
					}else {//验证失败
						System.out.println("fail");
					
						//调试用，写文本函数记录程序运行情况是否正常
						//String sWord = AlipaySignature.getSignCheckContentV1(params);
						//AlipayConfig.logResult(sWord);
					}
					
					//——请在这里编写您的程序（以上代码仅作参考）——
				} catch (AlipayApiException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} //调用SDK验证签名

				
		}
		//取消与退款
		@RequestMapping("/MyRefund")
		public String MyRefund(String Oid,Model mm) {
			List<Map<String, Object>> ret = computerServiceInterface.MyRefund(Integer.valueOf(Oid));			
			JSONArray json = JSONArray.fromObject(ret);
			mm.addAttribute("MyRefund", json);
			return "MyRefund";
		}
		@RequestMapping("/MyRefundID")
		@ResponseBody
		public Integer MyRefundID(String Oid) {
			List<Map<String, Object>> ret = computerServiceInterface.MyRefundID(Oid);
			if("待支付".equals(ret.get(0).get("label"))) {//取消
				return computerServiceInterface.cancelOrder(Integer.valueOf(Oid));
			}else if ("已支付".equals(ret.get(0).get("label"))) {//退款
				return computerServiceInterface.alipay(ret);
			}
			return 0;
		}
}
