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

🟦 9. Arrays in Fortran

(a) Declaring Arrays

integer, dimension(5) :: arr
real, dimension(3,3) :: matrix

arr → 1D array of size 5

matrix → 2D array (3×3)



---

(b) Initializing Arrays

integer :: arr(5) = (/1, 2, 3, 4, 5/)
real :: mat(2,2) = reshape((/1.0, 2.0, 3.0, 4.0/), (/2,2/))


---

(c) Accessing / Modifying Elements

arr(1) = 10
print *, arr(1)


---

(d) Array Operations

Fortran supports element-wise operations automatically:

real :: a(3) = (/1.0, 2.0, 3.0/)
real :: b(3) = (/4.0, 5.0, 6.0/)
real :: c(3)

c = a + b    ! Element-wise addition


---

(e) Array Loops

do i = 1, 5
    print *, arr(i)
end do


---

🟩 10. File Handling in Fortran

(a) Opening a File

open(unit=10, file="data.txt", status="old")

Common statuses:

"old" → file must already exist

"new" → create a new file, error if exists

"replace" → create new or overwrite

"unknown" → creates if needed, otherwise opens



---

(b) Reading From a File

integer :: x, y
open(unit=10, file="input.txt", status="old")
read(10, *) x, y
close(10)


---

(c) Writing to a File

open(unit=20, file="output.txt", status="replace")
write(20, *) "Hello File!"
write(20, *) 10, 20, 30
close(20)


---

(d) Reading a File Line-by-Line

character(len=100) :: line
open(unit=10, file="data.txt", status="old")

do
    read(10, '(A)', end=100) line
    print *, trim(line)
end do

100 continue
close(10)


---

(e) Using iostat for Error Checking

integer :: ios

open(unit=10, file="data.txt", status="old")

read(10, *, iostat=ios) x
if (ios /= 0) then
    print *, "Read error!"
end if

close(10)


---

🟦 11. Modules in Fortran

Modules are like libraries — you write functions, variables, types, etc., then import them.

Creating a Module

module math_module
    implicit none

contains
    function square(x) result(res)
        real, intent(in) :: x
        real :: res
        res = x * x
    end function square

end module math_module

Using a Module

program test
    use math_module
    implicit none

    print *, square(5.0)
end program test


---

🟩 12. Derived Types (like Classes/Structs)

Used to create custom data types:

type :: Student
    character(len=20) :: name
    integer :: age
    real :: gpa
end type Student

Using the Derived Type

type(Student) :: s

s%name = "Nesar"
s%age = 25
s%gpa = 3.5

% is used to access fields.


---

🟨 13. Pointers & Dynamic Arrays

(a) Allocating a Dynamic Array

integer, allocatable :: arr(:)

allocate(arr(10))   ! creates array of size 10

arr = 5             ! fills all with 5

deallocate(arr)


---

(b) Pointer Arrays

integer, target :: x = 10
integer, pointer :: p

p => x      ! pointer assignment
print *, p  ! prints 10

p = 20      ! modifies x
print *, x  ! prints 20

Pointer works like referencing.


---

(c) Dynamic 2D Arrays

real, allocatable :: mat(:,:)

allocate(mat(3,3))
mat = 0.0


---

🟧 14. File Positioning Commands

1. rewind – go back to start

rewind(10)

2. backspace – go one record back

backspace(10)

3. endfile – mark end of file

endfile(10)

4. flush – force write to disk

flush(20)

These are helpful when updating or scanning files repeatedly.


---

🟥 15. FULL SAMPLE PROGRAM

This example uses:

✔ module
✔ derived type
✔ dynamic arrays
✔ file read/write
✔ loops
✔ functions


---

module utils
    implicit none

contains

    function average(arr, n) result(avg)
        real, intent(in) :: arr(:)
        integer, intent(in) :: n
        real :: avg
        avg = sum(arr) / n
    end function average

end module utils


---

program student_data
    use utils
    implicit none

    type :: Student
        character(len=20) :: name
        integer :: age
        real :: marks(3)
    end type Student

    type(Student), allocatable :: students(:)
    integer :: n, i
    real :: avg

    print *, "How many students?"
    read *, n

    allocate(students(n))

    do i = 1, n
        print *, "Enter name, age and 3 marks:"
        read *, students(i)%name, students(i)%age, students(i)%marks
    end do

    open(unit=20, file="report.txt", status="replace")

    do i = 1, n
        avg = average(students(i)%marks, 3)
        write(20, *) trim(students(i)%name), students(i)%age, avg
    end do

    close(20)
    deallocate(students)

    print *, "Report generated!"
end program student_data


---
