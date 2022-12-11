<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Know You</title>
    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Qages/logo.ico">
    <link rel="stylesheet" href="css/trainerhome.css">
  <link rel="stylesheet" href="css/changepwd.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

   </head>
<body>

    
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
       <a href="home.html" type="button" class="btn btn-outline-success active" style="pointer-events: none">Home</a>
       <a href="viewcoursesbystudent" type="button" class="btn btn-outline-success" style="pointer-events: none">Courses</a>
      </div>
      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
      </div>
      <div class="profile-details">
        <img src="images/profile.jpg"  alt="">
       <a  class="dropdown-toggle" style="text-decoration: none;" data-bs-toggle="dropdown"> <span class="admin_name"> <c:out value="${tuname}"></c:out> </span></a>
       <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/logout" >Logout</a></li>
        <li><a class="dropdown-item" href="#" style="pointer-events: none">View Profile</a></li>
        <li><a class="dropdown-item" href="#" style="pointer-events: none">Change Password</a></li>
      </ul>
       
      </div>
    
    </nav>
    	
</section>
<section id="contact" class="dark">
			<div class="container small">
				<header>
					
					<h3>Change Password</h3>
				</header>
				<form action="changetrainerpwd" method="post">
					<div>
						<label for="oldpwd">Old Password</label>
						<input type="password" name="oldpwd" id="oldpwd" required="required">
					</div>
					<div>
						<label for="newpwd">New Password</label>
						<input type="password" name="newpwd" id="newpwd" required="required">
					</div>
					
					<div>
						<button class="btn">Change Password</button>
						<p class="muted"><em>All fields are required</em></p>
					</div>
				</form>
			</div>
		</section>
</body>
</html>
