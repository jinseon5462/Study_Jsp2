package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload.do")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String savePath = "upload";
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리 : " + uploadFilePath);
		
		MultipartRequest multi = new MultipartRequest(request, 
				uploadFilePath, //파일 저장경로
				uploadFileSizeLimit, //파일 최대 크기
				encType, //인코딩타입
				new DefaultFileRenamePolicy()); //중복된 파일이름 처리 정책
		String fileName = multi.getFilesystemName("uploadFile");
		
		if(fileName == null) {
			System.out.println("파일 업로드 되지 않음");
		}else {
			out.print("<br>이름 : " + multi.getParameter("name"));
			out.print("<br>파일명 : " + fileName);
			out.print("<img src=upload/"+fileName+">");
		}
	}

}
