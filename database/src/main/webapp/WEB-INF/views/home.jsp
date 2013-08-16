<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!-- requirements:
1) query physician table. Return true or false to tell whether logged in or not.
If true, return physician physician information.
 -->
	<head>
		<title>
			Physician Login: MVCH
		</title>
		<link rel="stylesheet" type="text/css" href="./resources/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="./resources/css/mvch.css">
		<script src="./resources/js/jquery.min.js" type="text/javascript">
</script>
	</head>
	<body>
<section class="login-container">
    <div class="login">
    
    
      <h1>Login to Web App</h1>
     <error>${message}</error>
      <form method="post" action="patient/">
        <p><input type="text" name="physicianId" value="" placeholder="physician id"></p>
        <p><input type="password" name="password" value="" placeholder="password"></p>
        <p class="submit"><input type="submit" name="commit" value="Login"></p>
      </form>
    </div>

  </section>
	</body>
</html>