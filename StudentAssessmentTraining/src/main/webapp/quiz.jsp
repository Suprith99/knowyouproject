<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Know You</title>
 
    <link rel="stylesheet" href="css/quiz.css">
    <script src="https://kit.fontawesome.com/da01d14b1b.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	
    <div class="header">
        <a href="viewschedulesofstudent?c_id=${c_id}"><i class="fa-solid fa-arrow-left"></i><span>Back</span></a>
        <h1>Quiz - ${s_title}</h1>
    </div>
    <hr>
    <div class="container">
        <div class="card">
        <c:if test="${i>=n}">
        		 <div class="ending">
                <h1>Congratulations</h1>
                <h4>Score:<p>${score}/${n}</p></h4>
                <a href="viewschedulesofstudent?c_id=${c_id}">GO Back to Course</a>
            </div>
        </c:if>
        <c:if test="${i<n}">
            <div class="heading">
                <h4>Score:<p>${score}/${n}</p></h4>
                <h2>${i+1}.  ${q.name}</h2>
            </div>
            <c:if test="${!attempeted}">
            <form action="checkanswer" method="post">
            <input type="text" value="${i}" name="inc" hidden="hidden"/>
            <div class="options">
            
                <div>
                    <input type="radio" name="answer" value="opt1" id="opt1" required="required">
                    <label for="opt1">${q.option1}</label>
                    
                </div>
                <div>
                    <input type="radio" name="answer" value="opt2" id="opt2" required="required">
                    <label for="opt2">${q.option2}</label>
                    
                </div>
                <div>
                    <input type="radio" name="answer" value="opt3" id="opt3" required="required">
                    <label for="opt3">${q.option3}</label>
                </div>
                <div>
                    <input type="radio" name="answer" value="opt4" id="opt4" required="required">
                    <label for="opt4">${q.option4}</label>
                </div>
            </div>
           <div class="buttons">
                <a href="prevquestion?i=${Integer.parseInt(i)}" class="btn prev"><i class="fa-solid fa-arrow-left"></i><span>Prev</span></a>
                <input type="submit" value="Check Answer"  class="btn"/>
                <a href="nextquestion?i=${Integer.parseInt(i)}" class="btn nxt"><span>Next</span><i class="fa-solid fa-arrow-right"></i></a>
           </div>
           </form>
           <c:out value="${attempetedanswer}"></c:out>
           </c:if>
           <c:if test="${attempeted}">
            <form action="checkanswer" method="post">
            <input type="text" value="${i}" name="inc" hidden="hidden"/>
            <div class="options">
            
                <div>
                    <input type="radio" name="answer" value="opt1" id="opt1" required="required" disabled="disabled">
                    
                    <c:if test='${attempetedanswer.equals("opt1")}'>
                    	
                    	<c:if test='${!q.answer.equals("opt1")}'>
                    	<label for="opt1" style="background-color:red">${q.option1}</label>
	                    <i class="fa-solid fa-xmark" style="font-size:1.5rem;color:red"></i>
	                    </c:if>
	                    <c:if test='${q.answer.equals("opt1")}'>
	                    <label for="opt1" style="background-color:green">${q.option1}</label>
	                    <i class="fa-solid fa-check" style="font-size:1.5rem;color:rgb(11, 244, 11)"></i>
	                    </c:if>
                    </c:if>
                    <c:if test='${!attempetedanswer.equals("opt1")}'>
                    	<c:if test='${!q.answer.equals("opt1")}'>
                    	<label for="opt1">${q.option1}</label>
	                    </c:if>
	                    <c:if test='${q.answer.equals("opt1")}'>
	                    <label for="opt1" style="background-color:green">${q.option1}</label>
	                    <i class="fa-solid fa-check" style="font-size:1.5rem;color:rgb(11, 244, 11)"></i>
	                    </c:if>
                    </c:if>
                    
                </div>
                <div>
                    <input type="radio" name="answer" value="opt2" id="opt2" required="required" disabled="disabled">
                   
                    <c:if test='${attempetedanswer.equals("opt2")}'>
                    	
                    	<c:if test='${!q.answer.equals("opt2")}'>
                    	<label for="opt1" style="background-color:red">${q.option2}</label>
	                    <i class="fa-solid fa-xmark" style="font-size:1.5rem;color:red"></i>
	                    </c:if>
	                    <c:if test='${q.answer.equals("opt2")}'>
	                    <label for="opt1" style="background-color:green">${q.option2}</label>
	                    <i class="fa-solid fa-check" style="font-size:1.5rem;color:rgb(11, 244, 11)"></i>
	                    </c:if>
                    </c:if>
                    <c:if test='${!attempetedanswer.equals("opt2")}'>
                    	<c:if test='${!q.answer.equals("opt2")}'>
                    	<label for="opt1">${q.option2}</label>
	                    </c:if>
	                    <c:if test='${q.answer.equals("opt2")}'>
	                    <label for="opt1" style="background-color:green">${q.option2}</label>
	                    <i class="fa-solid fa-check" style="font-size:1.5rem;color:rgb(11, 244, 11)"></i>
	                    </c:if>
                    </c:if>
                </div>
                <div>
                    <input type="radio" name="answer" value="opt3" id="opt3" required="required" disabled="disabled">
                    
                    <c:if test='${attempetedanswer.equals("opt3")}'>
                    	
                    	<c:if test='${!q.answer.equals("opt3")}'>
                    	<label for="opt1" style="background-color:red">${q.option3}</label>
	                    <i class="fa-solid fa-xmark" style="font-size:1.5rem;color:red"></i>
	                    </c:if>
	                    <c:if test='${q.answer.equals("opt3")}'>
	                    <label for="opt1" style="background-color:green">${q.option3}</label>
	                    <i class="fa-solid fa-check" style="font-size:1.5rem;color:rgb(11, 244, 11)"></i>
	                    </c:if>
                    </c:if>
                    <c:if test='${!attempetedanswer.equals("opt3")}'>
                    	<c:if test='${!q.answer.equals("opt3")}'>
                    	<label for="opt1">${q.option3}</label>
	                    </c:if>
	                    <c:if test='${q.answer.equals("opt3")}'>
	                    <label for="opt1" style="background-color:green">${q.option3}</label>
	                    <i class="fa-solid fa-check" style="font-size:1.5rem;color:rgb(11, 244, 11)"></i>
	                    </c:if>
                    </c:if>
                </div>
                <div>
                    <input type="radio" name="answer" value="opt4" id="opt4" required="required" disabled="disabled">
                    
                    <c:if test='${attempetedanswer.equals("opt4")}'>
                    	
                    	<c:if test='${!q.answer.equals("opt4")}'>
                    	<label for="opt1" style="background-color:red">${q.option4}</label>
	                    <i class="fa-solid fa-xmark" style="font-size:1.5rem;color:red"></i>
	                    </c:if>
	                    <c:if test='${q.answer.equals("opt4")}'>
	                    <label for="opt1" style="background-color:green">${q.option4}</label>
	                    <i class="fa-solid fa-check" style="font-size:1.5rem;color:rgb(11, 244, 11)"></i>
	                    </c:if>
                    </c:if>
                    <c:if test='${!attempetedanswer.equals("opt4")}'>
                    	<c:if test='${!q.answer.equals("opt4")}'>
                    	<label for="opt1">${q.option4}</label>
	                    </c:if>
	                    <c:if test='${q.answer.equals("opt4")}'>
	                    <label for="opt1" style="background-color:green">${q.option4}</label>
	                    <i class="fa-solid fa-check" style="font-size:1.5rem;color:rgb(11, 244, 11)"></i>
	                    </c:if>
                    </c:if>
                </div>
            </div>
           <div class="buttons">
                <c:if test="${i<=0}">
                	<a href="#" class="btn prev"><i class="fa-solid fa-arrow-left" ></i><span>Prev</span></a>
                </c:if>
                <c:if test="${i>0}">
                	<a href="prevquestion?i=${Integer.parseInt(i)}" class="btn prev"><i class="fa-solid fa-arrow-left"></i><span>Prev</span></a>
                </c:if>
                <input type="submit" value="Check Answer"  class="btn" disabled="disabled"/>
               <c:if test="${i<n-1}">
               		<a href="nextquestion?i=${Integer.parseInt(i)}" class="btn nxt"><span>Next</span><i class="fa-solid fa-arrow-right"></i></a>
               </c:if>
               <c:if test="${i>=n-1}">
               		<a href="submitquiz" class="btn nxt"><span>Submit</span><i class="fa-solid fa-arrow-right"></i></a>
               </c:if>
                	

             
           </div>
           </form>
           </c:if>
          </c:if>
        </div>
    </div>
    
</body>
</html>