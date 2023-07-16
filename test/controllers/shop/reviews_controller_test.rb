require "test_helper"

class Shop::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_reviews_index_url
    assert_response :success
  end
end
