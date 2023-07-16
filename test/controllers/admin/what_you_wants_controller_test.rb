require "test_helper"

class Admin::WhatYouWantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_what_you_wants_index_url
    assert_response :success
  end
end
