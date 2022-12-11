<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title> Know You</title>
    <link rel="icon" type="image/x-icon" href="https://raw.githubusercontent.com/Suprith99/StudentAssessmentTrainingProject/main/SDP3/StudentAssessmentTraining/src/main/webapp/images/logo.ico?token=GHSAT0AAAAAAB2FZ75ACEHPOBZRKIDBDUPYY3SMX6Q">
    <link rel="stylesheet" href="style.css">
    <!-- FontAweome CDN Link for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="css/displayquiz.css">
</head>
<body>
    <main>

        <div class="game-quiz-container">
            <div class="game-question-container">
                <h1 id="display-question">${question.name}</h1>
            </div>
            <form class="game-options-container" method="post" action="/nextquestion">
                
                <span class="radiobutton">
                    <input  type="radio" id="option-one" name="option" class="radio" value="opt1" />
                    <label for="option-one" class="option" id="option-one-label">${question.option1}</label>
                </span>


                <span class="radiobutton">
                    <input type="radio" id="option-two" name="option" class="radio" value="opt2" />
                    <label for="option-two" class="option" id="option-two-label">${question.option2}</label>
                </span>


                <span class="radiobutton">
                    <input type="radio" id="option-three" name="option" class="radio" value="opt3" />
                    <label for="option-three" class="option" id="option-three-label">${question.option3}</label>
                </span>


                <span class="radiobutton">
                    <input type="radio" id="option-four" name="option" class="radio" value="opt4" />
                    <label for="option-four" class="option" id="option-four-label">${question.option4}</label>
                </span>
				<div class="next-button-container">
                <input class="btn" type="submit" value="Next Question">
            </div>


     
        </form>
   
    </div>
    </main>
  
</body>
</html>