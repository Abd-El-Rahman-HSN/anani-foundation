require 'test_helper'

class RequestMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_material = request_materials(:one)
  end

  test "should get index" do
    get request_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_request_material_url
    assert_response :success
  end

  test "should create request_material" do
    assert_difference('RequestMaterial.count') do
      post request_materials_url, params: { request_material: { date: @request_material.date, job_order_id: @request_material.job_order_id, serial: @request_material.serial } }
    end

    assert_redirected_to request_material_url(RequestMaterial.last)
  end

  test "should show request_material" do
    get request_material_url(@request_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_material_url(@request_material)
    assert_response :success
  end

  test "should update request_material" do
    patch request_material_url(@request_material), params: { request_material: { date: @request_material.date, job_order_id: @request_material.job_order_id, serial: @request_material.serial } }
    assert_redirected_to request_material_url(@request_material)
  end

  test "should destroy request_material" do
    assert_difference('RequestMaterial.count', -1) do
      delete request_material_url(@request_material)
    end

    assert_redirected_to request_materials_url
  end
end
