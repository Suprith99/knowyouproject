<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="eng">
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="css/trainerhome.css">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Know You</title>
<link rel="icon" type="image/x-icon" href="images/logo.ico">
</head>
<body>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
       <a href="trainerhome" type="button" class="btn btn-outline-success">Home</a>
       <a href="viewcourses" type="button" class="btn btn-outline-success">Courses</a>
      </div>
      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
      </div>
      <div class="profile-details">
        <img src="images/profile.jpg"  alt="">
       <a  class="dropdown-toggle" style="text-decoration: none;" data-bs-toggle="dropdown"> <span class="admin_name" ><c:out value="${tuname}"></c:out> </span></a>
       <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/logout">Logout</a></li>
        <li><a class="dropdown-item" href="#">View Profile</a></li>
        <li><a class="dropdown-item" href="changetrainerpwdpage">Change Password</a></li>
      </ul>
       
      </div>
    
    </nav>
    </section>
    <div class="heading">
    	<h1 ><c:out value="${c_name}"></c:out> </h1>
    </div>
      <div class="container-fluid">
      <c:set var="date" value="<%=new java.util.Date()%>" />  
      <c:forEach items="${schedules}" var="s">
      <fmt:parseNumber var="daysDifference"
                value="${( s.endDate.time-date.time ) / (1000*60*60*24) }" 
                integerOnly="true" />
         <c:if test="${daysDifference>0}">
		<div class="container mt-3">
		 
		  <div class="card" style="width:400px;">
		    <img class="card-img-top" src="displayscheduleposter?s_id=<c:out value="${s.id}"></c:out>" alt="Card image" style="width:100%">
		    <div class="card-body">
		      <h4 class="card-title">${s.title}</h4>
		      <div class="card-text">
		     <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-content="${s.description}" style="text-decoration: none">Description>></a>
		        <div style="display: flex;justify-content: space-between;">
		            <h6>Venue:&nbsp;&nbsp;<small>${s.venue}</small></h6>
		            <h6>Mode of Conduct:&nbsp;&nbsp;<small>${s.modeOfConduct}</small></h6>
		       </div>
		        <div style="display: flex;justify-content: space-between;">
		            <h6>Start Date:&nbsp;&nbsp;<small><fmt:formatDate type = "date" value = "${s.startDate}" /></small></h6>
		        <h6>End Date:&nbsp;&nbsp;<small><fmt:formatDate type = "date" value = "${s.endDate}" /></small></h6>
		        </div>
		        <h6>Days of Conduct:&nbsp;&nbsp;<small>${s.days}
		         
               
		        </small></h6>
		      </div>
		      <div class="buttons">
		      	<a href="schedule-dashboard.html" class="btn btn-primary">Check Details</a>
		       <a href="addquestionpage?s_id=${s.id}&s_title=${s.title}&msg=null" class="btn btn-primary">Add Quiz</a>
		      </div>
		    </div>
		  </div>
  		 </div>
  		 </c:if>
  		 </c:forEach>
 	    </div>
<script>
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})
</script>
</body>
</html>
