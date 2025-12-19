program main
    implicit none
    real :: a, b, c
    real :: root1, root2

    print *, "Enter value of a:"
    read *, a
    print *, "Enter value of b:"
    read *, b
    print *, "Enter value of c:"
    read *, c

    call quadratic_function(a, b, c)

contains

    subroutine quadratic_function(a, b, c)
        implicit none
        real, intent(in) :: a, b, c
        real :: d, r1, r2

        d = b*b - 4.0*a*c

        if (d < 0.0) then
            print *, "Roots are complex"
            return
        end if

        r1 = (-b + sqrt(d)) / (2.0*a)
        r2 = (-b - sqrt(d)) / (2.0*a)

        if (d > 0.0) then
            print *, "Roots are real"
        else
            print *, "Repeated roots"
        end if

        print *, "Roots are:", r1, r2

    end subroutine quadratic_function

end program main
