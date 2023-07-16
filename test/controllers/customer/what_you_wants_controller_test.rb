require "test_helper"

class Customer::WhatYouWantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_what_you_wants_index_url
    assert_response :success
  end
end
