package com.sjl.neer.worker;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WorkerController")
public class WorkerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		if (request.getParameter("otp").equalsIgnoreCase(request.getParameter("checkotp"))) {

			if (new WorkerDAO().addWorker(Integer.parseInt(request.getParameter("user_id")),
					Integer.parseInt(request.getParameter("company_id")))) {
				out.print("<script>alert('Worker Added')</script>\n" + "    ");
				request.getRequestDispatcher("show_workers.jsp?customer_type=w").include(request, response);
			} else {
				out.print("Fail to add worker");
				request.getRequestDispatcher("owner_addWorker.jsp").include(request, response);
			}
		} else {
			out.print("incorrect otp");
			request.getRequestDispatcher("owner_addWorker.jsp").include(request, response);
		}

	}

}
