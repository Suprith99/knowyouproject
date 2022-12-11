<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Know You</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
    <link href="css/index.css" rel="stylesheet">
</head>
<body>
<header id="main-header">
			<div class="container">
				<a href=""><img src="images/logo.png" alt="Logo for furniture company"></a>
				<h1>Student Assessment Training(Know You)</h1>
				<h2>We love to Make you learn by making understand your priorities</h2>
				<a href="#" data-bs-toggle="modal" data-bs-target="#myModal" class="btn">Get Started</a>
			</div>
		</header>
    <div class="container-fluid">         
<!-- The Modal -->
<div class="modal" id="myModal" style="font-family:Bell MT;">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><h1>Login</h1></h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
       
                <form method="post" action="checklogin">
                   <div class="identity">

                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio1" name="status" value="student" checked>Student
                        <label class="form-check-label" for="radio1"></label>
                      </div>
                      <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio2" name="status" value="faculty">Faculty
                        <label class="form-check-label" for="radio2"></label>
                      </div>
                      <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio2" name="status" value="trainer">Trainer
                        <label class="form-check-label" for="radio2"></label>
                      </div>
                       <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio2" name="status" value="admin">Admin
                        <label class="form-check-label" for="radio2"></label>
                      </div>
                
                
                      
                   </div>
                   <div class="blink">
                   		<h4> <c:out value="${msg}"></c:out> </h4>
                   </div>
                    <div class="mb-3 mt-3">
                        <label for="uname" class="form-label">Username:</label>
                        <input type="text" class="form-control" id="username" placeholder="Enter username" name="uname" required>
                      </div>
                      <div class="mb-3">
                        <label for="pwd" class="form-label">Password:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required>
                      </div>
                      <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="myCheck" name="remember" required>
                        <label class="form-check-label" for="myCheck">I agree on the terms and conditions.</label>
                      </div>
                      <input type="submit" class="btn" id="loginbut" style="padding:.5rem 2rem;" value="login" />
                      <div class="forgot-link">
                      	<a href="" data-bs-toggle="modal" data-bs-target="#myModal2">forgot password?</a>
                      </div>
                      
                </form>
         
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
        </div>
  
      </div>
    </div>
  </div>
          
           
</div>
<!-- The Modal -->
<div class="modal" id="myModal2">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Forgot Password!</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body second">
       <form action="forgotpassword" method="post">
       				 <div class="identity" style="margin-bottom:10px;">
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio1" name="status" value="student" checked>Student
                        <label class="form-check-label" for="radio1"></label>
                      </div>
                      <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio2" name="status" value="faculty">Faculty
                        <label class="form-check-label" for="radio2"></label>
                      </div>
                      <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio2" name="status" value="trainer">Trainer
                        <label class="form-check-label" for="radio2"></label>
                      </div>
                      
                     </div> 
                  
       	 <div>
        	<label>Username</label>
        	<input type="text" name="username" />
        </div>
        
        <input type="submit" class="btn" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-content="password will be sent to your mail when you click get password if username is present in the database" id="loginbut" value="Get Password" />
       </form>
       
      </div>
    </div>
  </div>
</div>

   <script>
   
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})
</script>
   
</body>
</html>