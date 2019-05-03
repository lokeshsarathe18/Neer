package com.sjl.neer.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sjl.neer.user.UserDAO;
import com.sjl.neer.user.UserDTO;


@WebServlet("/CompanyController")
public class CompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");

		RequestDispatcher rd = null;
		CompanyDTO dto = new CompanyDTO();
		CompanyDAO dao = new CompanyDAO();
		String option = request.getParameter("option");

		if (option.equalsIgnoreCase("add_company")) {
		
		dto.setAddress(request.getParameter("address"));
		dto.setCity(request.getParameter("city"));
		dto.setCountry(request.getParameter("country"));
		dto.setLat(request.getParameter("lat"));
		dto.setLng(request.getParameter("lng"));
		dto.setMobile_no(request.getParameter("mobile_no"));
		dto.setName(request.getParameter("name"));
		dto.setOwner_id(request.getParameter("owner_id"));
		dto.setState(request.getParameter("state"));
		dto.setCovering_area(Float.parseFloat(request.getParameter("covering_area")));
			if(dao.addCompany(dto)) {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Successfully Added Company')</script>\n" + "    ");
				rd = request.getRequestDispatcher("show_companies_owner.jsp");
				rd.include(request, response);
			}else {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Register Company Failed')</script>\n" + "    ");
				rd = request.getRequestDispatcher("owner_addCompany.jsp");
				rd.include(request, response);
			}
		}
	}

}
