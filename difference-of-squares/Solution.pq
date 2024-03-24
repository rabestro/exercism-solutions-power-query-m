let
    SquareOfSum = each Number.Power(_ * (_ + 1) / 2, 2),
    SumOfSquares = each _ * (_ + 1) * (2 * _ + 1) / 6,
    DifferenceOfSquares = each SquareOfSum(_) - SumOfSquares(_),

    Source = (property as text, n as number) as number =>
        if property = "squareOfSum" then SquareOfSum(n)
        else if property = "sumOfSquares" then SumOfSquares(n)
        else if property = "differenceOfSquares" then DifferenceOfSquares(n)
        else Number.NaN
in
    Source
