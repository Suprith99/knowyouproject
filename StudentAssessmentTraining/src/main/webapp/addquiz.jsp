<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
	    <meta charset="UTF-8">
	    <title> Know You</title>
	    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
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
       <a href="home.html" type="button" class="btn btn-outline-success active">Home</a>
       <a href="/viewcourses" type="button" class="btn btn-outline-success">Courses</a>
      </div>
      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
      </div>
      <div class="profile-details">
        <img src="images/profile.jpg"  alt="">
       <a  class="dropdown-toggle" style="text-decoration: none;" data-bs-toggle="dropdown"> <span class="admin_name" > <c:out value="${tuname}"></c:out> </span></a>
       <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/logout">Logout</a></li>
        <li><a class="dropdown-item" href="#">View Profile</a></li>
        <li><a class="dropdown-item" href="changetrainerpwdpage">Change Password</a></li>
      </ul>
       
      </div>
    
    </nav>
    	
</section>
<section id="contact" class="dark">
			<div class="container small">
				<header>
					
					<h3>Add Quiz</h3>
				</header>
			 <form:form  action="/addquizcategory" method="post" modelAttribute="category">
		              <p>     	
		              <label class="w3-text-brown"><b>Title</b></label>
		              <form:input class="w3-input w3-border w3-sand" path="title" type="text"></form:input>
		              </p>
		              <p>     	
		              <label class="w3-text-brown" ><b>Description</b></label>
		              <form:textarea class="w3-input w3-border w3-sand" path="description" type="text"></form:textarea>
		              </p>
		              <form:input class="w3-input w3-border w3-sand" hidden="hidden" path="c_id" value="${c_id}" type="text"></form:input>
		              <p>             
		               <input class="w3-btn w3-brown" type="submit"  value="Add Category" />
            </form:form>
			</div>
		</section>
</body>
</html>
