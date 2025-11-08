program addition_program
  ! Prevents accidental declaration of variables
  implicit none

  ! Declare variables for the two input numbers and their sum
  integer :: num1, num2, sum_result

  ! --- Input Stage ---

  ! Prompt the user for the first number
  print *, "Please enter the first whole number:"
  ! Read the input from the user and store it in num1
  read *, num1

  ! Prompt the user for the second number
  print *, "Please enter the second whole number:"
  ! Read the input from the user and store it in num2
  read *, num2

  ! --- Calculation Stage ---

  ! Calculate the sum of the two numbers
  sum_result = num1 + num2

  ! --- Output Stage ---

  ! Print the final result in a friendly sentence
  print *, "-----------------------------------"
  print *, "The sum of", num1, "and", num2, "is:", sum_result
  print *, "-----------------------------------"

end program addition_program
