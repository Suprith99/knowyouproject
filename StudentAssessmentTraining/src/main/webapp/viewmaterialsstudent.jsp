<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> Know You</title>
    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
    <link rel="stylesheet" href="css/trainerhome.css">
  
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
 <link rel="stylesheet" href="css/viewmaterial.css">
   </head>
<body style="background-image: url('images/school.jpg');">
   
    
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
       <a href="studenthome" type="button" class="btn btn-outline-success active">Home</a>
       <a href="viewcoursesbystudent" type="button" class="btn btn-outline-success">Courses</a>
      </div>
      <div class="search-box">
        <div class="progress" style="height:30px">
  			<div class="progress-bar" style="width:${percentage}%;">
  				${percentage}%
  				<c:if test="${percentage>=0}">
  					
  					<c:if test="${percentage<=0}">
  						&#128532;
  					</c:if>		
  				</c:if>
  				<c:if test="${percentage>1}">
  					<c:if test="${percentage<30}">
  						&#128578;
  					</c:if>
  				</c:if>
  				<c:if test="${percentage>30}">
  					<c:if test="${percentage<70}">
  						&#128524;
  					</c:if>
  				</c:if>
  				<c:if test="${percentage>70}">
  					<c:if test="${percentage<=100}">
  						&#128519;
  					</c:if>
  				</c:if>
  				
  			</div>
		</div>
   
      </div>
      <div class="profile-details">
        <img src="displayprofilepicstudent?s_id=${sid}"  alt="">
       <a  class="dropdown-toggle" style="text-decoration: none;" data-bs-toggle="dropdown"> <span class="admin_name" > <c:out value="${suname}"></c:out> </span></a>
       <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/logout">Logout</a></li>
        <li><a class="dropdown-item" href="viewstudentprofile">View Profile</a></li>
        <li><a class="dropdown-item" href="changestudentpwdpage">Change Password</a></li>
        <li><a class="dropdown-item" href="studentenquiry">Enquiry</a></li>
      </ul>
       
      </div>
    
    </nav>
    
</section>
<div class="materials">
<c:forEach items="${incompletematerials}" var="m">
	<div class="container">
        <h2>${m.name}</h2>
        <p>${m.description}</p>
        <div class="btns">
        <a href="${m.ref_link}" target="_blank" class="reflink">Open Material</a>
        <a href="/markcompleted?c_id=${m.c_id}&mat_id=${m.id}" class="btn">Mark Completed</a>
        </div>
    </div>
</c:forEach>
<c:forEach items="${completedmaterials}" var="m">
	<div class="container">
        <h2>${m.name}</h2>
        <p>${m.description}</p>
        <div class="btns">
        <a href="${m.ref_link}" target="_blank" class="reflink">Open Material</a>
        <a href="#" class="btn">Completed</a>
        </div>
    </div>
</c:forEach>
</div>
</body>
</html>