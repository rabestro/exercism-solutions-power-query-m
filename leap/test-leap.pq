let
  Source = ExerciseTestCases("leap"),
  Input = Table.ExpandRecordColumn(Source, "input", {"year"}, {"year"}),
  Actual = Table.TransformColumnTypes(Table.AddColumn(Input, "actual", each #"Solution Leap"([year])), {{"actual", type logical}}),
  Result = Table.TransformColumnTypes(Table.AddColumn(Actual, "passed", each [expected]=[actual]), {{"passed", type logical}})
in
  Result
