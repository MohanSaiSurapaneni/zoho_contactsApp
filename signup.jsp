<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>ZOHO Contacts App</title>
  <link rel="stylesheet" href="./style.css">

</head>
<body>
	<%
		if(session.getAttribute("email_exists") != null) {

			session.setAttribute("email_exists",null);

			out.println("<center><h1>Email Already Exists, Please Use Another or Sign In</h1></center>");

		}
	%>
<div>
	<form method="post" action="create_account.jsp">
		
	  <h2>Sign Up</h2>
	  
			<p >
				<p style="text-align: center;font-size: medium;">
					Already have an account?, <a href="./signin.jsp" target="_sel"f>Sign in</a>
				</p> 
			</p>

			<p>
				<label for="Email" class="floatLabel">Email</label>
				<input id="Email" name="email" type="email" required />
			</p>

			<p>
				<label for="password" class="floatLabel">Password</label>
				<input id="password" name="password" type="password" required minlength="8" maxlength="16"/>
				<span>Enter a password that is atleast 8 characters Long</span>
			</p>

			<p>
				<label for="confirm_password" class="floatLabel">Confirm Password</label>
				<input id="confirm_password" name="confirm_password" type="password" required minlength="8" maxlength="16" /> 
				<span>Your passwords do not match</span>
			</p>

	    <p>
				<label for="secret_code" class="floatLabel">Secret Code</label>
				<input id="secret_code" name="secret_code" type="password" required minlength="4" maxlength="16"/>
				<span>Secret Code should be atleast 4 characters Long</span>
			</p>

			<p>
				<input type="submit" value="Create  Account" id="submit">
			</p>

	    <p style="text-align: center; font-size: small;">
	      By clicking "Create Account" button you agree to the Terms of Use.
	    </p>

	</form>
</div>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script  src="./script.js"></script>

</body>
</html>
