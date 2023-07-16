require "test_helper"

class Customer::CustomerInquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_customer_inquiries_new_url
    assert_response :success
  end

  test "should get create" do
    get customer_customer_inquiries_create_url
    assert_response :success
  end

  test "should get index" do
    get customer_customer_inquiries_index_url
    assert_response :success
  end
end
