require "test_helper"

class Shop::CustomerInquiryThreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_customer_inquiry_threads_index_url
    assert_response :success
  end
end
