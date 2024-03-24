let
    Source = TestCasesOne("meetup"),
    Parameters = Table.ExpandRecordColumn(Source, "input", {"year", "month", "week", "dayofweek"}),
    TypedParameters = Table.TransformColumnTypes(
        Parameters,
        {
            {"year", Int64.Type},
            {"month", Int64.Type},
            {"week", type text},
            {"dayofweek", type text},
            {"expected", type date}
        }
    ),
    Actual = Table.AddColumn(TypedParameters, "actual", each Meetup([year], [month], [week], [dayofweek]), type date),
    TestResults = Table.AddColumn(Actual, "passed", each [expected] = [actual])
in
    TestResults
