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
<body >
    <main>
		
        <div class="game-quiz-container">

            <div class="game-details-container">
                <h1>Score : <span id="player-score"></span> ${score}</h1>
                <h1> TotalScore : <span id="question-number"></span> ${totalscore}</h1>
            </div>
			<c:if test="${percentage>40}">
				<img style="width: 300px;" src="images/congrats-gif-edit.gif" />
			</c:if>
			<c:if test="${percentage<40}">
				<img style="width: 300px;" src="images/sadgif.gif" />
			</c:if>
			
            <div>
				
                <a href="viewquizcategory?c_id=${c_id}&filter=<c:out value="incomplete"></c:out>" class="btn">Go To Course</a>
               
            </div>
   
    </div>
    
    </main>
   
</body>
</html>