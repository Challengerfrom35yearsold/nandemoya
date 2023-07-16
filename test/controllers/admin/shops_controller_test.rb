require "test_helper"

class Admin::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_shops_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_shops_edit_url
    assert_response :success
  end

  test "should get shop_page" do
    get admin_shops_shop_page_url
    assert_response :success
  end

  test "should get shop_page_edit" do
    get admin_shops_shop_page_edit_url
    assert_response :success
  end
end
