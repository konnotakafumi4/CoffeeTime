require "test_helper"

class Public::CoffeeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_coffee_new_url
    assert_response :success
  end

  test "should get index" do
    get public_coffee_index_url
    assert_response :success
  end

  test "should get show" do
    get public_coffee_show_url
    assert_response :success
  end
end
