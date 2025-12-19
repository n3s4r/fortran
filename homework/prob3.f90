program main
    implicit none
    integer, parameter :: ni = 6
    integer, parameter :: nf = 2
    integer :: list1(ni) = (/ 6, 9, 9, 6, 96, 69 /)
    real :: list2(nf) = (/69.69, 96.69/)

    integer :: list3(ni)
    integer :: i, j, temp

    !Copying Integers
    list3 = list1

    !Sorting
    do i = 1, ni - 1
        do j = i + 1, ni
            if(list3(i) > list3(j)) then
                temp = list3(i)
                list3(i) = list3(j)
                list3(j) = temp
            end if
        end do
    end do

    !Printing Original List
    print *, "Original list:"
    do i = 1, ni
        print *, list1(i)
    end do
    do i = 1, nf
        print *, list2(i)
    end do

    !Printing Sorted List
    print *, "Sorted list:"
    do i = 1, ni
        print *, list3(i)
    end do

end program main