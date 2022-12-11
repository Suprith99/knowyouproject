<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/viewschedules.css">
        <link rel="stylesheet" href="css/trainerhome.css">
        <title>Know You</title>
<link rel="icon" type="image/x-icon" href="images/logo.ico">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
           
  <header class="home-section">
    <nav class="">
      <div class="sidebar-button">
       <a href="studenthome" type="button" class="btn btn-outline-success active">Home</a>
       <a href="viewcoursesbystudent" type="button" class="btn btn-outline-success">Courses</a>
      </div>
      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
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
    
</header>
    <section>
        <div class="container"> 
        <c:set var="date" value="<%=new java.util.Date()%>" />
        <c:set var="i" value="0" />
        <c:forEach items="${schedules}" var="s">  
        <c:set var="i" value="${Integer.parseInt(i)+1}"/>
        <c:if test="${i>5}">
        <c:set var="i" value="1" />
        	</c:if>
		<fmt:parseNumber var="daysDifference"
                value="${( s.endDate.time-date.time ) / (1000*60*60*24) }" 
                integerOnly="true" />
         <c:if test="${daysDifference>-1}">
            <div class="slider">

                <div class="box<c:out value="${i}"></c:out> box">
                    <div class="bg"></div>
                    <div class="details">
                        <h1>${s.title}</h1>
                        <p>
                            ${s.description} 
                            
                        </p>
                        <h4 style="padding: 1rem 0;">Venue:</h4><p>${s.venue}</p>
                         <h4 style="padding: 1rem 0;">Mode of Conduct:&nbsp;&nbsp;<small>${s.modeOfConduct}</small></h4>
                   
                   
                        
                    </div>

                    <div class="illustration">
                        <div class="inner">
							 <img src="displayscheduleposter?s_id=<c:out value="${s.id}"></c:out>"  width="100%" alt="image"/>
                        
                    
                      <p style="margin-top: 5rem;"></p>
                        <h4 style="padding: 0.5rem 0;border-bottom: 3px solid black;">Start Date:&nbsp;&nbsp;<small><fmt:formatDate type = "date" value = "${s.startDate}" /></small></h4>
                        <h4 style="padding: 0.5rem 0;border-bottom: 3px solid black;">End Date:&nbsp;&nbsp;<small><fmt:formatDate type = "date" value = "${s.endDate}" /></small></h4>
                        <h4 style="padding: 1rem 0;">Days of Conduct:</h4><p>${s.days}</p>
                    </div>
                </div>
                </div>    
                                   
            </div>
       </c:if>
       	</c:forEach>
        </div>   
      
    </section>
    </body>
</html>