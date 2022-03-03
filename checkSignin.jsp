<%@ page import="java.sql.*" %>

<%
	
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	out.println(email + " " + password);
	
	//Connection to database
	/*Class.forName("com.mysql.jdbc.Driver");
	Connection
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gec","root","root");*/
	Connection conn = null;
	PreparedStatement ps = null;
	
	try {

		Class.forName("oracle.jdbc.driver.OracleDriver");

		String dbUser = "mohan";
		String dbPasswd = "root";
		String table = "zohousers";

		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		out.print("Connection Successful..!<br>");

		Statement stmt = conn.createStatement();  

		String query = "select * from " + table + " where email='" + email+"'";

		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()) {

			String qmail = rs.getString(1);
			String qpassword = rs.getString(2);

			if(qpassword.equals(password)) { 

				session.setAttribute("email",email);  
				response.sendRedirect("./contactslist.jsp");
				

			} else {

				session.setAttribute("invalidUsernamePassword",email);  
				response.sendRedirect("./signin.jsp");
				
			}

		} else {

			session.setAttribute("invalidUsernamePassword",email);  
			response.sendRedirect("./signin.jsp"); 


		}
		
		conn.commit();
		conn.close();
		
	} catch(Exception e) {

		out.print(e);

	} finally {

		
	}
%>