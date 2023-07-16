require "test_helper"

class Admin::FavoriteShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_favorite_shops_index_url
    assert_response :success
  end
end
