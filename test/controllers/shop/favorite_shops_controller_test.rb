require "test_helper"

class Shop::FavoriteShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_favorite_shops_index_url
    assert_response :success
  end
end
