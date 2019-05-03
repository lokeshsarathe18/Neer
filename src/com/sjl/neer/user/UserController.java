package com.sjl.neer.user;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	RequestDispatcher rd;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    		response.setContentType("text/html;charset=UTF-8");
    		RequestDispatcher rd = null;
    		UserDTO dto = new UserDTO();
    		UserDAO dao = new UserDAO();
    		String option = request.getParameter("option");
    		
    		if(option.equalsIgnoreCase("update_user")) {
    			dto.setAddress(request.getParameter("address"));
    			dto.setCity(request.getParameter("city"));
    			dto.setCountry(request.getParameter("country"));
    			dto.setLat(request.getParameter("lat"));
    			dto.setLng(request.getParameter("lng"));
    			dto.setMobile_no(request.getParameter("mobile_no"));
    			dto.setState(request.getParameter("state"));
    			dto.setName(request.getParameter("name"));
    			HttpSession session= request.getSession();
    			int user_id=(int)session.getAttribute("user_id");
    			dto.setUser_id(user_id);
    			if(dao.updateUser(dto)) {
    				PrintWriter out = response.getWriter();
					out.print("<script>alert('Profile Updation Successful')</script>\n" + "    ");
					rd = request.getRequestDispatcher("profile.jsp");
					rd.include(request, response);
				} else {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('Profile Updation Failed')</script>\n" + "    ");
					rd = request.getRequestDispatcher("updateprofile.jsp");
					rd.include(request, response);
				}
			
    		}


	}
}
