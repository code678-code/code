package Controller.com;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ServiceInterface.com.LoginServiceInterface;

@Controller
public class ControllerLogin {

	//ע���¼����ӿ�
	@Resource
	private LoginServiceInterface loginServiceInterface;
	
	//��¼��֤
	@RequestMapping("/Login")
	public String Login(String name,String password,HttpServletRequest request) {		
		String ret = loginServiceInterface.Login(name,password);
		System.out.println(ret+"-------�û���---------");
		HttpSession session = request.getSession();
		if(ret != null) {
			session.setAttribute("username", ret);
			return "ComputerPage";			
		}else {
			return "forward:/Login.jsp";//ʧ��·������
		}
	}
	//ע���û�����֤
	@RequestMapping("/nameVerification")
	@ResponseBody
	public Integer nameVerification(String name) {
		Integer ret = loginServiceInterface.nameVerification(name);		
		return ret;
		
	}
	//ע��
	@RequestMapping("/register")
	@ResponseBody
	public Integer register(String name,String password) {
		System.out.println(name+"----------"+password);
		return loginServiceInterface.register(name,password);
	}
	
}
