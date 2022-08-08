require "test_helper"

class Public::CoffeeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_coffee_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_coffee_comments_destroy_url
    assert_response :success
  end
end
