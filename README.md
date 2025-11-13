# fortran
Here’s a quick guide to basic Fortran syntaxes 👇


---

🟦 1. Program Structure

program hello_world
    implicit none
    print *, "Hello, World!"
end program hello_world

✅ program ... end program → defines the start and end of a program
✅ implicit none → forces explicit variable declaration (good practice)


---

🟩 2. Variable Declaration

integer :: a, b, sum
real :: x, y
character(len=20) :: name
logical :: flag

✅ :: is used when declaring variables
✅ len=20 defines the string length


---

🟨 3. Input / Output

print *, "Enter two numbers:"
read *, a, b
sum = a + b
print *, "Sum =", sum

✅ print * → outputs text or variables
✅ read * → takes input from the user


---

🟧 4. Conditional Statements

if (a > b) then
    print *, "A is greater"
else if (a == b) then
    print *, "A and B are equal"
else
    print *, "B is greater"
end if


---

🟥 5. Loops

(a) DO Loop

do i = 1, 10
    print *, i
end do

(b) EXIT / CYCLE

do i = 1, 10
    if (i == 5) cycle
    if (i == 8) exit
    print *, i
end do


---

🟪 6. Functions

function add(a, b) result(sum)
    implicit none
    integer, intent(in) :: a, b
    integer :: sum
    sum = a + b
end function add

Calling it:

program main
    implicit none
    integer :: x
    x = add(5, 3)
    print *, "Sum =", x
end program main


---

🟫 7. Subroutines

subroutine greet(name)
    implicit none
    character(len=20), intent(in) :: name
    print *, "Hello,", name
end subroutine greet

Calling it:

program main
    implicit none
    call greet("Nesar")
end program main


---

⚪ 8. Comments

! This is a comment


---
