require "test_helper"

class Shop::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get inquiry" do
    get shop_shops_inquiry_url
    assert_response :success
  end

  test "should get show" do
    get shop_shops_show_url
    assert_response :success
  end

  test "should get edit" do
    get shop_shops_edit_url
    assert_response :success
  end

  test "should get shop_page" do
    get shop_shops_shop_page_url
    assert_response :success
  end

  test "should get shop_page_edit" do
    get shop_shops_shop_page_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get shop_shops_unsubscribe_url
    assert_response :success
  end
end
