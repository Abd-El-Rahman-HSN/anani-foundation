require 'test_helper'

class CarpetDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carpet_data_index_url
    assert_response :success
  end

  test "should get new" do
    get carpet_data_new_url
    assert_response :success
  end

  test "should get create" do
    get carpet_data_create_url
    assert_response :success
  end

  test "should get edit" do
    get carpet_data_edit_url
    assert_response :success
  end

  test "should get update" do
    get carpet_data_update_url
    assert_response :success
  end

  test "should get destroy" do
    get carpet_data_destroy_url
    assert_response :success
  end

end
