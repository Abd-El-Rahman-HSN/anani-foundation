require 'test_helper'

class LoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get looms_index_url
    assert_response :success
  end

  test "should get new" do
    get looms_new_url
    assert_response :success
  end

  test "should get create" do
    get looms_create_url
    assert_response :success
  end

  test "should get edit" do
    get looms_edit_url
    assert_response :success
  end

  test "should get update" do
    get looms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get looms_destroy_url
    assert_response :success
  end

end
