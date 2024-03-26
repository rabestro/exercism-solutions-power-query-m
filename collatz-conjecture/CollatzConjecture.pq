let
    steps = (n as number) as number =>
        if n < 1 then
            error "Only positive numbers are allowed"
        else if n = 1 then
            0
        else if Number.IsEven(n) then
            1 + @steps(n / 2)
        else
            1 + @steps(3 * n + 1)
in
    steps
