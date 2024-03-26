(subject as text, candidates as list) as list =>
    let
        Word = Text.Lower(subject),
        Letters = List.Sort(Text.ToList(Word)),
        IsAnagram = (candidate as text) as logical =>
            Comparer.OrdinalIgnoreCase(Word, candidate) <> 0
            and List.Sort(Text.ToList(Text.Lower(candidate))) = Letters
    in
        List.Select(candidates, IsAnagram)
