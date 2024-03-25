(max as number) as list =>
    let
        Numbers = {2..max},
        Multipliers = (prime) => List.Generate(() => 2 * prime, each _ <= max, each _ + prime),
        Accumulator = (state, current) => List.RemoveItems(state, Multipliers(current)),
        Sieve = List.Accumulate(Numbers, Numbers, Accumulator)
    in
        Sieve
