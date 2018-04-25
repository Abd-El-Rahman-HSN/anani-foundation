require 'test_helper'

class ReductionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reduction = reductions(:one)
  end

  test "should get index" do
    get reductions_url
    assert_response :success
  end

  test "should get new" do
    get new_reduction_url
    assert_response :success
  end

  test "should create reduction" do
    assert_difference('Reduction.count') do
      post reductions_url, params: { reduction: { cost: @reduction.cost, worker_id: @reduction.worker_id, workshop_id: @reduction.workshop_id } }
    end

    assert_redirected_to reduction_url(Reduction.last)
  end

  test "should show reduction" do
    get reduction_url(@reduction)
    assert_response :success
  end

  test "should get edit" do
    get edit_reduction_url(@reduction)
    assert_response :success
  end

  test "should update reduction" do
    patch reduction_url(@reduction), params: { reduction: { cost: @reduction.cost, worker_id: @reduction.worker_id, workshop_id: @reduction.workshop_id } }
    assert_redirected_to reduction_url(@reduction)
  end

  test "should destroy reduction" do
    assert_difference('Reduction.count', -1) do
      delete reduction_url(@reduction)
    end

    assert_redirected_to reductions_url
  end
end
