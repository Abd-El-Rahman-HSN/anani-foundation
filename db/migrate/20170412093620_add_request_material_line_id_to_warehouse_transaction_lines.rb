class AddRequestMaterialLineIdToWarehouseTransactionLines < ActiveRecord::Migration[5.0]
  def change
    add_column :warehouse_transaction_lines, :request_material_line_id, :integer, index: true
  end
end
