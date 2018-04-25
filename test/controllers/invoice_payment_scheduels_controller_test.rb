require 'test_helper'

class InvoicePaymentScheduelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invoice_payment_scheduels_index_url
    assert_response :success
  end

  test "should get new" do
    get invoice_payment_scheduels_new_url
    assert_response :success
  end

  test "should get create" do
    get invoice_payment_scheduels_create_url
    assert_response :success
  end

  test "should get edit" do
    get invoice_payment_scheduels_edit_url
    assert_response :success
  end

  test "should get update" do
    get invoice_payment_scheduels_update_url
    assert_response :success
  end

  test "should get destroy" do
    get invoice_payment_scheduels_destroy_url
    assert_response :success
  end

end
