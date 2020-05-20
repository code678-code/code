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

	
	//֧���ɹ������ο�ҳ��
		@RequestMapping("/Return_url")
		public String Return(HttpServletRequest request) throws AlipayApiException, UnsupportedEncodingException{
			System.out.println("֧���ɹ�-----���أ���ҳ");		
			//��ȡ֧����GET����������Ϣ
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
				//����������δ����ڳ�������ʱʹ��
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			}
			
			boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //����SDK��֤ǩ��

			//�������������д���ĳ������´�������ο�������
			if(signVerified) {
				//�̻�������
				String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");		
				//֧�������׺�
				String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");		
				//������
				String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");			
				System.out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
				
				//Integer label = alipayService.DepositSQL(out_trade_no,trade_no,total_amount,request); 
				
				return "Return-url";
			}else {
				System.out.println("֧��ʧ��");
				return "";
			}	
		}
		@Resource
		private ComputerServiceInterface computerServiceInterface;
		
		@RequestMapping("/ReturnSH_url")
		public void ReturnSH(HttpServletRequest request) throws UnsupportedEncodingException {
				//��ȡ֧����POST����������Ϣ
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
					//����������δ����ڳ�������ʱʹ��
					valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
					params.put(name, valueStr);
				}
				try {
					boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
					//�������������д���ĳ������´�������ο�������
					
					/* ʵ����֤���̽����̻�����������У�飺
					1����Ҫ��֤��֪ͨ�����е�out_trade_no�Ƿ�Ϊ�̻�ϵͳ�д����Ķ����ţ�
					2���ж�total_amount�Ƿ�ȷʵΪ�ö�����ʵ�ʽ����̻���������ʱ�Ľ���
					3��У��֪ͨ�е�seller_id������seller_email) �Ƿ�Ϊout_trade_no��ʵ��ݵĶ�Ӧ�Ĳ��������е�ʱ��һ���̻������ж��seller_id/seller_email��
					4����֤app_id�Ƿ�Ϊ���̻�����
					*/
					if(signVerified) {//��֤�ɹ�
						//�̻�������
						String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
					
						//֧�������׺�
						String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
					
						//����״̬
						String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
						
						//���
						String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
						
						if(trade_status.equals("TRADE_FINISHED")){
							//�жϸñʶ����Ƿ����̻���վ���Ѿ���������
							//���û�������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
							//���������������ִ���̻���ҵ�����
								
							//ע�⣺
							//�˿����ڳ������˿����޺��������¿��˿��֧����ϵͳ���͸ý���״̬֪ͨ
						}else if (trade_status.equals("TRADE_SUCCESS")){
							//�жϸñʶ����Ƿ����̻���վ���Ѿ���������
							//���û�������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
							//���������������ִ���̻���ҵ�����
							System.out.println("TRADE_SUCCESS");
							System.out.println(total_amount);
							
							computerServiceInterface.UpOrder(out_trade_no,trade_no);
							//ע�⣺
							//������ɺ�֧����ϵͳ���͸ý���״̬֪ͨ

						}
						
						System.out.println("success");
						
					}else {//��֤ʧ��
						System.out.println("fail");
					
						//�����ã�д�ı�������¼������������Ƿ�����
						//String sWord = AlipaySignature.getSignCheckContentV1(params);
						//AlipayConfig.logResult(sWord);
					}
					
					//�������������д���ĳ������ϴ�������ο�������
				} catch (AlipayApiException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} //����SDK��֤ǩ��

				
		}
		//ȡ�����˿�
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
			if("��֧��".equals(ret.get(0).get("label"))) {//ȡ��
				return computerServiceInterface.cancelOrder(Integer.valueOf(Oid));
			}else if ("��֧��".equals(ret.get(0).get("label"))) {//�˿�
				return computerServiceInterface.alipay(ret);
			}
			return 0;
		}
}
