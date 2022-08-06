require "test_helper"

class Public::FavoriteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_favorite_index_url
    assert_response :success
  end
end
