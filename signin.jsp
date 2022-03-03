<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>ZOHO Contacts App</title>
  <link rel="stylesheet" href="./style.css">

</head>
<body>

	<%

		if(session.getAttribute("invalidUsernamePassword") != null) {

			session.setAttribute("invalidUsernamePassword",null);

			out.println("<center><h1>Invalid Email Address / Password</h1></center>");

		}
	%>

<div>

	<form action="checkSignin.jsp" method="post">

	  <h2>Sign In</h2>

			<p >
				<p style="text-align: center;font-size: medium;">
					Don't have an account?, <a href="./signup.jsp" target="_self">Sign up</a>
				</p> 
			</p>

			<p>
				<label for="email" class="floatLabel">Email</label>
				<input id="email" name="email" type="email" required />
			</p>

			<p>
				<label for="password" class="floatLabel">Password</label>
				<input id="password" name="password" type="password" required />
				
			</p>

			<p>
				<input type="submit" value="Sig In" id="submit">
			</p>
	    
	</form>

</div>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


</body>
</html>
