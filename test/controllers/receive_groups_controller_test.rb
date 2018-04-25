require 'test_helper'

class ReceiveGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receive_group = receive_groups(:one)
  end

  test "should get index" do
    get receive_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_receive_group_url
    assert_response :success
  end

  test "should create receive_group" do
    assert_difference('ReceiveGroup.count') do
      post receive_groups_url, params: { receive_group: { serial: @receive_group.serial, workshop_id: @receive_group.workshop_id } }
    end

    assert_redirected_to receive_group_url(ReceiveGroup.last)
  end

  test "should show receive_group" do
    get receive_group_url(@receive_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_receive_group_url(@receive_group)
    assert_response :success
  end

  test "should update receive_group" do
    patch receive_group_url(@receive_group), params: { receive_group: { serial: @receive_group.serial, workshop_id: @receive_group.workshop_id } }
    assert_redirected_to receive_group_url(@receive_group)
  end

  test "should destroy receive_group" do
    assert_difference('ReceiveGroup.count', -1) do
      delete receive_group_url(@receive_group)
    end

    assert_redirected_to receive_groups_url
  end
end
