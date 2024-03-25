let
    exercisesUrl = "https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises",
    canonicalData = "canonical-data.json",
    TestTable = (exercise as text) as table =>
        let
            uri = exercisesUrl & "/" & exercise & "/" & canonicalData,
            content = Web.Contents(uri),
            jsonDoc = Json.Document(content),
            cases = jsonDoc[cases],
            TestData = Table.FromList(cases, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
            // Two
            TestSuits = Table.ExpandRecordColumn(
                TestData, "Column1", {"description", "cases"}, {"description", "cases"}
            ),
            TestCases = Table.ExpandListColumn(TestSuits, "cases"),
            TestProperty = Table.ExpandRecordColumn(
                TestCases,
                "cases",
                {"uuid", "description", "property", "input", "expected"},
                {"uuid", "case", "property", "input", "expected"}
            )
        in
            TestProperty
in
    TestTable
