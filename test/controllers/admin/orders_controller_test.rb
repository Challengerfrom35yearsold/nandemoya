require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_orders_index_url
    assert_response :success
  end

  test "should get order_customers_index" do
    get admin_orders_order_customers_index_url
    assert_response :success
  end

  test "should get order_shops_index" do
    get admin_orders_order_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_orders_show_url
    assert_response :success
  end
end
