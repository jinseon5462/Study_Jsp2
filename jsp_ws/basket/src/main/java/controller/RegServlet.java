package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDAO;
import dto.ProductDTO;

@WebServlet("/reg.do")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAO dao = new ProductDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String savePath = "files";
		ServletContext ctx = getServletContext();
		String uploadFilePath = ctx.getRealPath(savePath);
		int fileMaxSize = 5 * 1024 * 1024;
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				fileMaxSize,
				encType
				);
		ProductDTO prod = new ProductDTO();
		prod.setPcode(multi.getParameter("pcode"));
		prod.setPname(multi.getParameter("pname"));
		prod.setPrice(Integer.parseInt(multi.getParameter("price")));
		prod.setPinfo(multi.getParameter("pinfo"));
		prod.setPhoto(multi.getFilesystemName("photo"));
		int result = dao.insert(prod);
		request.setAttribute("result", result);
		request.getRequestDispatcher("regProduct.jsp").forward(request, response);
	}
}
