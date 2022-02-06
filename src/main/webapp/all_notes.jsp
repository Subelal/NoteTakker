<%@page import="com.dbconnection.FactoryProvider"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Notes : Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div>
		<div class="container">
			<%@include file="navbar.jsp"%>
			<br>
			<h1 class="text-uppercase">All Notes</h1>

			<div class="row">
				<div class="col-12">

					<%
						Session s = FactoryProvider.getFactory().openSession();
						Query q = s.createQuery("from Note");
						List<Note> list = q.list();
						for (Note note : list) {
							//out.println(note.getId() + " : " + note.getTitle() + "<br>");
					%>

					<div class="card mt-3">
						<img class="card-img-top pl-4 pt-4 mx-auto" style="max-width:50px;" src="img/notepad.png" alt="Card image cap">
						<div class="card-body px-5">
							<h5 class="card-title">
							<%= note.getTitle() %>
							</h5>
							<p class="card-text">
							<%= note.getContent() %>
							</p>
							<p ><b class="text-primary"><%=note.getAddedDate() %></b></p>
							<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
							<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
							</div>
						</div>
					</div>

					<%
						}
						s.close();
					%>



				</div>

			</div>

		</div>
	</div>
</body>
</html>