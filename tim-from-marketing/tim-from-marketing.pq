(name as text, optional id as number, optional department as text) as text =>
    let
        sid = if id = null or id = #nan then "" else "[" & Text.From(id) & "] - ",
        dep = if department = null or department = "" then "OWNER" else Text.Upper(department)
    in
        sid & name & " - " & dep
