<%-- 
* Assignment: SDEV200_M07_A2_Ex38_14
* File: index.jsp
* Version: 1.0
* Date: 2/29/2024
* Author: Tomomi Hobara
* Description: This program displays ten addition questions by generating random numbers.
               Then, it accepts user input for answers. 
               When the Submit button is clicked, it opens another web page and displays the results.
* Variables: 
    -quizBean: An instance of the JavaBeans class, AdditionQuizBean, for generating random numbers.
    -numbers: A 2D array to store 10 sets of 2 random numbers.  
* Steps:
    1. Create an instance of the AdditionQuizBean
    2. Generate random numbers by calling the generateRandomNumbers() method on the instance
    3. Set the instance as an attribute in the application scope.
    4. Retrieve the 2D array of random numbers.
    5. Display the 10 questions on an HTML page.
    6. Accept user input for the answers
    7. Send the user input to ShowAnswers.jsp     
* Note: Related files
    -ShowAnswers.jsp: A JSP file to check and display answers
    -AdditionQuizBean.java: A JavaBeans file defining the AdditionQuizBean class
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="AdditionQuiz.AdditionQuizBean" %>
<%@page import="java.util.Random" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id = "AdditionQuizBean" scope="application" 
             class = "AdditionQuiz.AdditionQuizBean">
</jsp:useBean>


<!DOCTYPE html>
<html>
    <head>
        <title>Addition Quiz</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%--Declaration--%>
        <%
        // Create an instance of a JavaBeans
        AdditionQuizBean quizBean = new AdditionQuizBean();
        
        quizBean.generateRandomNumbers();
        
        application.setAttribute("quizBean", quizBean);    // Set scope as global access
        
        // Declare an array to store 10 sets of 2 random numbers
        int[][] numbers = quizBean.getNumbers();

        
        %>

        <form action="http://localhost:8080/AdditionQuiz/ShowAnswers.jsp" method="post">  <%--Action for the Submit button--%>
        
            <%
                //Display 10 questions
                for (int i = 0; i < 10; i++) {
                    int num1 = numbers[i][0];
                    int num2 = numbers[i][1];
             %>     
             <%= num1 %> + <%= num2 %>  = <input type="text" name="guess<%= i %>" /><br>  <%--Name user input as guess0 through guess9--%>
                    <br>
            <%
                }
            %>

            <p><input type ="submit" name ="Submit" value ="Submit"/> Click the browser's refresh button to get a new quiz</p>
        
        </form>
    </body>
</html>
