require 'test_helper'

class ProductionPhasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production_phase = production_phases(:one)
  end

  test "should get index" do
    get production_phases_url
    assert_response :success
  end

  test "should get new" do
    get new_production_phase_url
    assert_response :success
  end

  test "should create production_phase" do
    assert_difference('ProductionPhase.count') do
      post production_phases_url, params: { production_phase: { initial_letter: @production_phase.initial_letter, main_material: @production_phase.main_material, phase_no: @production_phase.phase_no } }
    end

    assert_redirected_to production_phase_url(ProductionPhase.last)
  end

  test "should show production_phase" do
    get production_phase_url(@production_phase)
    assert_response :success
  end

  test "should get edit" do
    get edit_production_phase_url(@production_phase)
    assert_response :success
  end

  test "should update production_phase" do
    patch production_phase_url(@production_phase), params: { production_phase: { initial_letter: @production_phase.initial_letter, main_material: @production_phase.main_material, phase_no: @production_phase.phase_no } }
    assert_redirected_to production_phase_url(@production_phase)
  end

  test "should destroy production_phase" do
    assert_difference('ProductionPhase.count', -1) do
      delete production_phase_url(@production_phase)
    end

    assert_redirected_to production_phases_url
  end
end
