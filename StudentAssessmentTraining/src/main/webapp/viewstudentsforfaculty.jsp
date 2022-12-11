<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title> Know You</title>
    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
    <link rel="stylesheet" href="css/trainerhome.css">
  
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="css/viewstudentsfaculty.css">
</head>
<body>
<section class="home-section">
    <nav>
      <div class="sidebar-button">
       <a href="facultyhome" type="button" class="btn btn-outline-success ">Home</a>
       <a href="/viewmystudents" type="button" class="btn btn-outline-success active" >Students</a>
      </div>
      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
      </div>
      <div class="profile-details">
        <img src="images/profile.jpg"  alt="">
       <a  class="dropdown-toggle" style="text-decoration: none;" data-bs-toggle="dropdown"> <span class="admin_name" > <c:out value="${funame}"></c:out> </span></a>
       <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/logout">Logout</a></li>
        <li><a class="dropdown-item" href="#">View Profile</a></li>
        <li><a class="dropdown-item" href="changefacultypwdpage">Change Password</a></li>
      </ul>
       
      </div>
    
    </nav>
    
</section>
  <div class="cards">
  <c:forEach items="${students}" var="s">
      <div class="card">
          <div class="content">
            <div class="front">
              <img src="displayprofilepicstudent?s_id=${s.id}" alt="c" />
            </div>
            <div class="back">
              <a href="viewstudentprofilebyfaculty?s_id=${s.id}">View Profile</a>
            </div>
          </div>
        </div>
     </c:forEach> 
    </div>
      
</body>
</html>