let
  Uri = "/Users/jegors/Projects/Exercism/exercism-solutions-power-query-m/difference-of-squares/canonical-data.json",
  Source = Json.Document(File.Contents(Uri)),
  Navigation = Source[cases],
  #"Converted to table" = Table.FromList(Navigation, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
  TestSuits = Table.ExpandRecordColumn(#"Converted to table", "Column1", {"description", "cases"}, {"description", "cases"}),
  TestCases = Table.ExpandListColumn(TestSuits, "cases"),
  Description = Table.ExpandRecordColumn(TestCases, "cases", {"uuid", "description", "property", "input", "expected"}, {"uuid", "case", "property", "input", "expected"}),
  Number = Table.ExpandRecordColumn(Description, "input", {"number"}, {"number"}),
  Actual = Table.AddColumn(Number, "actual", each Solution([property], [number]), type number),
  TestResults = Table.AddColumn(Actual, "passed", each [actual]=[expected], type logical)
in
  TestResults
