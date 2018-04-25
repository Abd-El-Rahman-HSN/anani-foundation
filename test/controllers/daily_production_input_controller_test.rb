require 'test_helper'

class DailyProductionInputControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_production_input_index_url
    assert_response :success
  end

  test "should get new" do
    get daily_production_input_new_url
    assert_response :success
  end

  test "should get create" do
    get daily_production_input_create_url
    assert_response :success
  end

  test "should get edit" do
    get daily_production_input_edit_url
    assert_response :success
  end

  test "should get update" do
    get daily_production_input_update_url
    assert_response :success
  end

  test "should get destroy" do
    get daily_production_input_destroy_url
    assert_response :success
  end

end
