<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Know You</title>
    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
    <link rel="stylesheet" href="css/adminhome.css">
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
<body>
  <div class="sidebar">
    <div class="logo-details">
      <span class="logo_name" style="margin-left: 10px;">Know You</span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="adminhome" >
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="studentdetails" >
            <i class='bx bx-box' ></i>
            <span class="links_name">Students</span>
          </a>
        </li>
        <li>
          <a href="trainerdetails">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Trainer</span>
          </a>
        </li>
        <li>
          <a href="facultymentordetails" class="active">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">Faculty Mentor</span>
          </a>
        </li>
        <li>
          <a href="coursedetails">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Courses</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class='bx bx-book-alt' ></i>
            <span class="links_name">Materials</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class='bx bx-message' ></i>
            <span class="links_name">Enquiry</span>
          </a>
        </li> 
        <li class="log_out">
          <a href="logout">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>
      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
      </div>
      <div class="profile-details">
        <img src="images/profile.jpg" alt="">
       <span class="admin_name"><c:out value="${auname}"></c:out></span>
        <i class='bx bx-chevron-down' ></i>
      </div>
    </nav>

    <div class="home-content">
      <div class="overview-boxes">
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Student's</div>
            <div class="number"><c:out value="${mp['sc']}"></c:out> </div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Till today</span>
            </div>
          </div>
          <i class='fas fa-user-graduate' style='font-size:48px;color:brown'></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Trainer's</div>
            <div class="number"><c:out value="${mp['tc']}"></c:out> </div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Till today</span>
            </div>
          </div>
          <i class='fas fa-chalkboard-teacher' style='font-size:48px;'></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Mentors's</div>
            <div class="number"><c:out value="${mp['fc']}"></c:out> </div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Till today</span>
            </div>
          </div>
          <i class='fas fa-chalkboard-teacher' style='font-size:48px;'></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Schedule's</div>
            <div class="number">1</div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Till today</span>
            </div>
          </div>
          <i class='fas fa-book-reader' style='font-size:48px;color:red'></i>
        </div>
      </div>
      <div class="container mt-3">
        <a href="#" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#addmentor" style="margin: 15px;">Add Faculty</a>
        <a href="viewstudents" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#viewmentors" style="margin: 15px;">View Faculty</a>
        <a href="viewstudents" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#assignmentor" style="margin: 15px;">Assign Student</a>
      </div>
      <div id="accordion">
      <div id="addmentor" class="collapse w3-animate-top" data-bs-parent="#accordion">
        <form:form action="addfaculty" method="post" modelAttribute="faculty" class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
          <div class="mb-3 mt-3">
            <label for="name" class="form-label">Name:</label>
            <form:input class="form-control" id="name" placeholder="Enter Name" path="name" required="required"></form:input>
          </div>
          <label for="gender" class="form-label" >Gender:</label>&nbsp;&nbsp;&nbsp;
          <div style="display: flex;">
            
            <div class="form-check" >
             
              <form:radiobutton class="form-check-input" id="male" path="gender" required="required" value="male" checked="checked"></form:radiobutton>
              <label class="form-check-label" for="male">Male</label>
            </div>&nbsp;&nbsp;&nbsp;
            <div class="form-check">
              <form:radiobutton class="form-check-input" id="female" path="gender" required="required" value="female"></form:radiobutton>
              <label class="form-check-label" for="female">Female</label>
            </div>
          
          </div>
          <div class="mb-3">
            <label for="department" class="form-label">Department:</label>
            
            <form:select class="form-select" id="department" path="department" required="required">
            <form:option label="---Choose Department---" value='' ></form:option>
              <form:option value="CSE"></form:option>
              <form:option value="ECE"></form:option>
              <form:option value="EEE"></form:option>
              <form:option value="MECH"></form:option>
            </form:select>
           </div>
           <div class="mb-3">
            <label for="designation" class="form-label" required="required">Designation:</label>
            
            <form:select class="form-select" id="designation" path="designation">
            <form:option label="---Choose Designation---" value=''></form:option>
              <form:option value="B.Tech"></form:option>
              <form:option value="M.Tech"></form:option>
              <form:option value="P.H.D."></form:option>
              <form:option value="M.A."></form:option>
            </form:select>
           </div>
          <div class="mb-3 mt-3">
            <label for="username" class="form-label">Username:</label>
            <form:input class="form-control" id="username" placeholder="Enter User Name" required="required" path="username"></form:input>
          </div>
          <div class="mb-3 mt-3">
            <label for="phoneno" class="form-label">Contact:</label>
            <form:input class="form-control" id="phoneno" placeholder="Enter Phone Number" required="required" path="contactno"></form:input>
          </div>
          <div class="mb-3 mt-3">
            <label for="email" class="form-label">Email:</label>
            <form:input class="form-control" id="email" placeholder="Enter email" required="required" path="email"></form:input>
          </div>
            <div class="hidden-fields">
            	<form:password path="password" hidden="hidden"  value="klu_faculty"></form:password>
           		 <form:input path="studentsAssignedCount" hidden="hidden" value="1"></form:input>
            </div>
          <input type="submit" class="btn btn-primary mb-5" value="Add Faculty"/>
          </form:form>
          
        </div>
       
      <div id="viewmentors" class="collapse w3-animate-left" data-bs-parent="#accordion">
        <div  class="sales-boxes">
          <div class="recent-sales box">
            <div class="title">Faculty Mentor's List</div>
            <div class="sales-details">
            
               <table class="table table-hover" >
					<thead class="table-success">
					<tr>					
						<th>ID</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Department</th>
						<th>Designation</th>
						<th>Email ID</th>
						<th>Username</th>
						<th>Contact No</th>
						<th>Students Assigned</th>
						<th>Action</th>					
					</tr>
					</thead>
					<c:forEach items="${facultymentors}" var="f">
					
					<tr>
					
						<td> <c:out value="${f.id}"></c:out>   </td>
						<td> <c:out value="${f.name}"></c:out>   </td>
						<td> <c:out value="${f.gender}"></c:out>   </td>
						<td> <c:out value="${f.department}"></c:out>   </td>
						<td> <c:out value="${f.designation}"></c:out>   </td>
						<td> <c:out value="${f.email}"></c:out>   </td>
						<td> <c:out value="${f.username}"></c:out>   </td>
						<td> <c:out value="${f.contactno}"></c:out>   </td>
					<td> <c:out value="${f.studentsAssignedCount}"></c:out>   </td>
						<td> 					
							<a href='<c:url value='deletefacultybyid?id=${f.id}'></c:url>'>Delete</a>&nbsp;&nbsp;
							<a href='<c:url value='viewfacultymentorprofile?id=${f.id}'></c:url>'>View</a>&nbsp;&nbsp;					
						</td>					
					</tr>

					</c:forEach>

				</table>
              
            </div>
            <div class="button">
              <a href="#">See All</a>
            </div>
            </div>
          </div>
      </div>
       <div id="assignmentor" class="collapse w3-animate-top" data-bs-parent="#accordion">
        <form action="assignmentor" method="post" class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
          <div class="mb-3 mt-3">
          	<div class="assign">
          		<div>
          			<label for="faculty">Faculty</label>
		            <select class="form-select" id="faculty" name="f_id">
		            	<option value="-1">----Choose Faculty Mentor----</option>
		            	<c:forEach items="${facultymentors}" var="f">
		            	<option value="${f.id}">${f.name}</option>
		            	</c:forEach> 
		            </select>
          		</div>
            	<div>
            		<label for="student">Student</label>
		             <select class="form-select" id="student" name="s_id">
		            	<option value="-1">----Choose Student----</option>
		            	
		            	<c:forEach items="${students}" var="s">
		            	<c:if test='${s.facultymentor.equals("null")}'>
		    
		            	<option value="${s.id}">${s.name}</option>
		            	</c:if>
		            	
		            	</c:forEach>
		           	 </select>
            	</div>
          	</div>
           </div>
          
          <input type="submit" class="btn btn-primary mb-5" value="Assign Mentor"/>
          </form>
          
        </div>
    </div>
  <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
 </script>

</body>
</html>
