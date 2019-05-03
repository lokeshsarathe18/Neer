package com.sjl.neer.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sjl.neer.company.CompanyDAO;
import com.sjl.neer.company.CompanyDTO;


@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html;charset=UTF-8");

		RequestDispatcher rd = null;
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();
		String option = request.getParameter("option");

		if (option.equalsIgnoreCase("add_product")) {
		
			dto.setCost(Float.parseFloat(request.getParameter("cost")));
			dto.setName(request.getParameter("pname"));
			dto.setQuantity(Float.parseFloat(request.getParameter("quantity")));
			dto.setCompany_id(Integer.parseInt(request.getParameter("company_id")));
		
			
			
			
			if(dao.addProduct(dto)) {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Successfully Added Product')</script>\n" + "    ");
				rd = request.getRequestDispatcher("home_owner.jsp");
				rd.include(request, response);
			}else {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Product Entry Failed')</script>\n" + "    ");
				rd = request.getRequestDispatcher("owner_addProduct.jsp");
				rd.include(request, response);
			}
		}

	}

}
