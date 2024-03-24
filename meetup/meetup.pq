let
    LastDayOfMonth = (year as number, month as number) as number =>
        let
            date = #date(year, month, 1),
            nextMonth = Date.AddMonths(date, 1),
            lastDay = Date.AddDays(nextMonth, -1),
            day = Date.Day(lastDay)
        in
            day,
    FindDate = (startDate as date, dayOfWeek as text) as date =>
        let
            dates = List.Transform({-6..0}, each Date.AddDays(startDate, -_))
        in
            List.Select(dates, each Date.DayOfWeekName(_, "en-US") = dayOfWeek){0},
    Solution = (year as number, month as number, week as text, dayOfWeek as text) as date =>
        let
            day =
                if week = "first" then
                    1
                else if week = "second" then
                    8
                else if week = "third" then
                    15
                else if week = "fourth" then
                    22
                else if week = "teenth" then
                    13
                else
                    LastDayOfMonth(year, month) - 6
        in
            FindDate(#date(year, month, day), dayOfWeek)
in
    Solution
