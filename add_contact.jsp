<%@ page import="java.sql.*" %>

<%
	
	String cname = request.getParameter("cname");
	String cphone = request.getParameter("cphone");
	String cmail = request.getParameter("cmail");	
	
	//out.println(email + " " + password);
	
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

		String email = (String)session.getAttribute("email");
		String columnName = "contactstable";
    String table = "zohousers";
    
		//String table = "zohouserslist";

		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		// out.print("Connection Successful..!<br>");

		Statement stmt = conn.createStatement();  

		String query ="Select " + columnName +" from " + table + " where email = '" + email + "'";
    ResultSet rset = stmt.executeQuery(query);

    if(rset.next()) {

      String ctable = rset.getString(1);

      // out.println(ctable);

			query = 	"insert into " + ctable + 
										" values ('" + cname +"','" + cphone + "','" + cmail +"')";

			int rowCount = stmt.executeUpdate(query);

			session.setAttribute("email",email);  
			response.sendRedirect("./contactslist.jsp");
		}
		
		conn.commit();
		conn.close();
		
	} catch(Exception e) {

		out.print(e);

	} finally {

		
	}
%>