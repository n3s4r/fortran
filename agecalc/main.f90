program AgeCalculator
    ! Calculates a person's age based on their date of birth
    ! by comparing it against the current system date using DATE_AND_TIME.
    implicit none

    ! Variables for current date/time components (VALUES array structure)
    ! date_time(1) = Year, date_time(2) = Month, date_time(3) = Day
    integer, dimension(8) :: date_time
    integer :: current_year, current_month, current_day

    ! Variables for date of birth input and calculated age
    integer :: birth_year, birth_month, birth_day
    integer :: age

    ! --- 1. Get Current Date from System ---
    call date_and_time(values=date_time)
    current_year  = date_time(1)
    current_month = date_time(2)
    current_day   = date_time(3)

    write(*,*) "Welcome to the Fortran Age Calculator!"
    write(*,*) "--------------------------------------"

    ! --- 2. Get Date of Birth from User ---
    write(*,*) "Enter your year of birth (YYYY):"
    read(*,*) birth_year

    write(*,*) "Enter your month of birth (MM, 1-12):"
    read(*,*) birth_month

    write(*,*) "Enter your day of birth (DD, 1-31):"
    read(*,*) birth_day

    ! Simple input check
    if (birth_year > current_year .or. birth_month < 1 .or. birth_month > 12 .or. &
        birth_day < 1 .or. birth_day > 31) then
        write(*,*) "Error: Invalid or future date of birth provided. Exiting."
        stop
    end if

    ! --- 3. Calculate the Preliminary Age ---
    ! Start with the difference in years
    age = current_year - birth_year

    ! --- 4. Adjust Age Based on Month and Day ---
    ! If the current month is before the birth month, the birthday hasn't passed yet.
    if (current_month < birth_month) then
        age = age - 1
    ! If it is the same month, check the day.
    else if (current_month == birth_month) then
        ! If the current day is before the birth day, the birthday hasn't passed yet.
        if (current_day < birth_day) then
            age = age - 1
        end if
    end if

    ! --- 5. Display the Result ---
    write(*,*) ""
    write(*,*) "Date of Birth: ", birth_year, "-", birth_month, "-", birth_day
    write(*,*) "Current Date:  ", current_year, "-", current_month, "-", current_day
    write(*,*) ""
    write(*,*) "Calculated Age: ", age, " years old."
    write(*,*) "--------------------------------------"

end program AgeCalculator
