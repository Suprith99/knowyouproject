<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
       <title> Know You</title>
    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
 <link rel="stylesheet" href="css/trainerhome.css">
  
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

       
        <link rel="stylesheet" href="css/viewquiz.css">
    </head>
<body>
    
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
       <a href="trainerhome" type="button" class="btn btn-outline-success active">Home</a>
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

	
    <div class="container2">
    
    <c:forEach items="${categories}" var="category">
    	 <div class="card">
            <div class="slide slide1">
                <div class="content">
                    <div class="icon">
                        <i class="fa " aria-hidden="true">${category.title}</i>
                    </div>
                </div>
            </div>
            <div class="slide slide2">
                <div class="content">
                    <h3>
                        ${category.description}
                    </h3>
                </div>
                <div>
                    <a href="addquizquestion?cat_id=${category.id}&c_id=${c_id}">Add Quiz</a>
                </div>
            </div>
        </div>
    </c:forEach>
    </div>

</body>
</html>