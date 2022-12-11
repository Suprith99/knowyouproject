<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  <style>
  	@charset "ISO-8859-1";
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
    
  }
  .body
  {
  }
  .heading
  {
  	margin-left: 40%;
  	border-left: 10px solid red;
  	width:500px;
  	background: grey;
  }
  .heading h1
  {
  	word-spacing: 10px;
  	height: 50px
  }
  .heading:hover
  {
  	background-color:aqua;
  }
  .container-fluid
  {
  	margin-top:80px;display: flex;
  }
.w3-container h2
{
	font-family: 'Poppin','sans-serif';
	text-align: center;
	margin-right: 13%;
	color:white;
}

.home-section{
    position: relative;
    background: #b30f0f;
    min-height: 10vh;
    width: 100%;
    transition: all 0.5s ease;
  }

  .dropdown-toggle:hover{
    color: rgb(207, 16, 16);
  }
.home-section nav{
    display: flex;
    justify-content: space-between;
    height: 80px;
    background: rgb(157, 63, 63);
    display: flex;
    align-items: center;
    position: fixed;
    width: 100%;
    z-index: 100;
    padding: 0 20px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
    transition: all 0.5s ease;
  }
  
.home-section nav .sidebar-button{
    position: relative;
    display: inline;
    justify-content: space-evenly;
    align-items: center;
    font-size: 24px;
    font-weight: 500;
  }
nav .sidebar-button i{
  font-size: 35px;
  margin-right: 10px;
}
.home-section nav .search-box{
  position: relative;
  height: 50px;
  max-width: 550px;
  width: 100%;
  margin: 0 20px;
}
nav .search-box input{
  height: 100%;
  width: 100%;
  outline: none;
  background: #F5F6FA;
  border: 2px solid #EFEEF1;
  border-radius: 6px;
  font-size: 18px;
  padding: 0 15px;
}
nav .search-box .bx-search{
    position: absolute;
    height: 40px;
    width: 40px;
    background: #2697FF;
    right: 5px;
    top: 50%;
    transform: translateY(-50%);
    border-radius: 4px;
    line-height: 40px;
    text-align: center;
    color: #fff;
    font-size: 22px;
    transition: all 0.4 ease;
  }
.home-section nav .profile-details{
    display: flex;
    align-items: center;
    background: #505776;
    border: 2px solid #EFEEF1;
    border-radius: 6px;
    height: 50px;
    min-width: 190px;
    padding: 0 15px 0 2px;
  }
nav .profile-details img{
  height: 40px;
  width: 40px;
  border-radius: 6px;
  object-fit: cover;
}
nav .profile-details .admin_name{
  font-size: 15px;
  font-weight: 500;
  color: #333;
  margin: 0 10px;
  white-space: nowrap;
}
nav .profile-details i{
  font-size: 25px;
  color: #333;
}





/* Responsive Media Query */
@media (max-width: 1240px) {
 
    .home-section nav{
      width: 100%;
      left: 60px;
    }
    
  }

@media (max-width: 700px) {
  nav .sidebar-button .dashboard,
  nav .profile-details .admin_name,
  nav .profile-details i{
    display: none;
  }
  .home-section nav .profile-details{
    height: 50px;
    min-width: 40px;
  }
  
}
.buttons
{
	display:grid;
	grid-template-columns: 1fr 1fr;
	gap:4rem
}

  	@charset "ISO-8859-1";
body
{
    font-family: 'Poppins',sans-serif;
    line-height: 1.55;
    color: rgb(60, 58, 71);
}
h3{
    font-size: 2.4rem;
    font-weight: 700;
    letter-spacing: -2px;
    margin-bottom: 2rem;
}
.dark h3
{
    color: rgb(255, 255, 255);
}
p
{
    margin-bottom: 1rem;
}
p.section-intro
{
    font-weight: 200;
    letter-spacing: 2px;
    text-transform: uppercase;
}
.dark p.section-intro
{
    color: rgba(255, 255, 255,.8);
}
form input,
form textarea,
form button{
    font-family: 'Poppins',sans-serif;
    font-size: 18px;
    line-height: 1.55rem;
}

.container.small
{
    width: 60%;
    max-width: 35rem;
     margin: 0 auto;
}
.dark
{
    padding: 13rem 0;
    text-align: center;
}
.dark
{
    background-color: rgb(60, 58, 71);
}
.dark label
{
    color: rgba(255, 255, 255,.8);
}
form input,form textarea
{
    background-color: rgba(255, 255, 255,.1);
    border: none;
    padding: 1rem ;
    width: 100%;
    color: rgb(255, 255, 255);
    resize: none;

}
form input:focus,form textarea:focus
{
    outline: none;
    background-color: rgba(255, 255, 255,.2);
}
form div{
    margin-bottom: 1.75rem;
}
form label{
    display: block;
    text-transform: uppercase;
    letter-spacing: 1px;
    text-align: start;
    margin-bottom: .5rem;
}
form button
{
    width: 100%;
    cursor: pointer;
}
.dark .btn{
    border: 1px solid rgba(255, 255, 255,.8);
    background-color: transparent;
    color: rgb(255, 255, 255);
}
.dark .btn:hover{
    background-color: rgb(255, 255, 255);
    color: rgb(60, 58, 71);
}
p.muted
{
    color: rgba(255, 255, 255,.5);
}
form button+p{
    margin-top: 1.75rem;
}
  </style>
	    <meta charset="UTF-8">
	    <title> Know You</title>
	    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
	    <link rel="stylesheet" href="css/trainerhome.css">
	 	 <link rel="stylesheet" href="css/changepwd.css">
	    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
	     <meta name="viewport" content="width=device-width, initial-scale=1.0">
	     <script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
	     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
	     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
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
<section id="contact" class="dark">
			<div class="container small">
				<header>
					
					<h3>Add Material</h3>
				</header>
			 <form:form  action="/addmaterial" method="post" modelAttribute="material">
		              <p>     	
		              <label class="w3-text-brown"><b>Title</b></label>
		              <form:input class="w3-input w3-border w3-sand" path="name" type="text"></form:input>
		              </p>
		              <p>     	
		              <label class="w3-text-brown"><b>Description</b></label>
		              <form:textarea class="w3-input w3-border w3-sand" path="description" type="text"></form:textarea>
		              </p>
		              <p>     	
		              <label class="w3-text-brown"><b>Reference Link</b></label>
		              <form:input class="w3-input w3-border w3-sand" path="ref_link" type="text"></form:input>
		              </p>
		              <form:input class="w3-input w3-border w3-sand" hidden="hidden" path="c_id" value="${c_id}" type="text"></form:input>
		              <p>             
		               <input class="w3-btn w3-brown" type="submit"  value="Add Material" />
            </form:form>
			</div>
		</section>
</body>
</html>
