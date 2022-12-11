<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/studentprofile.css">
    <title> Know You</title>
    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
</head>
<body>
    <div class="backtohome">
        <a href="facultyhome" >
            <h2><i class="fa-solid fa-arrow-left"></i>Back To Home</h2>
        </a>
    </div>
    <h1>Student profile Page</h1>
    <section class="profiledetails">
        
         <div class="profile"style="background-image: url('displayprofilepicstudent?s_id=${student.id}');width:15rem;">
            <div class="profile_pic" >

            </div>
            <div class="name">
                <h2>${student.name}</h2>
            </div>
        	
        </div>
        <section class="info">
            <div class="generalinfo">
                <h2>General Information</h2>
                <hr>
         
                <table>
                 <tr>
                        <th id="gender" scope="row">Id</th>
                        <td class="dots">:</td>
                        <td>${student.id}</td>
                    </tr>
                     <tr>
                        <th id="gender" scope="row">Name</th>
                        <td class="dots">:</td>
                        <td>
                          	 ${student.name}
                        </td>
                    </tr>
                     <tr>
                        <th id="gender" scope="row">Username</th>
                        <td class="dots">:</td>
                        <td>${student.username}</td>
                    </tr>
                    <tr>
                        <th id="gender" scope="row">Gender</th>
                        <td class="dots">:</td>
                        <td>${student.gender}</td>
                    </tr>
                    <tr>
                        <th id="mail" scope="row">Mail Id</th>
                        <td class="dots">:</td>
                        <td>${student.email}</td>
                    </tr>
                    <tr>
                        <th id="mobileno" scope="row">Mobile No:</th>
                        <td class="dots">:</td>
                        <td>${student.contactno}</td>
                    </tr>
                    <tr>
                        <th id="coursereg" scope="row">Courses Registered:</th>
                        <td class="dots">:</td>
                        <td>python,java,aptitude</td>
                    </tr>
                    <tr>
                        <th id="pwd" scope="row">Password</th>
                        <td class="dots">:</td>
                        <td>${student.password}</td>
                    </tr>
                    <tr>
                        <th id="pwd" scope="row">Faculty Mentor</th>
                        <td class="dots">:</td>
                        <td>${student.facultymentor}</td>
                    </tr>
                </table>
     
     
            </div>
            <div class="contestsinfo">
                <h2>Student Information</h2>
                <hr>
                <table>
                    <thead>
                        <tr>
                            <th>Contest Name</th>
                            <th>Schedule Name</th>
                            <th>Marks</th>
                            <th>Rank</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>20cs2022</td>
                            <td>python fundamentals</td>
                            <td>90</td>
                            <td>2</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </section>
</body>
</html>