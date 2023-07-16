require "test_helper"

class Admin::ShopGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_shop_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_shop_genres_edit_url
    assert_response :success
  end
end
