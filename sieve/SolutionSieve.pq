(limit as number) as list =>
    let
        Numbers = {2..limit},
        // Generates a list of multiples of a given prime number within the range up to `limit`.
        Multipliers = (prime) => List.Generate(() => 2 * prime, each _ <= limit, each _ + prime),
        // Removes multiples of the current prime from the list of numbers, effectively sieving out non-prime numbers.
        Accumulator = (state, current) => List.RemoveItems(state, Multipliers(current)),
        Sieve = List.Accumulate(Numbers, Numbers, Accumulator)
    in
        Sieve
