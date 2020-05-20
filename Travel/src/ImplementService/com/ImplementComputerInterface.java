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
	
	//ѡ���ȡȫ������  List ����
	public List<Map<String, Object>> ComputerMeassage(String option) {
		try {
			
			
			return computerMapper.ComputerMeassage(option);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//������Ʒ��ϸ��Ϣ
	public List<Map<String, Object>> buy_shopping(Integer computerid) {
		try {
			return computerMapper.buyShopping(computerid);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//��Ʒ
	public List<Map<String, Object>> Computer(Integer id) {
		try {
			return computerMapper.Computer(id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//�µ���ȡ��Ʒ��Ϣ
	public List<Map<String, Object>> buyOrder(Integer valueOf) {
		try {
			return computerMapper.buyOrder(valueOf);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//��������
	public void createOrder(String name, String phone, String address, String orderID, String total, String id,
			String username,String dt) {
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
			String SetUpTime = df.format(new Date());//��������ʱ��
			Integer ret = computerMapper.createOrder(username,name,phone,address,orderID,total,id,SetUpTime,dt);
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	//֧���ɹ����¶���
	public void UpOrder(String orderID, String payID) {
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
			String payTime = df.format(new Date());//����֧��ʱ��
			computerMapper.UpOrder(orderID,payID,payTime);
			List<Map<String, Object>> ret = computerMapper.retData(orderID);
			Integer Mid = Integer.valueOf(String.valueOf(ret.get(0).get("OMid")));//��Ʒid
			Integer sales = computerMapper.sales(Mid);
			Integer data = Integer.valueOf(String.valueOf(ret.get(0).get("data")));//����
			Integer sum = sales + data;
			computerMapper.upData(Mid,sum);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	//�����Ϣɸѡ
	public List<Map<String, Object>> MessageGroup(String one, String two, String three, String four, String five,
			String six) {
		try {	
			return computerMapper.MessageGroup(one,two,three,four,five,six);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//��������
	public List<Map<String, Object>> SalesOrder(String primarygroup) {
		try {
			return computerMapper.SalesOrder(primarygroup);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//�۸���������
	public List<Map<String, Object>> AscOrder(String primarygroup) {
		try {
			return computerMapper.AscOrder(primarygroup);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	//���빺�ﳵ
	public Integer shoppingTrolley(String mid, String username, String data) {
		try {
			System.out.println(mid+","+username+","+data);
			Integer dt =0;
			if("".equals(data) || data == null) {
				dt =1;
			}else {
				dt = Integer.valueOf(data);
			}
			//���ж��Ƿ��Ѿ��ղ�����
			List<Map<String, Object>> ret = computerMapper.shopping(Integer.valueOf(mid),username);//��ȡ����
			System.out.println(ret+"-----------");
			if(ret.size() == 0) {//������---�������
				System.out.println("---------������---------");
				computerMapper.insertShopping(Integer.valueOf(mid),username,dt);//����
				return 1;
			}else {//���� ---��������
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

	//ȡ������
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
				//��ó�ʼ����AlipayClient
				///alipay.trade.page.pay-JAVA-UTF-8/WebContent/index.jsp
				AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
				
				//�����������
				AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();
				try {
					String text ="����";
					//�̻������ţ��̻���վ����ϵͳ��Ψһ������
					//String out_trade_no = new String(out_trade.getBytes("ISO-8859-1"),"UTF-8");
					//֧�������׺�
					String trade_no = new String(ID.getBytes("ISO-8859-1"),"UTF-8");
					//���ѡһ����
					//��Ҫ�˿�Ľ��ý��ܴ��ڶ���������
					String refund_amount = new String(total_amount.getBytes("ISO-8859-1"),"UTF-8");
					//�˿��ԭ��˵��
					String refund_reason = new String(text.getBytes("ISO-8859-1"),"UTF-8");
					//��ʶһ���˿�����ͬһ�ʽ��׶���˿���Ҫ��֤Ψһ�����貿���˿��˲����ش�
					//String out_request_no = new String(request.getParameter("WIDTRout_request_no").getBytes("ISO-8859-1"),"UTF-8");
					
					alipayRequest.setBizContent("{\"trade_no\":\""+ trade_no +"\"," 					
							+ "\"refund_amount\":\""+ refund_amount +"\"," 
							+ "\"refund_reason\":\""+ refund_reason +"\"}");
					try {
						//����
						String result = alipayClient.execute(alipayRequest).getBody();
						
						Map<String, String> mapend = Refund(result);//תmap���鷽��
						System.out.println("---------"+mapend);
						if(mapend.get("code").equals("10000")) {//�˿�ɹ�
							return computerMapper.RefundOrder(trade_no);
						}else {//�˿�ʧ��
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
	//�˿�json�ַ���תmap����
		private Map<String, String> Refund(String result) {			
			Map<String, String> data = new HashMap<String, String>();
		    // ��json�ַ���ת����jsonObject
		    JSONObject jsonObject = JSONObject.fromObject(result);
		    Iterator ite = jsonObject.keys();
		    // ����jsonObject����,��ӵ�Map����
		    while (ite.hasNext()) {
		        String key = ite.next().toString();
		        String value = jsonObject.get(key).toString();
		        data.put(key, value);
		    }
		    String alipay_trade_refund_response = data.get("alipay_trade_refund_response");	  
		    System.out.println(alipay_trade_refund_response+"----alipay_trade_refund_response----");		    
		    Map<String, String> data1 = new HashMap<String, String>();
		    // ��json�ַ���ת����jsonObject
		    JSONObject jsonObject1 = JSONObject.fromObject(alipay_trade_refund_response);
		    Iterator ite1 = jsonObject1.keys();
		    // ����jsonObject����,��ӵ�Map����
		    while (ite1.hasNext()) {
		        String key = ite1.next().toString();
		        String value = jsonObject1.get(key).toString();
		        data1.put(key, value);
		    }
		    System.out.println(data1+"=============");
			return data1;
		}

}
