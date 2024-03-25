/*
    Determine whether a given year is a leap year.
*/
(year as number) as logical => Date.IsLeapYear(#date(year, 1, 1))
