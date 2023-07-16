require "test_helper"

class Customer::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_addresses_new_url
    assert_response :success
  end

  test "should get index" do
    get customer_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get customer_addresses_edit_url
    assert_response :success
  end
end
