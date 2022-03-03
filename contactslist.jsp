<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ZOHO Contacts App</title>
  <style>
    #contacts_list {
      min-width: 500px;
      width: 80%;
    }

    #contacts_list th {
      background-color: lightblue;
    }

    #contacts_form input[type="text"],input[type="email"] {
      width: 250px;
      height: 30px;
    }

    #contacts_form input[type="submit"] {
      
      height: 40px;
    

      background-color: lightblue;
    }
  </style>
</head>
<body>
  <div>
    <center>
      <h1>Contacts Form and Contacts List</h1>
      <div>
        <h2>Add Contacts</h2>
        <form id="contacts_form" method="post" action="add_contact.jsp">
          <table cellpadding="5px">
            <tr>
              <th style="text-align: left;">Name </th>
              <td>: &nbsp;<input type="text" name="cname" required/></td>
            </tr>
            <tr>
              <th style="text-align: left;">Phone No  </th>
              <td>: &nbsp;<input type="text" name="cphone" required/></td>
            </tr>
            <tr>
              <th style="text-align: left;" >Email </th>
              <td>: &nbsp;<input type="email" name="cmail" required/></td>
            </tr>
            <tr>
              <th></th>
              <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="Add Contact">
              </td>
            </tr>
          </table>
        </form>
      </div>

      <div>

        <h2>My Contacts</h2>
        <table id="contacts_list" border="2" cellpadding="5px">
          <tr>
            <th><p>Name</p></th>
            <th><p>Phone Number</p></th>
            <th><p>Email &nbsp;Address</p></th>
          </tr>

          <%

            Connection conn = null;
            PreparedStatement ps = null;

            try {

                Class.forName("oracle.jdbc.driver.OracleDriver");

                String dbUser = "mohan";
                String dbPasswd = "root";

                String email = (String)session.getAttribute("email");
                String columnName = "contactstable";
                String table = "zohousers";

                String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
                conn = DriverManager.getConnection(dbURL,dbUser,dbPasswd);
                //out.print("Connection Successful..!<br>");

                Statement stmt = conn.createStatement();  

                String query ="Select " + columnName +" from " + table + " where email = '" + email + "'";
                ResultSet rset = stmt.executeQuery(query);
                if(rset.next()) {

                  String ctable = rset.getString(1);

                  // out.print(ctable);

                  query = "select * from " + ctable;

                  ResultSet rs = stmt.executeQuery(query);

                  while(rs.next()) {

                    String name = rs.getString(1);
                    String phone = rs.getString(2);
                    String mail = rs.getString(3);

                    out.println("<tr>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + phone + "</td>");
                    out.println("<td>" + mail + "</td>");
                    out.println("</tr>");

                  }

                }
                

                conn.commit();

              } catch(Exception e) {

                out.print(e);
              
              }

          %>

        </table>
      </div>
  </center>
  </div>
</body>
</html>