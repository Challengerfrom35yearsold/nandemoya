require "test_helper"

class Admin::ShopInquiryThreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_shop_inquiry_threads_index_url
    assert_response :success
  end
end
