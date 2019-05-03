
<%
			session.removeAttribute("user_id");
			session.removeAttribute("unique_id");
			session.removeAttribute("Customer_type");
			response.sendRedirect("login.jsp");
	%>