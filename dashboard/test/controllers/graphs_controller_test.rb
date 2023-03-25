require "test_helper"

class GraphsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @graph = graphs(:one)
  end

  test "should get index" do
    get graphs_url
    assert_response :success
  end

  test "should get new" do
    get new_graph_url
    assert_response :success
  end

  test "should create graph" do
    assert_difference("Graph.count") do
      post graphs_url, params: { graph: { category: @graph.category, chart_type: @graph.chart_type, day: @graph.day, dependent_var: @graph.dependent_var, description: @graph.description, end_year: @graph.end_year, function: @graph.function, hour: @graph.hour, independent_var: @graph.independent_var, lat: @graph.lat, location: @graph.location, lon: @graph.lon, month: @graph.month, name: @graph.name, range: @graph.range, start_year: @graph.start_year, study_id: @graph.study_id, year: @graph.year } }
    end

    assert_redirected_to graph_url(Graph.last)
  end

  test "should show graph" do
    get graph_url(@graph)
    assert_response :success
  end

  test "should get edit" do
    get edit_graph_url(@graph)
    assert_response :success
  end

  test "should update graph" do
    patch graph_url(@graph), params: { graph: { category: @graph.category, chart_type: @graph.chart_type, day: @graph.day, dependent_var: @graph.dependent_var, description: @graph.description, end_year: @graph.end_year, function: @graph.function, hour: @graph.hour, independent_var: @graph.independent_var, lat: @graph.lat, location: @graph.location, lon: @graph.lon, month: @graph.month, name: @graph.name, range: @graph.range, start_year: @graph.start_year, study_id: @graph.study_id, year: @graph.year } }
    assert_redirected_to graph_url(@graph)
  end

  test "should destroy graph" do
    assert_difference("Graph.count", -1) do
      delete graph_url(@graph)
    end

    assert_redirected_to graphs_url
  end
end
