<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="css/login.css" rel='stylesheet' type='text/css'>
  <link rel="icon" type="image/png" href="assets/unwind.ico" />

  <link rel="manifest" href="manifest.json"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
  <meta content="black" name="theme-color"/>
</head>
<body>
<h2>Unwind < /> </h2>
<div class="container" id="container">
  <div class="form-container sign-up-container" id="signUpC">
    <form action="/unwind/register" method="post" >
      <h1>Create Account</h1>
      <%if(session.getAttribute("error")!=null){ %>
      <div class="alert alert-danger" role="alert">
	  <%=session.getAttribute("error") %>
	   </div>
	   <%} %>
      <div class="social-container">
        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
      </div>
      <span>or use your email for registration</span>
      <input type="email" placeholder="Email" name="uname"/>
      <input type="password" placeholder="Password" name="pwd"/>
      <input type="password" placeholder="Password" name="confpwd"/>
      Are you an admin?
      <input type="checkbox" name="admin_flag">
      <button type="submit">Sign Up</button>
    </form>
  </div>
  <div class="form-container sign-in-container" id="signInC">
    <form action="/unwind/login" method="post">
      <h1>Sign in</h1>
      <%if(session.getAttribute("errorSignin")!=null){ %>
      <div class="alert alert-danger" role="alert">
	  <%=session.getAttribute("errorSignin") %>
	  </div>
	  <%} %>
      <div class="social-container">
        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
      </div>
      <span>or use your account</span>
      <input name="uname" type="email" placeholder="Email" />
      <input name="pwd" type="password" placeholder="Password" />
      <a href="#">Forgot your password?</a>
      <button type="submit">Sign In</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>Already a Member?</h1>
        <p>Log in to view your leave history and unwind!</p>
        <button class="ghost" id="signIn">Sign In</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>New Here?</h1>
        <p>Enter your personal details and start journey with us</p>
        <button class="ghost" id="signUp">Sign Up</button>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
  $('#signUp').on('click', () => {
    $("#container").addClass("right-panel-active");
    $("#signUpC").show();
    $('#signInC').hide();
  });

  $('#signIn').on('click', () => {
    $("#container").removeClass("right-panel-active");
    $("#signInC").show();
    $('#signUpC').hide();
  });

</script>
</body>
</html>