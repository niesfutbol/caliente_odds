describe("Clean table from html", {
  it("La Liga", {
    raw_table <- readr::read_csv("/workdir/tests/data/la_liga_odds_20240212.csv")
    expected <- readr::read_csv("/workdir/tests/data/expected_la_liga_odds_20240212.csv")
    obtained <- clean_table_from_html(raw_table)
    expect_equal(obtained, expected)
  })
})
