require "test_helper"

class Shop::AdminInquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shop_admin_inquiries_new_url
    assert_response :success
  end

  test "should get index" do
    get shop_admin_inquiries_index_url
    assert_response :success
  end
end
