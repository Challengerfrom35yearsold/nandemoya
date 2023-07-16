require "test_helper"

class Customer::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_reviews_new_url
    assert_response :success
  end

  test "should get edit" do
    get customer_reviews_edit_url
    assert_response :success
  end

  test "should get index" do
    get customer_reviews_index_url
    assert_response :success
  end

  test "should get item_reviews" do
    get customer_reviews_item_reviews_url
    assert_response :success
  end
end
