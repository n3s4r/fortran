program main
    implicit none
    real :: average

    average = result_details()
    print *, "Average Score:", average

contains

    real function result_details()
        implicit none
        integer :: n, i
        integer :: score
        real :: total
        character(len=20) :: course_code
        character(len=10) :: section

        total = 0.0

        print *, "Enter number of courses (at least 4):"
        read *, n

        do while (n < 4)
            print *, "You must enter at least 4 courses."
            read *, n
        end do

        do i = 1, n
            print *, "Enter course code:"
            read *, course_code

            print *, "Enter section:"
            read *, section

            print *, "Enter fictitious score:"
            read *, score

            total = total + score
        end do

        result_details = total / n

    end function result_details

end program main 