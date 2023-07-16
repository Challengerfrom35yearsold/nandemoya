require "test_helper"

class Shop::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get shop_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get shop_homes_about_url
    assert_response :success
  end
end
