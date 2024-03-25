let
    Source = ExerciseTestCases("acronym"),
    #"Expanded input" = Table.ExpandRecordColumn(Source, "input", {"phrase"}, {"phrase"}),
    #"Invoked custom function" = Table.AddColumn(
        #"Expanded input", "actual", each SolutionAcronym([phrase]), type text
    ),
    #"Added custom" = Table.AddColumn(#"Invoked custom function", "passed", each [expected] = [actual])
in
    #"Added custom"
