require "test_helper"

class Admin::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get genre_selection" do
    get admin_genres_genre_selection_url
    assert_response :success
  end
end
