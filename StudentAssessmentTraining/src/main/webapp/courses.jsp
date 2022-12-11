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
<body>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
       <a href="trainerhome" type="button" class="btn btn-outline-success">Home</a>
       <a href="view-courses.html" target="iframe_a" type="button" class="btn btn-outline-success active">Courses</a>
      </div>
      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
      </div>
      <div class="profile-details">
        <img src="images/profile.jpg"  alt="">
       <a  class="dropdown-toggle" style="text-decoration: none;" data-bs-toggle="dropdown"> <span class="admin_name" ><c:out value="${tuname}"></c:out></span></a>
       <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/logout">Logout</a></li>
        <li><a class="dropdown-item" href="#">View Profile</a></li>
        <li><a class="dropdown-item" href="changetrainerpwdpage">Change Password</a></li>
      </ul>
       
      </div>
    
    </nav>
    
</section>
      
        <div class="w3-container">
          <h2 >
          		Contests
          </h2>
        
          <table class="w3-table-all w3-hoverable ">
            <thead>
            <tr>
              <th style="border-left: 10px solid red;width: 20%;color: white;background-color:grey">Contests</th>
            </tr>
              <tr>					
						<th>Course ID</th>
						<th>Course Name</th>
						<th>Trainer Name</th>
						<th>Level</th>
						<th>Schedule</th>	
						<th>Materials</th>	
						<th>Quiz</th>				
					</tr>
					</thead>
					<c:forEach items="${courses}" var="c">
					
					<tr>
					
						<td> <c:out value="${c.c_id}"></c:out>   </td>	
						<td title="description" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-content='<c:out value="${c.c_description}"></c:out>'> <c:out value="${c.c_name}"></c:out>   </td>	
						<td> <c:out value="${c.c_trainer}"></c:out>   </td>	
						<td> <c:out value="${c.difficulty}"></c:out>   </td>	
						<td> 					
							<a class="btn btn-outline-info" href='<c:url value='viewschedules?c_id=${c.c_id}&c_name=${c.c_name}'></c:url>'>ViewSchedules</a>&nbsp;&nbsp;
							
							<a class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target='#myModal'>Add Schedules</a>&nbsp;&nbsp;						
						</td>	
						<td>
							<a class="btn btn-outline-info" href='<c:url value='viewmaterialsbycourse?c_id=${c.c_id}&c_name=${c.c_name}'></c:url>'>ViewMaterials</a>&nbsp;&nbsp;
							
							<a class="btn btn-outline-info" href="regmaterial?c_id=${c.c_id}&c_name=${c.c_name}">Add Material</a>&nbsp;&nbsp;						
						</td>	
						<td>
							<a class="btn btn-outline-info" href='<c:url value='addquiz?c_id=${c.c_id}'></c:url>'>Add Quiz</a>&nbsp;&nbsp;
							
							<a class="btn btn-outline-info" href="viewquiz?c_id=${c.c_id}&c_name=${c.c_name}">View Quiz</a>&nbsp;&nbsp;						
						</td>			
					</tr>
					
					</c:forEach>
          </table>
            <!-- The Modal -->
<div class="modal" id="myModal" style="font-family:Bell MT;">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <div class="w3-container w3-brown">
            <h2>Add Schedule</h2>
          </div>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
       
          <div class="w3-card-4">
           
            <form:form class="w3-container" action="/addschedule" enctype="multipart/form-data" method="post" modelAttribute="schedule">
           		<p>
           		<label class="w3-text-brown">Course</label>
           			<form:select  class="w3-input w3-border w3-sand" path="c_id">
           				<c:forEach items="${courses}" var="c">
           					<form:option value="${c.c_id}"><c:out value="${c.c_id}"></c:out> --<c:out value="${c.c_name}"></c:out> </form:option>
           				</c:forEach>
           			</form:select>
           		</p>
              <p>     	
              <label class="w3-text-brown"><b>Title</b></label>
              <form:input class="w3-input w3-border w3-sand" name="title"  path="title" type="text"></form:input>
              </p>
              <p> 
              <p>      
                  <label class="w3-text-brown"><b>Description</b></label>
                  <form:textarea  class="w3-input w3-border w3-sand" path="description"/>
              </p>
                <p>      
                  <label class="w3-text-brown"><b>Venue</b></label>
                  <form:input  class="w3-input w3-border w3-sand" path="venue"></form:input>
              </p>
              <p>      
                  <label class="w3-text-brown"><b>Start Date</b></label>
                  <input type="date" class="w3-input w3-border w3-sand" placeholder="yyyy-mm-dd" name="startDate"/>
              <p>  
              <p>      
                <label class="w3-text-brown"><b>End Date</b></label>
                <input type="date" class="w3-input w3-border w3-sand" placeholder="yyyy-mm-dd" name="endDate"/>
              <p>   
              <p>      
                  <label class="w3-text-brown"><b>Days</b></label>
                  <form:input class="w3-input w3-border w3-sand" path="days"></form:input>
              </p>
              <p>  
                <div style="display: flex;justify-content: space-between;">
                  <label class="w3-text-brown"><b>Mode of Conduct</b></label>
                  <p>
                  
                    <form:radiobutton path="modeOfConduct" value="online"/>
                    <label>Online</label></p>
                    <p>
                    <form:radiobutton path="modeOfConduct" value="offline"/>
                    <label>Offline</label></p>
                    <p>
                </div>
                 <p>      
                <label class="w3-text-brown"><b>Upload Poster of Schedule</b></label>
                <input class="w3-input w3-border w3-sand" type="file" name="poster" />
              <p> 
                <input class="w3-btn w3-brown" type="submit"  value="Add Schedule" />
            </form:form>
          </div>
         
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
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
     
</body>
</html>
    