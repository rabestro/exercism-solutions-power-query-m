/*
    Convert a long phrase to its acronym.
*/
(phrase as text) as text =>
    let
        Words = Text.SplitAny(phrase, " -_"),
        FirstLetters = List.Transform(Words, each Text.Start(_, 1)),
        Acronym = Combiner.CombineTextByDelimiter("")(FirstLetters)
    in
        Text.Upper(Acronym)
