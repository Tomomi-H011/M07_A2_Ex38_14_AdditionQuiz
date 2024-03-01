/*
This file defines JavaBean class for generating random numbers and accessor and mutator methods.
*/

package AdditionQuiz;

import java.util.Random;

public class AdditionQuizBean {
    private int[][] numbers;
    
    public AdditionQuizBean() {    
    }

    public int[][] getNumbers() {
        return numbers;
    }

    public void setNumbers(int[][] numbers) {
        this.numbers = numbers;
    }
    
    // Define a method to generate random numbers for the quiz
    public void generateRandomNumbers() {
        numbers = new int[10][2];
        Random randomNumber = new Random();
        
        for (int i =0; i < 10; i++) {
            numbers[i][0] = randomNumber.nextInt(100) + 1;
            numbers[i][1] = randomNumber.nextInt(100) + 1;
        }
    }
}
