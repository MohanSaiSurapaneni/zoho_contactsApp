<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>

<%
	
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String secretCode = request.getParameter("secret_code");
	
	// out.println(email + " " + password);
	
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
		// out.print("Connection Successful..!<br>");

		Statement stmt = conn.createStatement();  

		Date d = new Date();  

		String contactsTableName = d.toString().replace(" ","").replace(":","");

		//out.println(date);

		String query = 	"insert into " + table + 
										" values ('" + email +"','" + password + "','" + secretCode + "','" + contactsTableName + "')";

			
		try {

			int i = stmt.executeUpdate(query);

			query = "create table " + contactsTableName + " ( "
							+ "name varchar(30), phone varchar(15), email varchar(35))";

			boolean isCreated = stmt.execute(query);

			session.setAttribute("email",email);  
			response.sendRedirect("./contactslist.jsp");

		} catch (Exception e) {

			session.setAttribute("email_exists",email);  
			response.sendRedirect("./signup.jsp");

		}
		
		conn.commit();
		conn.close();
		
	} catch(Exception e) {

		out.print(e);

	} finally {

		
	}
%>