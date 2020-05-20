package Unit;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.nio.channels.SeekableByteChannel;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class FileUtil {
		

	public void copyimgFile(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException  {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		String today = df.format(new Date());
		String str = today;
		String fileName = null;
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				int pre = (int) System.currentTimeMillis();
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					String myFileName = file.getOriginalFilename();
					
					if (myFileName.trim() != "") {
						System.out.println(myFileName+"--->>>>");
						fileName = "Upload"+"@"+str+ file.getOriginalFilename();
						//request.getSession().getServletContext().getRealPath("/") 获取项目在服务器绝对地址  
						String path = request.getSession().getServletContext().getRealPath("/")+"/images/Uploadingimg/"+ fileName;
						File localFile = new File(path);						
						file.transferTo(localFile);
							
						
					}
				}
				int finaltime = (int) System.currentTimeMillis();
				System.out.println(finaltime - pre);
			}

		}
		responseMessage(response,fileName);   
    }
	private void responseMessage(HttpServletResponse response,String fileName) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=" + "utf-8");
		Writer writer = null;
		try {
			writer = response.getWriter();
			writer.write("{\"code\":" + 200 + ",\"message\":\"" +fileName+ "\"}");
			writer.flush();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(writer);
		}
	}
	
}
