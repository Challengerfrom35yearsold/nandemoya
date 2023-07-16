require "test_helper"

class Customer::FavoriteShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_favorite_shops_index_url
    assert_response :success
  end
end
