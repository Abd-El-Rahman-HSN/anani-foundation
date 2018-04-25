require 'test_helper'

class WorkshopSalariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workshop_salary = workshop_salaries(:one)
  end

  test "should get index" do
    get workshop_salaries_url
    assert_response :success
  end

  test "should get new" do
    get new_workshop_salary_url
    assert_response :success
  end

  test "should create workshop_salary" do
    assert_difference('WorkshopSalary.count') do
      post workshop_salaries_url, params: { workshop_salary: { date: @workshop_salary.date, location_id: @workshop_salary.location_id, workshop_id: @workshop_salary.workshop_id } }
    end

    assert_redirected_to workshop_salary_url(WorkshopSalary.last)
  end

  test "should show workshop_salary" do
    get workshop_salary_url(@workshop_salary)
    assert_response :success
  end

  test "should get edit" do
    get edit_workshop_salary_url(@workshop_salary)
    assert_response :success
  end

  test "should update workshop_salary" do
    patch workshop_salary_url(@workshop_salary), params: { workshop_salary: { date: @workshop_salary.date, location_id: @workshop_salary.location_id, workshop_id: @workshop_salary.workshop_id } }
    assert_redirected_to workshop_salary_url(@workshop_salary)
  end

  test "should destroy workshop_salary" do
    assert_difference('WorkshopSalary.count', -1) do
      delete workshop_salary_url(@workshop_salary)
    end

    assert_redirected_to workshop_salaries_url
  end
end
