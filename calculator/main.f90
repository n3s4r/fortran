! calculator.f90
! A simple Fortran 90 program for basic arithmetic calculations.
! It reads two numbers and an operator (+, -, *, /) and prints the result.

program basic_calculator
    ! Declare variables
    implicit none
    real :: num1, num2, result
    character(len=1) :: operator

    ! --- Input Phase ---
    write(*,*) '--- Fortran Basic Calculator ---'
    write(*,*) 'Enter the first number (e.g., 10.5):'
    read(*,*) num1

    write(*,*) 'Enter the operator (+, -, *, /):'
    read(*,*) operator

    write(*,*) 'Enter the second number (e.g., 5.0):'
    read(*,*) num2

    ! --- Calculation Phase ---
    select case (operator)
    case ('+')
        result = num1 + num2
        write(*,*) 'Result:', num1, '+', num2, '=', result
    case ('-')
        result = num1 - num2
        write(*,*) 'Result:', num1, '-', num2, '=', result
    case ('*')
        result = num1 * num2
        write(*,*) 'Result:', num1, '*', num2, '=', result
    case ('/')
        ! Check for division by zero before performing the operation
        if (abs(num2) < 1.0E-8) then  ! Use a small epsilon for floating point comparison
            write(*,*) 'Error: Division by zero is not allowed.'
            stop 1  ! Stop the program with an error code
        else
            result = num1 / num2
            write(*,*) 'Result:', num1, '/', num2, '=', result
        end if
    case default
        ! Handle invalid operators
        write(*,*) 'Error: Invalid operator entered. Please use +, -, *, or /.'
        stop 1
    end select

    write(*,*) '----------------------------------'

end program basic_calculator
