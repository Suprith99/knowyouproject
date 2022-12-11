<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="eng">
<head>
    <meta charset="UTF-8">
    <title> Know You</title>
    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
    <link rel="stylesheet" href="css/trainerhome.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<!--Get your own code at fontawesome.com-->
</head>
<body style="background-color: black;">
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
       <a href="studenthome" type="button" class="btn btn-outline-success">Home</a>
       <a href="view-courses.html" target="iframe_a" type="button" class="btn btn-outline-success active">Courses</a>
      </div>
      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
      </div>
      <div class="profile-details">
        <img src="displayprofilepicstudent?s_id=${sid}"  alt="">
       <a  class="dropdown-toggle" style="text-decoration: none;" data-bs-toggle="dropdown"> <span class="admin_name" ><c:out value="${suname}"></c:out></span></a>
       <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/logout">Logout</a></li>
        <li><a class="dropdown-item" href="viewstudentprofile">View Profile</a></li>
        <li><a class="dropdown-item" href="changestudentpwdpage">Change Password</a></li>
        <li><a class="dropdown-item" href="studentenquiry">Enquiry</a></li>
      </ul>
       
      </div>
    
    </nav>
    
</section>
      <section class="body">
        <div class="w3-container">
          <h2 >
          		Contests
          </h2>
        
          <table class="w3-table-all w3-hoverable">
            <thead>
            <tr>
              <th style="border-left: 10px solid red;width: 20%;color: white;background-color:grey">Registered Courses</th>
            </tr>
              <tr>					
						<th>Course ID</th>
						<th>Course Name</th>
						<th>Trainer Name</th>
						<th>Level</th>
						<th>Schedule</th>
						<th>Material</th>	
						<th>Quiz</th>				
					</tr>
					</thead>
					<c:forEach items="${registredcourses}" var="c">
					
					<tr>
					
						<td> <c:out value="${c.c_id}"></c:out>   </td>	
						<td title="description" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-content='<c:out value="${c.c_description}"></c:out>'> <c:out value="${c.c_name}"></c:out>   </td>	
						<td> <c:out value="${c.c_trainer}"></c:out>   </td>	
						<td> <c:out value="${c.difficulty}"></c:out>   </td>	
						<td> 					
							<a class="btn btn-outline-info" href="viewschedulesofstudent?c_id=<c:out value="${c.c_id}"></c:out>">View Schedules</a>&nbsp;&nbsp;					
						</td>	
						<td> 					
							<a class="btn btn-outline-info" href="viewmaterialsbycoursestudent?c_id=<c:out value="${c.c_id}"></c:out>">View Materials</a>&nbsp;&nbsp;					
						</td>
						<td> 					
							<a class="btn btn-outline-info" href="viewquizcategory?c_id=<c:out value="${c.c_id}"></c:out>&filter=<c:out value="incomplete"></c:out>">View Quiz</a>&nbsp;&nbsp;					
						</td>					
					</tr>
					
					</c:forEach>
          </table>
 	</div>
 	 
        <div class="w3-container">
          <h2 >
          		Contests
          </h2>
        
          <table class="w3-table-all w3-hoverable ">
            <thead>
            <tr>
              <th style="border-left: 10px solid red;width: 20%;color: white;background-color:grey">UnRegistered Courses</th>
            </tr>
              <tr>					
						<th>Course ID</th>
						<th>Course Name</th>
						<th>Trainer Name</th>
						<th>Level</th>
						<th>Action</th>					
					</tr>
					</thead>
					<c:forEach items="${unregistredcourses}" var="c">
					
					<tr>
					
						<td> <c:out value="${c.c_id}"></c:out>   </td>	
						<td title="description" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-content='<c:out value="${c.c_description}"></c:out>'> <c:out value="${c.c_name}"></c:out>   </td>	
						<td> <c:out value="${c.c_trainer}"></c:out>   </td>	
						<td> <c:out value="${c.difficulty}"></c:out>   </td>	
						<td> 					
							<a class="btn btn-outline-info" href="registercourse?c_id=<c:out value="${c.c_id}"></c:out>">Register</a>&nbsp;&nbsp;					
						</td>					
					</tr>
					
					</c:forEach>
          </table>
 	</div>
      </section>
  <script>
var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})
</script>
     
</body>
</html>
    