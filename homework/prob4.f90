program cumulative_circle
    implicit none

    integer, parameter :: n = 10
    integer :: nums(n), cum(n)
    integer :: i, count
    real :: area

    call random_seed()

    !Generating random numbers
    do i = 1, n
        call random_number(area)
        nums(i) = int(area * 20) + 1
    end do

    print *, "Original list:"
    print *, nums

    !Cumulative sum
    call cumulative_sum(nums, cum, n)

    print *, "Cumulative sum list:"
    print *, cum

    !Area calculation
    count = 0
    print *, "Areas of circles (radius divisible by 3):"

    do i = 1, n
        if (mod(cum(i), 3) == 0) then
            area = 3.14159 * real(cum(i)) * real(cum(i))
            print *, area
            count = count + 1
        end if
    end do

    if (count == 0) then
        print *, "radius not found"
    end if

contains

    subroutine cumulative_sum(arr, result, size)
        implicit none
        integer, intent(in) :: size
        integer, intent(in) :: arr(size)
        integer, intent(out) :: result(size)
        integer :: i

        result(1) = arr(1)
        do i = 2, size
            result(i) = result(i-1) + arr(i)
        end do
    end subroutine cumulative_sum

end program cumulative_circle
