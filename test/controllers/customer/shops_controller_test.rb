require "test_helper"

class Customer::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_shops_show_url
    assert_response :success
  end
end
