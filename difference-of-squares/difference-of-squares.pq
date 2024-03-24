let
    SquareOfSum = each Number.Power(_ * (_ + 1) / 2, 2),
    SumOfSquares = each _ * (_ + 1) * (2 * _ + 1) / 6,
    DifferenceOfSquares = each SquareOfSum(_) - SumOfSquares(_),
    Calculations = [
        squareOfSum = SquareOfSum,
        sumOfSquares = SumOfSquares,
        differenceOfSquares = DifferenceOfSquares
    ],
    Solution = (property as text, n as number) as number =>
        Record.FieldOrDefault(Calculations, property, Number.NaN)(n)
in
    Solution
