package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/upload2.do")
public class UploadServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//1 경
		String savePath = "upload";
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		//2 파일크기
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		
		//3 인코딩타입
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				uploadFileSizeLimit,
				encType,
				new DefaultFileRenamePolicy()
				);
		// 업로드할 파일이 여러개이므로...
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String file = (String)files.nextElement();
			String fileName = multi.getFilesystemName(file);
			
			//중복된 파일을 업로드할 경우... 파일이름이 바뀐다.
			String ori_file_name = multi.getOriginalFileName(file);
			out.print("<br>업로드된 파일명 : " + fileName);
			out.print("<br>원본파일명 : " + ori_file_name);
			out.print("<br><img src=p4.jpeg>");
		}
		
	}

}
