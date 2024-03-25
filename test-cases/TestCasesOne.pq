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
            
            TestCases = Table.ExpandRecordColumn(
                TestData,
                "Column1",
                {"uuid", "description", "property", "input", "expected"},
                {"uuid", "description", "property", "input", "expected"}
            )
        in
            TestCases
in
    TestTable
