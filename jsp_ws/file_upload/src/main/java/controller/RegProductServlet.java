package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/regProd.do")
public class RegProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 필요한 것들 : request객체, 파일 저장경로(upload), 파일 최대 사이즈, 인코딩 방식, 파일이름 중복 처리
		String savePath = "upload";
		ServletContext ctx = getServletContext();
		String uploadFilePath = ctx.getRealPath(savePath);
		
		int fileMaxSize = 5 * 1024 * 1024;
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				fileMaxSize,
				encType,
				new DefaultFileRenamePolicy()
				);
		String fileName = multi.getFilesystemName("photo");
		System.out.println(fileName);
		String pcode = multi.getParameter("pcode");
		String pname = multi.getParameter("pname");
		String price = multi.getParameter("price");
		String desc = multi.getParameter("desc");
		
		int result = 0;
		String query = "INSERT INTO product VALUES (?, ?, ?, ?, ?)";
		Connection con = null;
		PreparedStatement pstmt = null;
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				con = DriverManager.getConnection(
						"jdbc:mariadb://localhost:3306/myshop",
						"root",
						"1234"
						);
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, pcode);
				pstmt.setString(2, pname);
				pstmt.setInt(3, Integer.parseInt(price));
				pstmt.setString(4, desc);
				pstmt.setString(5, fileName);
				result = pstmt.executeUpdate();
				
				if(result == 1) {
					response.sendRedirect("productList.jsp");
				}else {
					response.sendRedirect("fail.jsp");
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			
	}
}
