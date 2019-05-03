<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Company Home</title>
</head>
<body>

	<div class="text-center">
		<a href="owner_addProduct.jsp?company_id=<%=request.getParameter("company_id")%>"
			class="btn btn-primary btn-icon-split btn-lg"> <span class="text">Add
				Product</span>
		</a>
		<%
		//	h.setAttribute("company_id", request.getParameter("company_id"));
		%>
	</div>

</body>
</html>