require "test_helper"

class Shop::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get shop_orders_show_url
    assert_response :success
  end
end
