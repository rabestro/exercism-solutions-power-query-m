let
    exercisesUrl = "https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises",
    canonicalData = "canonical-data.json",
    Source = (exercise as text) as table =>
        let
            uri = exercisesUrl & "/" & exercise & "/" & canonicalData,
            content = Web.Contents(uri),
            jsonDoc = Json.Document(content),
            cases = jsonDoc[cases],
            twoLevels = Record.FieldCount(cases{0}) = 2,
            TestData = Table.FromList(cases, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
            TestCases =
                if twoLevels then
                    let
                        TestSuits = Table.ExpandRecordColumn(
                            TestData, "Column1", {"description", "cases"}, {"category", "cases"}
                        ),
                        TestCases = Table.ExpandListColumn(TestSuits, "cases")
                    in
                        Table.ExpandRecordColumn(
                            TestCases, "cases", {"uuid", "description", "property", "input", "expected"}
                        )
                else
                    Table.ExpandRecordColumn(
                        TestData, "Column1", {"uuid", "description", "property", "input", "expected"}
                    )
        in
            TestCases
in
    Source
