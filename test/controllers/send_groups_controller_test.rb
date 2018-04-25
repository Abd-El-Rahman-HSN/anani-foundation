require 'test_helper'

class SendGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @send_group = send_groups(:one)
  end

  test "should get index" do
    get send_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_send_group_url
    assert_response :success
  end

  test "should create send_group" do
    assert_difference('SendGroup.count') do
      post send_groups_url, params: { send_group: { serial: @send_group.serial, workshoop_id: @send_group.workshoop_id } }
    end

    assert_redirected_to send_group_url(SendGroup.last)
  end

  test "should show send_group" do
    get send_group_url(@send_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_send_group_url(@send_group)
    assert_response :success
  end

  test "should update send_group" do
    patch send_group_url(@send_group), params: { send_group: { serial: @send_group.serial, workshoop_id: @send_group.workshoop_id } }
    assert_redirected_to send_group_url(@send_group)
  end

  test "should destroy send_group" do
    assert_difference('SendGroup.count', -1) do
      delete send_group_url(@send_group)
    end

    assert_redirected_to send_groups_url
  end
end
