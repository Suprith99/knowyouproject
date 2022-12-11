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
          <a href="studentdetails">
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
          <a href="facultymentordetails">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">Faculty Mentor</span>
          </a>
        </li>
        <li>
          <a href="coursedetails" class="active">
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
      <div class="container mt-3 ">
        <a href="#" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#addcourse" style="margin: 15px;">Add Course</a>
        <a href="viewstudents" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#viewcourses" style="margin: 15px;">View Course's</a>
      </div>
      <div id="accordion">
      <div id="addcourse" class="collapse w3-animate-top" data-bs-parent="#accordion" >
        <form:form action="addcourse" method="post" modelAttribute="course" class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
          <div class="mb-3 mt-3">
            <label for="c_id" class="form-label">Course ID:</label>
            <form:input class="form-control" id="c_id" placeholder="Enter Course Id" path="c_id" required="required"></form:input>
          </div>
          <div class="mb-3 mt-3">
            <label for="name" class="form-label">Course Name:</label>
            <form:input class="form-control" id="name" placeholder="Enter Course Name" path="c_name" required="required"></form:input>
          </div>
          <div class="mb-3 mt-3">
            <label for="c_description" class="form-label">Course Description:</label>
            <form:textarea class="form-control" id="c_description" placeholder="Enter Course Description" path="c_description" required="required"></form:textarea>
          </div>
          <div class="mb-3">
            <label for="c_trainer" class="form-label">Trainer:</label>
            
            <form:select class="form-select" id="c_trainer" path="c_trainer" required="required">
            	<form:option label="---Select---" value='' ></form:option>
            	<c:forEach items="${trainers}" var="t">
            		<form:option value="${t.username}"></form:option>
            	</c:forEach>
            </form:select>
           </div>
          <label for="gender" class="form-label">Course Difficulty:</label>&nbsp;&nbsp;&nbsp;
          <div style="display: flex;justify-content: space-between;">
            
            <div class="form-check" >
             
              <form:radiobutton class="form-check-input" id="easy" path="difficulty" value="easy" checked="checked" required="required"></form:radiobutton>
              <label class="form-check-label" for="easy">Easy</label>
            </div>
            &nbsp;&nbsp;&nbsp;
            <div class="form-check">
              <form:radiobutton class="form-check-input" id="medium" path="difficulty" value="medium" required="required"></form:radiobutton>
              <label class="form-check-label" for="medium">Medium</label>
            </div>
            &nbsp;&nbsp;&nbsp;
            <div class="form-check">
              <form:radiobutton class="form-check-input" id="hard" path="difficulty" value="difficult" required="required"></form:radiobutton>
              <label class="form-check-label" for="hard">hard</label>
            </div>
          
          </div><br>
         
          
          <input type="submit" class="btn btn-primary mb-5" value="Add Course"/>
          </form:form>
          
        </div>
      <div id="viewcourses" class="collapse w3-animate-left" data-bs-parent="#accordion">
        <div  class="sales-boxes">
          <div class="recent-sales box">
            <div class="title">Course's List</div>
            <div class="sales-details" >
            
               <table class="table table-hover" >
					<thead class="table-success">
					<tr>					
						<th>Course ID</th>
						<th>Course Name</th>
						<th>Trainer Name</th>
						<th>Level</th>
						<th>Action</th>					
					</tr>
					</thead>
					<c:forEach items="${courses}" var="c">
					
					<tr>
					
						<td> <c:out value="${c.c_id}"></c:out>   </td>	
						<td title="Description" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-content="<c:out value="${c.c_description}"></c:out>"> <c:out value="${c.c_name}"></c:out>   </td>	
						<td> <c:out value="${c.c_trainer}"></c:out>   </td>	
						<td> <c:out value="${c.difficulty}"></c:out>   </td>	
						<td> 					
							<a class="btn btn-outline-info" href='<c:url value='viewcourse?id=${c.c_id}'></c:url>'>ViewSchedules</a>&nbsp;&nbsp;					
						</td>					
					</tr>

					</c:forEach>													
				</table>
              
            </div>
            
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
