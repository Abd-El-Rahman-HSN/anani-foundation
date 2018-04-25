require 'test_helper'

class ShowroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get showrooms_index_url
    assert_response :success
  end

  test "should get new" do
    get showrooms_new_url
    assert_response :success
  end

  test "should get create" do
    get showrooms_create_url
    assert_response :success
  end

  test "should get edit" do
    get showrooms_edit_url
    assert_response :success
  end

  test "should get update" do
    get showrooms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get showrooms_destroy_url
    assert_response :success
  end

end
