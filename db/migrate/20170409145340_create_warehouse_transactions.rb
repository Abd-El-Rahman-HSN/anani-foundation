class CreateWarehouseTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :warehouse_transactions do |t|
      t.integer :request_material_id, index: true
      t.date :date
      t.string :serial
      t.integer :status

      t.timestamps
    end
  end
end
