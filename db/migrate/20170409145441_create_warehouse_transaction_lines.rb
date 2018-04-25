class CreateWarehouseTransactionLines < ActiveRecord::Migration[5.0]
  def change
    create_table :warehouse_transaction_lines do |t|
      t.integer :warehouse_transaction_id, index: true
      t.integer :raw_material_warehouse_id, index: true
      t.integer :quantity
      t.integer :required_quantity
      t.integer :unit
      t.string  :suppliers

      t.timestamps
    end
  end
end
