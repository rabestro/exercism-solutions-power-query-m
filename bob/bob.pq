(message as text) as text =>
    let
        yelling = Text.Upper(phrase) = phrase and Text.Lower(phrase) <> phrase,
        question = Text.EndsWith(phrase, "?"),
        phrase = Text.Trim(message)
    in
        if phrase = "" then
            "Fine. Be that way!"
        else if yelling and question then
            "Calm down, I know what I'm doing!"
        else if yelling then
            "Whoa, chill out!"
        else if question then
            "Sure."
        else
            "Whatever."
