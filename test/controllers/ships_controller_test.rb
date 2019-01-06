require 'test_helper'

class ShipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ships_index_url
    assert_response :success
  end

  test "should get add" do
    get ships_add_url
    assert_response :success
  end

  test "should get show" do
    get ships_show_url
    assert_response :success
  end

end
