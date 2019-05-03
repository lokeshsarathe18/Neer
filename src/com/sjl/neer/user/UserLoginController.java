package com.sjl.neer.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sjl.neer.utility.NeerOTP;
import com.sjl.neer.worker.WorkerDAO;

@WebServlet("/UserLoginController")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		RequestDispatcher rd = null;
		UserDTO dto = new UserDTO();
		UserDAO dao = new UserDAO();
		String option = request.getParameter("option");

		if (option.equalsIgnoreCase("login")) {
			HashMap<Integer, String> map = dao.checkUser(request.getParameter("username"),
					request.getParameter("password"));
			if (map != null) {
				Set<Integer> keys = map.keySet();
				for (int k : keys) {
					if (map.get(k).equalsIgnoreCase("o")) {
						HttpSession hs = request.getSession();
						hs.setAttribute("user_id", k);
						hs.setAttribute("unique_id", request.getParameter("username"));
						hs.setAttribute("Customer_type", map.get(k));
						response.sendRedirect("home_owner.jsp");
					} else if (map.get(k).equalsIgnoreCase("w")) {
						HttpSession hs = request.getSession();
						hs.setAttribute("user_id", k);
						hs.setAttribute("unique_id", request.getParameter("username"));
						hs.setAttribute("Customer_type", map.get(k));
						hs.setAttribute("company_id", new WorkerDAO().getCompanyId(k));
						response.sendRedirect("home_worker.jsp");
					} else if (map.get(k).equalsIgnoreCase("u")) {
						HttpSession hs = request.getSession();
						hs.setAttribute("user_id", k);
						hs.setAttribute("unique_id", request.getParameter("username"));
						hs.setAttribute("Customer_type", map.get(k));
						response.sendRedirect("home_user.jsp");
					}
				}
			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Please Enter Valid Uname & Password')</script>\n" + "    ");
				rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
		} else if (option.equalsIgnoreCase("next")) {
			dto.setCustomer_type(request.getParameter("customer_type").charAt(0));
			dto.setDob(request.getParameter("dob"));
			dto.setGender(request.getParameter("gender").charAt(0));
			dto.setMobile_no(request.getParameter("mobile_no"));
			dto.setName(request.getParameter("name"));
			dto.setPassword(request.getParameter("password"));
			dto.setPicture(request.getParameter("picture"));
			dto.setUnique_id(request.getParameter("unique_id"));
			int otp = NeerOTP.RandomOTP();
			NeerOTP.MessageOTP(dto.getMobile_no(), otp, dto.getUnique_id());
			HttpSession session = request.getSession();
			session.setAttribute("dto", dto);
			session.setAttribute("otp", otp);
			rd = request.getRequestDispatcher("signup_otp.jsp");
			rd.forward(request, response);
		} else if (option.equalsIgnoreCase("signup")) {
			dto = (UserDTO) request.getSession().getAttribute("dto");
			System.out.println(dto.getUnique_id());
			System.out.println(request.getParameter("otp"));
			System.out.println(request.getParameter("checkotp"));
			if (request.getParameter("otp").equalsIgnoreCase(request.getParameter("checkotp"))) {
				if (dao.addUser(dto)) {
					request.getSession().removeAttribute("dto");
					request.getSession().removeAttribute("otp");
					PrintWriter out = response.getWriter();
					out.print("<script>alert('Successfully Signed-up')</script>\n" + "    ");
					rd = request.getRequestDispatcher("login.jsp");
					rd.include(request, response);
				} else {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('Sign-Up Failed')</script>\n" + "    ");
					rd = request.getRequestDispatcher("signup.jsp");
					rd.include(request, response);
				}
			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Enter correct OTP')</script>\n" + "    ");
				rd = request.getRequestDispatcher("signup_otp.jsp");
				rd.include(request, response);
			}
		}
	}
}