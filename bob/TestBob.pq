let
    Uri = "/Users/jegors/Projects/Exercism/exercism-solutions-power-query-m/bob/canonical-data.json",
    Source = Json.Document(File.Contents(Uri)),
    Navigation = Source[cases],
    TestCases = Table.FromList(Navigation, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    Description = Table.ExpandRecordColumn(TestCases, "Column1", {"uuid", "description", "input", "expected"}),
    HeyBob = Table.ExpandRecordColumn(Description, "input", {"heyBob"}, {"heyBob"}),
    Actual = Table.AddColumn(HeyBob, "actual", each Solution([heyBob]), type text),
    TestPassed = Table.AddColumn(Actual, "passed", each [actual] = [expected], type logical)
in
    TestPassed
