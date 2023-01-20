package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductDTO;

@WebServlet("/getProductInfo.do")
public class GetProductInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProductDAO dao = new ProductDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pcode = request.getParameter("pcode");
		ProductDTO prod = dao.getProduct(pcode);
		request.setAttribute("prod", prod);
		request.getRequestDispatcher("product.jsp").forward(request, response);
	}

}
