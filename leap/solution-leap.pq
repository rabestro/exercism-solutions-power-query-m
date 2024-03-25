/*
    Determine whether a given year is a leap year.
*/
let
    Solution = (year as number) as logical =>
        Number.Mod(year, 4) = 0 and (Number.Mod(year, 100) <> 0 or Number.Mod(year, 400) = 0)
in
    Solution
