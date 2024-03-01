<%--
* Description: This file is responsible for fetching the answers that are submitted by
                a user and displaying the result of the addition quiz. Either 'Correct' or 'Wrong'
                will be displayed next to each question. Also, the total count of correct 
                answers will be displayed at the bottom.
* Variables: 
    -guesses: An array to hold the user's answers that are submitted on index.jsp.
    -numbers: A 2D array to store 10 sets of 2 random numbers.
    -correctAnswers: An array to calculate and hold correct answers for the quiz.
    -count: An integer, representing the total count of correct answers.
* Steps:
    1. Retrieve user-submitted answers from index.jsp and store them in an array as integers.
    2. Calculate correct answers for the quiz and store them in an array.
    3. Compare the user's answers and correct answers
    4. Loop through all the arrays and print the quiz and results while keeping the count of correct answers.
    5. Print the total count of correct answers.
* Note: Related files
    -index.jsp: A JSP file to display the addition quiz and accept user input.
    -AdditionQuizBean.java: A JavaBeans file defining the AdditionQuizBean class.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="AdditionQuiz.AdditionQuizBean" %>
<%@ page import="java.util.Arrays" %>

<jsp:useBean id="quizBean" scope="application" class="AdditionQuiz.AdditionQuizBean" />


<!DOCTYPE html>
<html>
<head>
    <title>Display Answers</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
    <body>

        <%
            // Retrieve submitted answers from index.jsp and put in an array of int
            int[] guesses = new int[10];
            for (int i = 0; i < 10; i++) {
                String guessString = request.getParameter("guess" + i);  // Get values from guess0 through guess9
                if (guessString == null || guessString.isEmpty()) {
                    guesses[i] = 0;
                }
                else {
                    try {
                        guesses[i] = Integer.parseInt(guessString);
                    }
                    catch (NumberFormatException e){
                        guesses[i] = 0; // Invalid entry will be replaced with 0.
                    }
                }
            }
                         
            // Calculate the correct answers and store in an array
            int[][] numbers = quizBean.getNumbers();
            int[] correctAnswers = new int[10];
            
            for (int i = 0; i < 10; i++){
                correctAnswers[i] = numbers[i][0] + numbers[i][1];
            }

            int count = 0; // To count the total of correct answers
            
            // Display questions and answers
            for (int i = 0; i < 10; i++) {
                int num1 = numbers[i][0];
                int num2 = numbers[i][1];
                int guess = guesses[i];
                int correctAnswer = correctAnswers[i];
                String message = "";
                
                
                if (guess == correctAnswer){
                    message = "Correct";
                    count += 1;
                }
                else {
                    message = "Wrong";
                }
        %>
        
        <%--Print the results--%>
        <%= num1 %> + <%= num2 %> = <%= guess %> <%= message %><br>
            
        <%
            }
        %>
        
        The total correct count is <%= count%>
        
    </body>
</html>