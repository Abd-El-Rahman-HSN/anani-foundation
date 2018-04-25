require 'test_helper'

class WarehouseTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse_transaction = warehouse_transactions(:one)
  end

  test "should get index" do
    get warehouse_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_transaction_url
    assert_response :success
  end

  test "should create warehouse_transaction" do
    assert_difference('WarehouseTransaction.count') do
      post warehouse_transactions_url, params: { warehouse_transaction: { date: @warehouse_transaction.date, serial: @warehouse_transaction.serial, status: @warehouse_transaction.status } }
    end

    assert_redirected_to warehouse_transaction_url(WarehouseTransaction.last)
  end

  test "should show warehouse_transaction" do
    get warehouse_transaction_url(@warehouse_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_transaction_url(@warehouse_transaction)
    assert_response :success
  end

  test "should update warehouse_transaction" do
    patch warehouse_transaction_url(@warehouse_transaction), params: { warehouse_transaction: { date: @warehouse_transaction.date, serial: @warehouse_transaction.serial, status: @warehouse_transaction.status } }
    assert_redirected_to warehouse_transaction_url(@warehouse_transaction)
  end

  test "should destroy warehouse_transaction" do
    assert_difference('WarehouseTransaction.count', -1) do
      delete warehouse_transaction_url(@warehouse_transaction)
    end

    assert_redirected_to warehouse_transactions_url
  end
end
