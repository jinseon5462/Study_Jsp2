package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dto.CartDTO;
import dto.ProductDTO;

@WebServlet("/insertCart.do")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CartDAO cDao = new CartDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CartDTO> cartList = cDao.getCartList();
		request.setAttribute("cartList", cartList);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String[] pcode = request.getParameterValues("products");
		String[] pname = request.getParameterValues("pname");
		String[] price = request.getParameterValues("price");
		String[] photo = request.getParameterValues("photo");
		
		cDao.insertCart(pcode, pname, price, photo);
		doGet(request, response);
	}
}
