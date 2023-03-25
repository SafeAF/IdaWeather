require "application_system_test_case"

class GraphsTest < ApplicationSystemTestCase
  setup do
    @graph = graphs(:one)
  end

  test "visiting the index" do
    visit graphs_url
    assert_selector "h1", text: "Graphs"
  end

  test "should create graph" do
    visit graphs_url
    click_on "New graph"

    fill_in "Category", with: @graph.category
    fill_in "Chart type", with: @graph.chart_type
    fill_in "Day", with: @graph.day
    fill_in "Dependent var", with: @graph.dependent_var
    fill_in "Description", with: @graph.description
    fill_in "End year", with: @graph.end_year
    fill_in "Function", with: @graph.function
    fill_in "Hour", with: @graph.hour
    fill_in "Independent var", with: @graph.independent_var
    fill_in "Lat", with: @graph.lat
    fill_in "Location", with: @graph.location
    fill_in "Lon", with: @graph.lon
    fill_in "Month", with: @graph.month
    fill_in "Name", with: @graph.name
    check "Range" if @graph.range
    fill_in "Start year", with: @graph.start_year
    fill_in "Study", with: @graph.study_id
    fill_in "Year", with: @graph.year
    click_on "Create Graph"

    assert_text "Graph was successfully created"
    click_on "Back"
  end

  test "should update Graph" do
    visit graph_url(@graph)
    click_on "Edit this graph", match: :first

    fill_in "Category", with: @graph.category
    fill_in "Chart type", with: @graph.chart_type
    fill_in "Day", with: @graph.day
    fill_in "Dependent var", with: @graph.dependent_var
    fill_in "Description", with: @graph.description
    fill_in "End year", with: @graph.end_year
    fill_in "Function", with: @graph.function
    fill_in "Hour", with: @graph.hour
    fill_in "Independent var", with: @graph.independent_var
    fill_in "Lat", with: @graph.lat
    fill_in "Location", with: @graph.location
    fill_in "Lon", with: @graph.lon
    fill_in "Month", with: @graph.month
    fill_in "Name", with: @graph.name
    check "Range" if @graph.range
    fill_in "Start year", with: @graph.start_year
    fill_in "Study", with: @graph.study_id
    fill_in "Year", with: @graph.year
    click_on "Update Graph"

    assert_text "Graph was successfully updated"
    click_on "Back"
  end

  test "should destroy Graph" do
    visit graph_url(@graph)
    click_on "Destroy this graph", match: :first

    assert_text "Graph was successfully destroyed"
  end
end
