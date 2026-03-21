require "test_helper"

class FruitsControllerTest < ActionDispatch::IntegrationTest
  # Tests are useful, but they should be pretty bare-bones here.
  #
  # Right now the only thing the Controller does is query results,
  # and we are testing that it gives the correct ones with Postman.
  #
  # So for now, we should just be testing that the Controller works on
  # both a happy and unhappy path.
  #
  # If we start adding more complex behavior to the Controller (for example,
  # redirecting on errors, doing business logic besides just querying the db,
  # etc.), then more complex tests should be added here.

  test "happy path" do
    get api_index_path

    assert_response :success
    assert_kind_of Array, value
    assert value.any?
  end

  test "return nil when no results" do
    get api_index_path, params: { name: "tomato" }

    assert_nil value
  end

  def json
    JSON.parse(response.body)
  end

  def value
    json["value"]
  end
end
