package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;


@WebServlet("/file.action")
public class FileServlet extends HttpServlet {

	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}

	public ServletConfig getServletConfig() {
		return config;
	}
   
    private String createFileUUID() {
    	String uuid = UUID.randomUUID().toString();
        return uuid.replaceAll("-", "");
    }
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		int count = 0;
		SmartUpload su = new SmartUpload();
		try {
			su.initialize(config, request, response);
			su.setAllowedFilesList("doc,txt,docx,rar,zip,7z,pdf");
			//su.setMaxFileSize(maxFileSize);
			//su.setTotalMaxFileSize(totalMaxFileSize);
			//su.setDeniedFilesList(deniedFilesList);
			su.upload();
			String opttype = su.getRequest().getParameter("opttype");
			if("fileupload".equals(opttype)) {
				for (int i = 0; i < su.getFiles().getCount(); i++) {
					com.jspsmart.upload.File file = su.getFiles().getFile(i);
					if (file.isMissing())
						continue;
					//��ȡ�ļ�����
					String fileExt=file.getFileExt();
				    int fileSize=file.getSize();
				    String fileName=file.getFileName();
				   // String fileClientPath=file.getFilePathName();
				   // String curPathId=(String)request.getSession().getAttribute("curPathId");
				    String newFileName=createFileUUID();
				    //д�����ݿ�
					count++;
					
					file.saveAs("/upload/" + file.getFileName(), su.SAVE_VIRTUAL);
					//file.saveAs("/upload/" + newFileName+"."+fileExt, su.SAVE_VIRTUAL);
					//file.saveAs("d:/upload/" + newFileName+"."+fileExt, su.SAVE_PHYSICAL);
					System.out.println(fileName+" "+fileExt+"::"+fileSize);
				}
			    out.println("����" + count + "���ļ��ϴ��ɹ�!");
			}
		} catch (Exception e) {
			out.println("Unable to upload the file.<br>");
			out.println("Error : " + e.toString());
		}
	}
}
