package com.sjl.neer.order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sjl.neer.company.CompanyDAO;
import com.sjl.neer.company.CompanyDTO;
import com.sjl.neer.user.UserDAO;
import com.sjl.neer.user.UserDTO;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		RequestDispatcher rd = null;
		OrderDTO dto = new OrderDTO();
		OrderDAO dao = new OrderDAO();
		String option = request.getParameter("option");

		if (option.equalsIgnoreCase("add_order")) {

			dto.setAddress(request.getParameter("address"));
			dto.setCity(request.getParameter("city"));
			dto.setState(request.getParameter("state"));
			dto.setCountry(request.getParameter("country"));
			dto.setLat(request.getParameter("lat"));
			dto.setLng(request.getParameter("lng"));
			dto.setDelivery_date_time(request.getParameter("Delivery_Date_Time"));
			dto.setMaximum_quantity(200);
			float cost = Float.parseFloat(request.getParameter("cost"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			dto.setOrdered_quantity(quantity);
			dto.setAmount(quantity * cost);
			dto.setOtp(request.getParameter("otp"));
			dto.setProduct_id((Integer.parseInt(request.getParameter("product_id"))));
			HttpSession hs = request.getSession();
			int user_id = (int) hs.getAttribute("user_id");
			dto.setUser_id(user_id);

			UserDAO udao = new UserDAO();
			UserDTO udto = udao.getUser(user_id);
			if (udto.getAddress() == null) {
				udto.setAddress(request.getParameter("address"));
				udto.setCity(request.getParameter("city"));
				udto.setState(request.getParameter("state"));
				udto.setCountry(request.getParameter("country"));
				udto.setLat(request.getParameter("lat"));
				udto.setLng(request.getParameter("lng"));
				udao.updateAddress(udto);
			}
			int order_id=dao.getOrderId(user_id, dto.getProduct_id());
			dto.setOrder_id(order_id);
			
			if ( order_id> 0) {
				quantity= quantity+ dao.getOrderQuantity(order_id);
				dto.setOrdered_quantity(quantity);
				dto.setAmount(quantity * cost);
				if (dao.updateOrder(dto)) {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('Successfully Placed Order')</script>\n" + "    ");
					rd = request.getRequestDispatcher("show_orders_user.jsp");
					rd.include(request, response);
				} else {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('Order Failed')</script>\n" + "    ");
					rd = request.getRequestDispatcher("user_addOrder.jsp");
					rd.include(request, response);
				}
			} else {
				if (dao.addOrder(dto)) {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('Successfully Placed Order')</script>\n" + "    ");
					rd = request.getRequestDispatcher("show_orders_user.jsp");
					rd.include(request, response);
				} else {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('Order Failed')</script>\n" + "    ");
					rd = request.getRequestDispatcher("user_addOrder.jsp");
					rd.include(request, response);
				}
			}
		}
		else if(option.equalsIgnoreCase("order_delivered")) {
			//get otp here
			String otp= request.getParameter("otp");
			String order_id= request.getParameter("order_id");
			
				if (dao.checkOtp(otp,order_id)) {
					
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Successfully Delivered Order')</script>\n" + "    ");
				rd = request.getRequestDispatcher("show_orders_worker.jsp");
				rd.include(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Incorrect OTP')</script>\n" + "    ");
				rd = request.getRequestDispatcher("show_orderdetails.jsp");
				rd.include(request, response);
			}
		}
	}
}
