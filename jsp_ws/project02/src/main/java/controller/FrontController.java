package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.ProductDAO;
import db.UserDAO;
import vo.ProductVO;
import vo.UserVO;


@WebServlet("/")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO udao = new UserDAO();
	ProductDAO pdao = new ProductDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String view = null;
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/list") || com.equals("/")) {
			request.setAttribute("pList", new ProductDAO().getList());
			view = "list.jsp";
		}else if(com.equals("/login.do")) {
			String id = request.getParameter("id" );
			String pw = request.getParameter("pw");
			
			UserVO user = udao.login(id, pw);
			view = "login.jsp";
			request.setAttribute("user", user);
			request.getRequestDispatcher(view).forward(request, response);
		}else if(com.equals("/addProduct.do")) {
			ServletContext application = request.getServletContext();
			MultipartRequest multi = new MultipartRequest(request, application.getRealPath("/files"), 100 * 1024 * 1024, "utf-8");
			File file = multi.getFile("img");
			ProductVO product = new ProductVO();
			
			product.setPname(multi.getParameter("pName"));
			product.setPinfo(multi.getParameter("pInfo"));
			product.setPrice(Integer.parseInt(multi.getParameter("price")));
			
			int result = pdao.insert(product, file);
			request.setAttribute("result", result);
			request.getRequestDispatcher("regProduct.jsp").forward(request, response);
		}else if(com.equals("/getList.do")) {
			ArrayList<ProductVO> list = pdao.getList();
			request.setAttribute("list", list);
			request.getRequestDispatcher("list.jsp").forward(request, response);
		}else if(com.equals("/addBasket.do")) {
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
