require 'test_helper'

class JobOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_orders_index_url
    assert_response :success
  end

  test "should get new" do
    get job_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get job_orders_create_url
    assert_response :success
  end

  test "should get edit" do
    get job_orders_edit_url
    assert_response :success
  end

  test "should get update" do
    get job_orders_update_url
    assert_response :success
  end

  test "should get destroy" do
    get job_orders_destroy_url
    assert_response :success
  end

end
