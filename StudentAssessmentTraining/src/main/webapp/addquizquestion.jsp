<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="eng">
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/trainerhome.css">
<link rel="stylesheet" href="css/addquiz.css">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Know You</title>
<link rel="icon" type="image/x-icon" href="/images/logo.ico">
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

      <div class="container">
        <div class="header">
            		<a href="viewquiz?c_id=${c_id}"><i class="fa-solid fa-arrow-left"></i><span>Back</span></a>
       		 </div>
        <form:form action="addquizquestionbytrainer" method="post" modelAttribute="question">
            <div>
                <label for="name">Question Name</label>
                <form:textarea path="name" id="name" cols="100" rows="3"></form:textarea>
            </div>
            <div class="options">
                <div>
                    <label for="opt1">Option1</label>
                    <form:input  path="option1" id="opt1"></form:input>
                </div>
                <div>
                    <label for="opt2">Option2</label>
                    <form:input path="option2" id="opt2"></form:input>
                </div>
                <div>
                    <label for="opt3">Option3</label>
                    <form:input path="option3" id="opt3"></form:input>
                </div>
                <div>
                    <label for="opt4">Option4</label>
                    <form:input path="option4" id="opt4"></form:input>
                </div>
            </div>
            <div class="hiddenelements">
            	 <form:input path="category_id" id="cat_id" value="${cat_id}" hidden="hidden"></form:input>
            	  <form:input path="c_id" id="c_id" value="${c_id}" hidden="hidden"></form:input>
            </div>
            <div>
                <label for="ans">Correct Answer</label>
                <form:select path="answer" id="ans">
               
                    <form:option value="--1">Select Option</form:option>
                    <form:option value="opt1">Option1</form:option>
                    <form:option value="opt2">Option2</form:option>
                    <form:option value="opt3">Option3</form:option>
                    <form:option value="opt4">Option4</form:option>
                </form:select>
            </div>
            <div class="buttons">
                <input type="submit" value="Add Question">
            </div>
        </form:form>
     </div>
</body>
</html>
